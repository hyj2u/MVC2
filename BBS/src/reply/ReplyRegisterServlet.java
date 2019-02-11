package reply;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ReplyRegisterServlet")
public class ReplyRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String writer = request.getParameter("br_writer");
		String content = request.getParameter("br_content");
		int sabun = Integer.parseInt(request.getParameter("sabun"));
		response.getWriter().write(register(writer,content, sabun)+"");
	
	}
	public int register(String writer, String content, int sabun) {
		Reply reply = new Reply();
		reply.setBr_writer(writer);
		reply.setBr_content(content);
		reply.setBr_sabun(sabun);
		int check=new ReplyDAO().insertReply(reply);
		System.out.println("check="+check);
		return check;
	}

}
