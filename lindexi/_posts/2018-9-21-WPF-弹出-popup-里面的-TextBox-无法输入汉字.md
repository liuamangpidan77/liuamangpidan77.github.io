---
title: "WPF 弹出 popup 里面的 TextBox 无法输入汉字"
author: lindexi
date: 2018-9-21 17:27:21 +0800
CreateTime: 2018-2-13 17:23:3 +0800
categories: WPF
---

这是一个 wpf 的bug，在弹出Popup之后，如果 Popup 里面有 TextBox ，这时无法在里面输入文字。

<!--more-->


<!-- csdn -->

因为 Popup 的句柄具有 WS_EX_NOACTIVATE 的特性，所以 Popup 是无法获得焦点。在微软的系统，所有的窗口、控件都是有句柄，句柄就是一个指针，获得他才知道是哪个控件。

古老的输入法就是通过判断获得焦点的句柄是支持输入和判断他需要什么输入，如果在 win7 的搜狗，就是这样判断，于是搜狗很难在 Popup 的 TextBox 输入文字。

这个问题实际很好解决，最简单的方法是把程序修改为 .net 4.6.2 以上，这个 bug 已经在 .net 4.6.2 修复了。或者升级到 win10 系统。如果刚好两个方法都不能使用，那么通过代码也可以解决。

解决的方法是让输入法知道控件的句柄，这需要一个 win32 的 dll ，传说中的 User32.dll ，这个dll有`SetFocus`这个方法，请通过下面的代码在Popup打开时调用。代码的 ThePopup 就是需要打开的。

```csharp
[DllImport("User32.dll")]
public static extern IntPtr SetFocus(IntPtr hWnd);

IntPtr GetHwnd(Popup popup)
{
    HwndSource source = (HwndSource)PresentationSource.FromVisual(popup.Child);
    return source.Handle;
}

private void ShowPopupButtonClick(object sender, RoutedEventArgs e)
{
    ThePopup.IsOpen = true;
    IntPtr handle = GetHwnd(ThePopup);
    SetFocus(handle);
}

```

这是一个简单的方法。当然还有另一个方法，使用`SetForegroundWindow`方法。

```csharp
[DllImport("USER32.DLL")]
[return: MarshalAs(UnmanagedType.Bool)]
public static extern bool SetForegroundWindow(IntPtr hWnd);
 
public static void ActivatePopup(Popup popup)
{
    HwndSource source = (HwndSource)PresentationSource.FromVisual(popup.Child);
    IntPtr handle = source.Handle;
 
    SetForegroundWindow(handle);
}
```

参见：[https://www.codeproject.com/Questions/184429/Text-box-is-not-working-in-WPF-Popup](https://www.codeproject.com/Questions/184429/Text-box-is-not-working-in-WPF-Popup )

如果发现使用了我的方法还是无法输入，那么需要看一下 TextBox 是否禁用输入法。

```csharp
 InputMethod.SetIsInputMethodSuspended
```

和这个类的其他属性都可以设置输入法，请尝试修改他的值。

这个问题已经反馈 https://connect.microsoft.com/VisualStudio/feedback/details/389998/wpf-popup-messes-with-ime-switching ，微软已经修复

## 修复在 Popup 输入法不跟随

在 Popup 里的 TextBox 输入可能出现输入法未跟随编辑框，这时需要调用 Win32 的方法

```csharp
[DllImport("User32.dll")]
public static extern IntPtr SetFocus(IntPtr hWnd);

IntPtr GetHwnd(Popup popup)
{
    HwndSource source = (HwndSource)PresentationSource.FromVisual(popup.Child);
    return source.Handle;
}
```

在 TextBox 获得焦点的时候调用下面代码

```csharp
xxPopup.GotFocus += Popup_GotFocus;

        private void Popup_GotFocus(object sender, RoutedEventArgs e)
        {
            // WPF BUG Fix：TextBox 在 Popup 中，IME 备选框不跟随
            Win32.SetFocus(GetHwnd(RenamePopup.Child));
        }

```

