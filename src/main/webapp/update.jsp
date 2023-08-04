<%@page import="com.entities.Note"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_js_css.jsp"%>
</head>
<body id="bgimg">
	<div class="container">
		<%@include file="navbar.jsp"%>
		<h1 style="padding: 15px; margin-top: 20px">Please Edit your
			note details</h1>
		<!-- this is add form -->
		<%
			int noteId = Integer.parseInt(request.getParameter("note_id").trim());
			Session s = FactoryProvider.getFactory().openSession();
			Note note = (Note)s.get(Note.class, noteId);
			
		%>
		<form action="UpdateNoteServlet" method="post" style="padding: 20px">
			<input value="<%= note.getId() %>" name="note_id" type="hidden"/>
			<div class="form-group">
				<label for="title">Note Title</label>
				<input
					name="title"
					type="text"
					class="form-control"
					id="title"
					aria-describedby="emailHelp"
					placeholder="Enter title"
					value="<%= note.getTitle() %>"
					required
				/>
			</div>
			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea
					name="content"
					placeholder="Enter your content here"
					class="form-control"
					id="content"
					style="height: 200px"
					required
				><%= note.getContent() %></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-success">Save Note</button>
			</div>
		</form>
	</div>
</body>
</html>