<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
request.setAttribute("path", basePath);  
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<title>关于我</title>
	<link href="${path }css/index.css" rel="stylesheet" type="text/css">
	<link href="${path }css/about.css" rel="stylesheet" type="text/css">
	<script src="../js/index.js" type="text/javascript" charset="gb2312"></script>
	</head>
	<body onLoad="displayCD()">
		<header>
			<div id="logo">
				<a href="/"></a>
			</div>
			<nav class="topnav" id="topnav">
		  	  <a href="${path}servlet/DoIndex"><span>首页</span><span class="en">Home Page</span></a>
		  	  <a href="${path }jsp/about.jsp"><span>关于我</span><span class="en">About Me</span></a>
		  	  <a href="${path }servlet/GetTitleListServlet"><span>技术干货</span><span class="en">Life</span></a>
		  	  <a href="${path }jsp/knowledge.jsp"><span>资料分享</span><span class="en">Learn</span></a>
		  	  <a href="${path }servlet/GetDiaryListServlet"><span>碎言碎语</span><span class="en">Diary</span></a>
		  	  <a href="${path }jsp/photo.jsp"><span>精彩相册</span><span class="en">Photo</span></a>
		  	  <a href="${path}jsp/message_board.jsp"><span>留言板</span><span class="en">Board</span></a>
		  	</nav>
		</header>
		<article class="aboutcon">
			<h1 class="t_nav">
					<span>像“草根”一样，紧贴着地面，低调的存在，冬去春来，枯荣无恙。</span>
					<a href="index.html" class="n1">网站首页</a>
					<a href="about.html" class="n2">关于我</a>
			</h1>
			<div class="about left">
		  	<h2>Just about me</h2>
		    <ul> 
			    <p>为人朴实正直，有积极进取的心态，努力拼搏。性格沉稳内敛，做事细心踏实，个性坚韧，能吃苦耐劳，对工作有很强的责任感！有很强进取心和团队协作精神，学习能力、适应能力、承受压力能力较强，善于挑战自我。能够胜任今后的工作，并在实践中不断学习进步!
我不认为我比其他人都强，但我有自信做到比其他人强。 简历自我介绍一：</p>
				<p>
				本人性格开朗、稳重、有活力，待人热情、真诚；工作认真负责，积极主动，能吃苦耐劳，用于承受压力，勇于创新；有很强的组织能力和团队协作精神，具有较强的适应能力；纪律性强，工作积极配合；意志坚强，具有较强的无私奉献精神。 对待工作认真负责，善于沟通、协调有较强的组织能力与团队精神；活泼开朗、乐观上进、有爱心并善于施教并行；上进心强、勤于学习能不断提高自身的能力与综合素质。在未来的工作中，我将以充沛的精
力，刻苦钻研的精神来努力工作，稳定地提高自己的工作能力，与企业同步发展。</p>
				<p>本人乐观开朗, 积极好学,健谈,有自信,具有设计的创新思想;对待工作认真负责,细心,能够吃苦耐劳,敢于挑战,并且能够很快融于集体。
					思想上积极要求上进，团结同学，尊敬师长，乐于助人，能吃苦耐劳，为人诚恳老实，性格开朗善于与人交际，工作上有较强的组织管理和动手能力，集体观念强，具有团队协作精神，创新意识。</p>
				<p>
				忠实诚信,讲原则，说到做到，决不推卸责任；有自制力，做事情始终坚持有始有终，从不半途而废；肯学习,有问题不逃避,愿意虚心向他人学习；自信但不自负,不以自我为中心；愿意以谦虚态度赞扬接纳优越者,权威者；会用100%的热情和精力投入到工作中；平易近人。为人诚恳，性格开朗，积极进取，适应力强、勤奋好学、脚踏实地，有较强的团队精神，工作积极进取，态度认真。
				</p>
		    </ul>
		    <h2>　　　　　　　　</h2>
				    <p>　　</a></p>
				    <p>　</p>
				    <p>　</p>
				    <p>　</p>
				</div>
				<aside class="right">  
				    <div class="about_c" id="showCD">
				    <p>姓名：<span>阮杨斌</span></p>
				    <p>生日：1996-01-13</p>
				    <p>籍贯：浙江省―台州市</p>
				    <p>现居：元培学院-信息与电气工程学院</p>
				    <p>职业：学生</p>
				    <p>喜欢的书：《最伟大的推销员》</p>
				</div>
					<div class="about_me"></div>
				</aside>
		</article>
		<footer>
				<p>&nbsp;&nbsp;姓名:阮杨斌&nbsp;&nbsp;学号:0701150215</p>
		</footer>
	</body>
</html>