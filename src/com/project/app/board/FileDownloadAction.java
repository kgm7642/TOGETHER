package com.project.app.board;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;

public class FileDownloadAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		//서버에 저장되어 있는 파일의 이름(테스트1.txt)
		String systemname = req.getParameter("filename");
		//그 파일을 올릴때의 이름(테스트.txt)
		String orgname = req.getParameter("orgname");
		//파일이 저장되어 있는 폴더
		String saveFolder = "D:\\web_file";
		
		//D:\web_file\테스트1.txt
		String filename = saveFolder+"\\"+systemname;
		
		//다운로드를 위한 통로 역할
		InputStream is = null;	//파일을 읽어올 통로
		OutputStream os = null; //파일을 써줄 통로
		
		//다운받으려는 파일을 자바로 객체로 가져옴
		File file = new File(filename);
		
		//file 객체를 읽어오기 위한 통로 개설
		is = new FileInputStream(file);
		
		//다운로드를 요청한 사용자의 로컬 정보가 담긴 헤더
		String client = req.getHeader("User-Agent");
		resp.reset();
		
		//파일 다운로드를 해줄 준비, 세팅
		resp.setContentType("application/octet-stream");
		resp.setHeader("Content-Description", "JSP Generated Data");
		
		String dwName = "";
//		....%A2%20%C2...+???
		try {
			try {
				//orgname과 systemname이 동일하지 않다는 뜻
				dwName = URLEncoder.encode(orgname,"UTF-8").replaceAll("\\+", "%20");
			} catch (Exception e) {
				//orgname과 systemname이 동일하다는 뜻
				dwName = URLEncoder.encode(file.getName(),"UTF-8").replaceAll("\\+", "%20");
			}
			//dwName은 원래의 orgname을 가지고 있다.
			
			//클라이언트의 로컬정보를 담은 client 안에 MSIE 문자열이 포함되어 있는지를 비교(있으면 -1이 아니고, 없으면 -1)
			if(client.indexOf("MSIE") != -1) {
				//MSIE 인 경우
				resp.setHeader("Content-Disposition", "attachment; fileName="+orgname);
			}else {
				//그 외
				resp.setHeader("Content-Disposition", "attachment; fileName=\""+orgname+"\"");
				resp.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
			}
			resp.setHeader("Content-Length", file.length()+"");
			
			//파일을 사용자의 컴퓨터에 써주기 위한 통로 개설
			os = resp.getOutputStream();
			
			//파일을 바이트단위로 쪼개서 담아줄 배열
			byte[] b= new byte[(int)file.length()];
			int leng=0;
			//파일의 끝이 오기 전까지 반복하며 읽는다
			while((leng = is.read(b,0,b.length)) != -1) {
				//읽어온 정보(파일의 데이터)를 os 통로를 통해 사용자의 컴퓨터에 써주기
				os.write(b,0,leng);
			}
		} catch (Exception e) {
			System.out.println("FileDownloadAction : "+e);
		} finally {
			//열려있는 통로들 전부 닫기
			if(is!=null) {
				is.close();
			}
			if(os!=null) {
				os.close();
			}
		}
		
		return null;
	}
}








