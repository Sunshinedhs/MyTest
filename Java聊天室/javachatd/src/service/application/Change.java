package service.application;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import data.access.obj.DAO;

/**
 * Servlet implementation class Change
 */
@WebServlet("/Change")
public class Change extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Change() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int i=0;
		String nickname =request.getSession().getAttribute("nickname").toString();
		String filepath =getServletContext().getRealPath("/")+"images";
		File f =new File(filepath);
		if(!f.exists()){
			f.mkdirs();           
		}
		
		Date date =new Date();
		SimpleDateFormat sf=new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss");
		String now =sf.format(date);
		String ext=null;
		SmartUpload su =new SmartUpload();
		su.initialize(getServletConfig(), request, response);
		su.setAllowedFilesList("jpg,png,gif");
		su.setMaxFileSize(1024*1024*2);
		try {
			su.upload();
			if(su.getFiles().getSize()!=0){
				com.jspsmart.upload.File file=su.getFiles().getFile(0);
				ext=file.getFileExt();
				file.saveAs(filepath+"\\"+"user_"+nickname+"_"+now+"."+ext);
				System.out.println(filepath+"\\"+"user_"+nickname+"_"+now+"."+ext);
				String newinfo ="images"+"/"+"user_"+nickname+"_"+now+"."+ext;
				DAO.updateInfo(nickname, newinfo);
				i=9;
			}else{
				i=0;
			}
		} catch (SmartUploadException e) {
			System.out.println(e.getMessage());
			throw new RuntimeException("上传失败");	
		}
		
		String newpassword =su.getRequest().getParameter("newpassword");
		//i=1都没修改，  i=10修改了头像， i=100只修改密码  i=1000都修改，
		if(newpassword.length()==0){
			i=i+1;
		}else {
			DAO.updatePassword(nickname, newpassword);
			if(i==9){
				i=i+91;
			}else if(i==0){
				i=i+100;
			}
			
		}
		System.out.println(i);
		
		PrintWriter pw=response.getWriter();
		pw.print(i);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
