package service.application;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.access.obj.ChatDAO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import pojo.ChatPOJO;

/**
 * Servlet implementation class SelectMessage
 */
@WebServlet("/SelectMessage")
public class SelectMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectMessage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset:utf-8");
		
		String host=request.getParameter("host");
		String talkname=request.getParameter("talkname");
		
		
		List<ChatPOJO> arr = ChatDAO.receiveMessage(host, talkname);
		
		if(arr.size()!=0){
			JSONArray jsarr=new JSONArray();
			for(ChatPOJO p:arr){
				jsarr.add(p);
			}
			PrintWriter pw=response.getWriter();
			pw.print(jsarr.toString());
			System.out.println(jsarr.toString());
		}else {
			PrintWriter pw=response.getWriter();
			pw.print(0);
		}
		
		
	
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
