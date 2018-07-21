package service.application;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.access.obj.DAO;

/**
 * Servlet implementation class Select
 */
@WebServlet("/Select")
public class Select extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Select() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickname=request.getParameter("nickname");
		System.out.println("s-app层查询"+nickname);
		String s=DAO.selectVIP(nickname).getNickname();
		int i=0;
		if(s==null||!s.equals(nickname)){
			//数据库没有有此用户
			i=-1;
		}else{
			i=1;
		}
		System.out.println(i);
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
