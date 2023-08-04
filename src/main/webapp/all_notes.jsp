<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="jakarta.persistence.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NoteTaker: All Notes</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container" style="height: 100vh;">
		<%@include file="navbar.jsp"%>
		<h1 style="padding:15px; margin-top: 20px">All Notes</h1>
		<div class="row" style="padding: 0px 20px 0px 20px" >
			<div class="col-12">		
				<%
					Session s = FactoryProvider.getFactory().openSession();
					Query q = s.createQuery("from Note");
					List<Note> list = q.getResultList();
					for(Note note:list){
				%>
						<div class="card border-dark mt-3">
						    <img class="card-img-top ml-3 mt-3" style="max-width: 25px;" src="img/note_icon.png" alt="Card image cap">
						  <div class="card-body pt-2">
						    <h5 class="card-title"><%= note.getTitle() %></h5>
						    <p class="card-text"><%= note.getContent() %></p>
						    <div class="container text-center mt-4 mb-2">
						    	<a href="update.jsp?note_id=<%= note.getId() %>" class="btn btn-primary purple">Update</a>
						    	<a href="DeleteNoteServlet?note_id=<%= note.getId() %>" class="btn btn-danger">Remove</a>
						    </div>
						  </div>
						</div>		
				<%
					}
					s.close();
				%>
			</div>
		</div>
	</div>
</body>
</html>