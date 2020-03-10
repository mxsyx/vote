package org.vote.api.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.vote.beans.User;
import org.vote.common.BaseApi;
import org.vote.common.DBUtil;

/**
 * 处理用户身份切换
 */
@WebServlet("/api/admin/user_privilege")
public class UserPrivilege extends BaseApi {
  private static final long serialVersionUID = 1L;

  public UserPrivilege() {
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    if (!(boolean)request.getSession().getAttribute("admin")) complete(response, 5002);
    
    long uid = Long.valueOf(request.getParameter("uid"));
    User user = (User) DBUtil.getInstanceById(User.class, uid);
    user.setIsStaff(!user.getIsStaff());

    if (DBUtil.updateInstance(user)) {
      complete(response, 5000,  String.valueOf(user.getIsStaff()));
    } else {
      complete(response, 5001, String.valueOf(user.getIsStaff()));
    }
  }
}