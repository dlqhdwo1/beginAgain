
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="user.UserDAO" %>
    <%@page import="java.io.PrintWriter" %>
    <% request.setCharacterEncoding("UTF-8"); %>
    <jsp:useBean id = "user" class = "user.User" scope = "page"/>
    <jsp:setProperty name = "user" property="userID"/>
      <jsp:setProperty name = "user" property="userPassword"/>
         <jsp:setProperty name = "user" property="userName"/>
            <jsp:setProperty name = "user" property="userGender"/>
               <jsp:setProperty name = "user" property="userEmail"/>
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
if(userID!=null){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('이미 로그인이 되어있습니다.')");
	script.println("location.href='main.jsp'");
	script.println("</script>");
	
}

if(user.getUserID() ==null || user.getUserPassword()==null||user.getUserEmail()==null||user.getUserGender() ==null || user.getUserName() ==null){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('입력이 안된 사항이 있습니다.')");
	script.println("history.back()");
	script.println("</script>");
	
}else {
	UserDAO userDAO = new UserDAO(); //UserDAO 객채 변수 userDAO 참조변수 선언.
	int result = userDAO.join(user);//RESULT 변수에 USERDAO객체 LOGIN 매서드 매개변수받은 결과값 저장.
	if(result ==-1) // RESULT 값이 1일때 수행.
	{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디입니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	else 
	{
		session.setAttribute("userID",user.getUserID());
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='main.jsp'");

		script.println("</script>");
	}

	
}
%>
</body>
</html>