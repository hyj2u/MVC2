package net.ad.mvc.schedule;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.ad.schedule.scheduleDAO;

/**
 * Servlet implementation class deleteScheduleController
 */
@WebServlet("/deleteScheduleController")
public class deleteScheduleController extends HttpServlet {
   private static final long serialVersionUID = 1L;
    
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      HttpSession session = request.getSession();
      
      request.setCharacterEncoding("utf-8");
      response.setContentType("text/html;charset=UTF-8"); 
      response.setCharacterEncoding("utf-8");
       
      PrintWriter out=response.getWriter();
      
      String id = (String)session.getAttribute("id");
      String title = request.getParameter("title");
      String teacher =request.getParameter("teacher");
      
      scheduleDAO dao = new scheduleDAO();
      
      int flag = dao.delete_schedule(id,title,teacher);
      if (flag != -1) {
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('삭제에 성공했습니다.')");
         script.println("location.href='timetable.jsp'");
         script.println("</script>");
           

      } else {
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('삭제에 실패하였습니다.')");
         script.println("histroy.back();'");
         script.println("</script>");
         
      }
      }
   

}