package service.application;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.access.obj.DAO;
import pojo.VIPPOJO;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickname =request.getParameter("nickname");
		String password=request.getParameter("password");
		int i=0;
		if(DAO.selectVIP(nickname).getPassword().equals(password)){
			i=1;
			HttpSession session =request.getSession();
			session.setAttribute("nickname", nickname);
			session.setAttribute("info",DAO.selectVIP(nickname).getInfo());
			List<VIPPOJO> viparr=DAO.selectAll();
			for (int i1 = 0; i1 < viparr.size(); i1++) {
				if (viparr.get(i1).getNickname().equals(nickname)) {
					viparr.remove(i1);
				}
			}
			session.setAttribute("viparr",viparr);
		}else{
			i=-1;
		}
		PrintWriter pw=response.getWriter();
		pw.print(i);
		pw.flush();
		pw.close();
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
