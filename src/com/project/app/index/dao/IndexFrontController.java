package com.project.app.index.dao;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.ActionForward;
import com.project.app.index.indexAction;

public class IndexFrontController  extends HttpServlet{
      private static final long serialVersionUID = 1L;

      @Override
      protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         req.setCharacterEncoding("UTF-8");
         resp.setCharacterEncoding("UTF-8");
         doProcess(req, resp);
      }
      @Override
      protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         doProcess(req, resp);
      }
      
      protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         //길나누는 코드
         String requestURI = req.getRequestURI();   //Path/user/UserJoin.us
         String contextPath = req.getContextPath();   //Path
         String command = requestURI.substring(contextPath.length());// /user/UserJoin.us
         ActionForward forward = null;
         
         switch(command) {
         	// 인덱스
         case "/index/Index.ix":
              System.out.println("/index/Index.ix");
              try {
                 forward = new indexAction().execute(req,resp);
              } catch (Exception e) {
                 System.out.println("/index/Index.ix : " + e);
              }
              break;
         }
         
         //일괄처리
         //어디인지, 어떤 방식인지는 몰라도 그냥 forward 객체에 담겨있는 정보대로 페이지를 이동시키는 코드
         if(forward != null) {
            if(forward.isRedirect()) {
               resp.sendRedirect(forward.getPath());
            }
            else {
               RequestDispatcher disp = req.getRequestDispatcher(forward.getPath());
               disp.forward(req, resp);
            }
         }
      }
}