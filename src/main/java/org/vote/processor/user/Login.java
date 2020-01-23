package org.vote.processor.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.google.gson.Gson;

import org.vote.beans.User;
import org.vote.common.Code;
import org.vote.common.HibernateUtil;
import org.vote.common.MD5;

/**
 * 处理登录账户
 */
@WebServlet("/v2/login")
public class Login extends HttpServlet {
  private static final long serialVersionUID = 1L;

  public Login() {
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // 将输入流转换为JSON字符串
    String postData = IOUtils.toString(request.getInputStream(), "UTF-8");

    if (postData != null) {
      Gson gson = new Gson();
      User userVerify = gson.fromJson(postData, User.class);
      User user = getUserByEmail(userVerify.getEmail());
      
      if (user == null) {
        completed(response, 1202);
      }

      try {
        if (MD5.verify(userVerify.getPassword(), user.getPassword())) {
          completed(response, 1200);
        } else {
          completed(response, 1203);
        }
      } catch (Exception e) {
        e.printStackTrace();
        completed(response, 1201);
      }
    }
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
  }

/**
   * 根据邮件地址获取用户
   * 
   * @param emailAddress 邮件地址
   * @return 用户实例
   */
  @SuppressWarnings("unchecked")
  private User getUserByEmail(String emailAddress) {
    Session session = HibernateUtil.getSessionFactory().openSession();
    Transaction transaction = session.beginTransaction();

    try {
      transaction.begin();
      
      String hql = "FROM User WHERE email = :emailAddress";
      Query query = session.createQuery(hql);
      query.setParameter("emailAddress", emailAddress);
      List<User> results = (List<User>) query.list();
      
      transaction.commit();
      session.close();
      
      return results.isEmpty() ? null :results.get(0);
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    }
  }


  /**
   * 向用户返回操作执行的结果
   * 
   * @param response Servlet响应对象
   * @param status 自定义的返回码
   * @throws ServletException
   * @throws IOException
   */
  private void completed(HttpServletResponse response, int status) throws ServletException, IOException {
    Code code = new Code(status);
    Gson gson = new Gson();
    String jsonObj = gson.toJson(code);
    response.getWriter().write(jsonObj);
    response.setStatus(200);
  }

  /**
   * 执行新建活动的数据库操作
   * 
   * @param activity 活动实例
   * @return true/false 新建活动成功/失败
   */
  private boolean dbExcute(User user) {
    Session session = HibernateUtil.getSessionFactory().openSession();
    Transaction transaction = session.beginTransaction();

    try {
      transaction.begin();
      session.save(user);
      transaction.commit();
      session.close();
    } catch (Exception e) {
      e.printStackTrace();
      return false;
    }

    return true;
  }
}
