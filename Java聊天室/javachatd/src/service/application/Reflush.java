package service.application;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.access.obj.DAO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import pojo.VIPPOJO;

/**
 * Servlet implementation class Reflush
 */
@WebServlet("/Reflush")
public class Reflush extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Reflush() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset:utf-8");
		String nickname=(String)request.getSession().getAttribute("nickname");
		VIPPOJO pojo =DAO.selectVIP(nickname);
		JSONArray  jarr=new JSONArray();
		JSONObject jobj=new JSONObject();
		request.getSession().setAttribute("info",pojo.getInfo());
		jobj.put("info",pojo.getInfo());
		jarr.add(jobj);
		PrintWriter pw=response.getWriter();
		pw.print(jarr.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
