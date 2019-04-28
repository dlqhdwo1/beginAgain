<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="user.UserDAO" %>
    <%@page import="java.io.PrintWriter" %>
    <% request.setCharacterEncoding("UTF-8"); %>
    <jsp:useBean id = "user" class = "user.User" scope = "page"/>
    <jsp:setProperty name = "user" property="userID"/>
      <jsp:setProperty name = "user" property="userPassword"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content = "text/html;charset=UTF-8">

<title>JSP 게시판 웹사이트</title>
</head>
<body>
<%
String userID= null;
if(session.getAttribute("userID")!=null){
	userID = (String)session.getAttribute("userID");
}
if(userID != null){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('이미 로그인이 되어있습니다.')");
	script.println("location.href='main.jsp'");
	script.println("</script>");
	
}

UserDAO userDAO = new UserDAO(); //UserDAO 객채 변수 userDAO 참조변수 선언.
int result = userDAO.login(user.getUserID(),user.getUserPassword());//RESULT 변수에 USERDAO객체 LOGIN 매서드 매개변수받은 결과값 저장.
if(result ==1) // RESULT 값이 1일때 수행.
{
	session.setAttribute("userID",user.getUserID());
	PrintWriter script = response.getWriter(); 
	script.println("<script>");
	script.println("location.href='main.jsp'");
	script.println("</script>");
}
else if(result == 0 )
{
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('비밀번호가 틀립니다.')");
	script.println("history.back()");
	script.println("</script>");
}
else if(result == -1 )
{
	PrintWriter script = response.getWriter();  //자바 스크립트 변수 script선언 
	script.println("<script>");  // 자바스크립타 사용하기위해 선언 
	script.println("alert('존재하지않는 아이디입니다.')");// 알림창 선언. 
	script.println("history.back()");  // 다시 원래 화면으로 돌아오도록 history.back()선언
	script.println("</script>"); // 스크립트 종료 
}
else if(result == -2 )
{
	PrintWriter script = response.getWriter();
	script.println("<script>"); //result == -1 과동일. 
	script.println("alert('데이터베이스 오류입니다.')");
	script.println("history.back()");
	script.println("</script>");
}
%>


</body>
</html>