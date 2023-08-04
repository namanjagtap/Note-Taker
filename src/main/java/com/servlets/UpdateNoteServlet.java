package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;


public class UpdateNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int noteId = Integer.parseInt(request.getParameter("note_id").trim());
			Session s = FactoryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();
			Note note = (Note)s.get(Note.class, noteId);
			note.setTitle(title);
			note.setContent(content);
			note.setAddedDate(new Date());
			tx.commit();
			s.close();
			response.sendRedirect("all_notes.jsp");
//			PrintWriter out = response.getWriter();
//			out.println("<h1 style='text-align: center;'>Note added successfully</h1>");
//			out.println("<h1 style='text-align: center;'><a href='all_notes.jsp'>View all notes</a></h1>");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
