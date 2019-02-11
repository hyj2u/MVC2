package user;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserSearchServlet
 */
@WebServlet("/UserSearchServlet")
public class UserSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String name = request.getParameter("name");
		response.getWriter().write(getJSON(name));
	}

	public String getJSON(String name) {
		if(name==null)
			name="";
		StringBuffer result= new StringBuffer("");
		result.append("{\"result\":[");
		UserDAO userDAO = new UserDAO();
		ArrayList<User> userList = userDAO.search(name);
		for(int i=0; i<userList.size(); i++) {
			result.append("[{\"value\": \""+userList.get(i).getNo()+"\"},");
			result.append("{\"value\": \""+userList.get(i).getSabun()+"\"},");
			result.append("{\"value\": \""+userList.get(i).getName()+"\"},");
			result.append("{\"value\": \""+userList.get(i).getTitle()+"\"},");
			result.append("{\"value\": \""+userList.get(i).getWdate()+"\"}],");
		}
		result.append("]}");
		System.out.println(result.toString());
		return result.toString();
	}

}
