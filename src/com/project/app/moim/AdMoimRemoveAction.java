package com.project.app.moim;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.moim.dao.MoimDAO;

public class AdMoimRemoveAction implements Action{
    @Override
    public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        MoimDAO mdao = new MoimDAO();

        String page = req.getParameter("page");
        int recruitnum = Integer.parseInt(req.getParameter("recruitnum"));
        
        ActionForward forward = new ActionForward();
        forward.setRedirect(true);

        if(mdao.selectCountReply(recruitnum) > 0) {
            if(mdao.removeReply(recruitnum)&&mdao.removeRecruit(recruitnum)) {
                forward.setPath(req.getContextPath()+"/moim/AdMoim.mo?remove=true&page="+page);
            }else {
                forward.setPath(req.getContextPath()+"/moim/AdMoim.mo?remove=false&page="+page);
            }
            return forward;
        }else {
            if(mdao.removeRecruit(recruitnum)) {
                forward.setPath(req.getContextPath()+"/moim/AdMoim.mo?remove=true&page="+page);
            }else {
                forward.setPath(req.getContextPath()+"/moim/AdMoim.mo?remove=false&page="+page);
            }
            return forward;
        }
    }
}