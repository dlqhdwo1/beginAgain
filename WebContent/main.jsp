<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.io.PrintWriter" %>
<!DOCTYPE html>

<html lang="UTF-8" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>Charter 5 </title>
    <link href="https://fonts.googleapis.com/css?family=Henny+Penny" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Times New Roman',serif;
        }
        li{list-style:none;}
        a {
            text-decoration: none;
        }
        img{border:0;}

    </style>

    <style>
        #main_header{
            width: 960px;
            margin:0 auto;
            height: 160px;
            position:relative;
        }
        #main_header>#title{
            position:absolute;
            left:20px; top:30px;
        }
        #main_header>#main_gnb{
            position:absolute;
            right:0; top:0;
        }
        #main_header>#main_lnb{
            position:absolute;
            right:0; bottom:10px;
        }

    </style>

    
    <style>
        #title{
            font-family:'Henny Penny',cursive;
        }

    </style>
    <style>
        #main_gnb > ul {
            overflow: hidden;
        }
            #main_gnb > ul > li {
                float: left;
            }
                #main_gnb > ul > li > a {
                    display:block;
                    padding: 2px 10px;
                    border: 1px solid black;
                }
                #main_gnb>ul>li>a:hover{
                    background:black;
                    color:white;
                }
                #main_gnb>ul>li:first-child>a{border-radius:10px 0 0 10px;}
                #main_gnb > ul > li:last_child > a {
                    border-radius: 0 10px 10px 0;
                }
    

    </style>
    <style>
        #main_lnb > ul {
            overflow: hidden;
        }
            #main_lnb > ul > li {
                float: left;
            }
                #main_lnb > ul > li > a {
                    display:block;
                    padding:10px 20px;
                    border:1px solid black;
                }
                #main_lnb>ul>li>a:hover{
                    background:black;
                    color:white;
                }
                #main_lnb > ul > li:first-child > a {
                    border-radius: 10px 0 0 10px;
                }
                #main_lnb > ul > li:last-child > a {
                    border-radius: 0 10px 10px 0;
                }


    </style>
    <style>

        #content{
            width:960px;
            margin: 0 auto;
            overflow:hidden;
        }
        #content>#main_section{
            width:750px;
            float:left;
        }
        #content>#main_aside{
            width:200px;
            float:right;
        }
    </style>
    <style>

        #main_section>article.main_article{
            margin-bottom:10px;
            padding: 20px;
            border:1px solid black;
        }
    </style>
    <style>
        input:nth-of-type(1) {
            display: none;
        }
        input:nth-of-type(1) ~ div:nth-of-type(1) {
            display: none;
        }
        input:nth-of-type(1):checked ~ div:nth-of-type(1) {
            display: block;
        }
        input:nth-of-type(2) {
            display: none;
        }
        input:nth-of-type(2) ~ div:nth-of-type(2) {
            display: none;
        }
        input:nth-of-type(2) ~ div:nth-of-type(2) {
            display: block;
        }

        section.buttons {overflow:hidden;
        }
            section.buttons > label {
                display:block; float:left;
                width:100px; height=30px;
                line-height=30px;
                text-align=center;

                box-sizing:border-box;
                border:1px solid black;

                background:black;
                color:white;

            }
            input:nth-of-type(1):checked~section.buttons>label:nth-of-type(1){
                background:white;
                color:black;



            }
        input:nth-of-type(2):checked ~ section.buttons > label:nth-of-type(2) {
            background:white;
            color:black;
        }


    </style>
    <style>
        #main_footer{
           width:960px; margin:0 auto;
           margin-bottom:10px;

           box-sizing:border-box;
           padding:10px;
           border:1px solid black;

           text-align:center;
        }

    </style>
    <style></style>
</head>
<body>
    <%
    String userID = null;
    if(session.getAttribute("userID")!=null){
    userID=(String)session.getAttribute("userID");
    }
    %>

    <header id="main_header">
        <div id="title">
            <h1>Shinhan University Study</h1>
            <h2>WebProgramming StudyCafe</h2>

        </div>

        <%
        if(userID ==null){
        %>
        <nav id="main_gnb">
            <ul>
                <li><a href="login.jsp">Login</a></li>
                <li><a href="logoutAction.jsp">Logout</a></li>
                <li><a href="join.jsp">Join</a></li>
                <li><a href="#">Information</a></li>
                <li><a href="#">Activy</a></li>

            </ul>

        </nav>
        <%
        }else{
        %>
        <nav id="main_gnb">
            <ul>
                <li><a href="logoutAction.jsp">Logout</a></li>
                <li><a href="#">Information</a></li>
                <li><a href="#">Activy</a></li>

            </ul>
            <%
            }
            %>

           <nav id="main_lnb">
            <ul>
                <li><a href="main.jsp">메인</a></li>
                <li><a href="bbs.jsp">게시판</a></li>
                <li><a href="#">코딩게시판</a></li>
                <li><a href="#">묻고답하기</a></li>
                <li><a href="#">피드백</a></li>

            </ul>

        </nav>

     
    </header>


    <div id="content">


        <h1>Shinhan group study</h1>

        <p>이 사이트는 신한대학교 프로젝트를위해 만든 스터디사이트입니다.</p>
        <section id="main_section">
            <article class="main_article">
                <h1>Lee Seung Joo</h1>
                <p>신한대학교 ppt동아리에 수장이며 신한대학교 프로젝트 조장이다.</p>
                
            </article>
            <article class="main_article">
                <h1>Lee unho</h1>
                <p>신한대학교 ppt동아리원이며 신한대학교 프로젝트 막내이다.</p>
            </article>
            <article class="main_article">
                <h1>Lee Jung Gue</h1>
                <p>신한대학교 학생이며 신한대학교 프로젝트 멤버이다.</p>

            </article>


        </section>
        <aside id="main_aside">
            <input id="first" type="radio" name="tab" checked="checked"/>
            <input id="second" type="radio" name="tab"/>
            <section class="buttons">
                <label for="first">최근활동들</label>
                <label for="second">최근활동들</label>

            </section>
            <div class="tab_item">
                <ul>
                    <li><a href="#">2019-01-28</a></li>
                    <li><a href="#">2019-01-29</a></li>
                    <li><a href="#">2019-01-30</a></li>
                    <li><a href="#">2019-01-31</a></li>
                </ul>

            </div>
            <div class="tab_item">
                <ul>
                    <li><a href="#">2019-01-31</a></li>
                    <li><a href="#">2019-01-31</a></li>
                    <li><a href="#">2019-01-31</a></li>
                    <li><a href="#">2019-01-31</a></li>  
                </ul>
            </div>
          
        </aside>
    </div>
   
    <footer id="main_footer">
        <h3>대표 이승주 </h3>
        <address>ShinhanStudy Group</address>

    </footer>
</body>
</html>