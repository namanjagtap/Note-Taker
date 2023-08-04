<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Notes</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container" style="height: 100vh;">
		<%@include file="navbar.jsp"%>
		<h1 style="padding:15px; margin-top: 20px">Please enter your note details</h1>
		<!-- this is add form -->
		<form action="SaveNoteServlet" method="post" style="padding: 20px">
			<div class="form-group">
				<label for="title">title</label>
				<input
					name="title"
					type="text"
					class="form-control"
					id="title"
					aria-describedby="emailHelp"
					placeholder="Enter title"
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
					style="height:200px"
					required
					></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-primary">Add Note</button>
			</div>
		</form>
	</div>
</body>
</html>