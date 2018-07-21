package service.application;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.access.obj.ChatDAO;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class SendMessage
 */
@WebServlet("/SendMessage")
public class SendMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMessage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Date data=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time =sdf.format(data);
		String content =request.getParameter("content");
		String send =request.getParameter("send");
		String receive =request.getParameter("receive");
		int a =ChatDAO.sendMessage(content, send, receive, time);
		if(a!=0){
			JSONObject jobj=new JSONObject();
			jobj.put("time", time);
			PrintWriter pw=response.getWriter();
			pw.print(jobj.toString());
		}else{
			PrintWriter pw=response.getWriter();
			pw.print(a);
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
