<%@ page
  language="java"
  contentType="text/html;charset=UTF-8"
  pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html lang="zh">

<head>
  <%@ include file="../components/meta.jsp" %>
  <%@ include file="../components/link.jsp" %>
  <link rel="stylesheet" href="/css/manage.css">
  <link rel="stylesheet" href="/css/jquery.basictable.css">
  <script src="/js/jquery.basictable.min.js"></script>
  <script src="/js/reponsetable.min.js"></script>
  <script src="/js/flatui-radio-0.0.3.js"></script>
  <title>报名管理</title>
</head>

<body>
  <%@ include file="../components/header.jsp" %>
  <div class="container">
    <ul class="nav nav-tabs">
      <li role="presentation">
        <a href="/vote/edit?aid=${aid}">编辑</a>
      </li>
      <li role="presentation" class="active">
        <a href="/vote/apply_manage?aid=${aid}">报名管理</a>
      </li>
      <li role="presentation">
        <a href="/vote/entry_manage?aid=${aid}">条目管理</a>
      </li>
      <li role="presentation">
        <a href="/vote/gather?aid=${aid}">结果与日志</a>
      </li>
      <li role="presentation">
        <a href="/vote/qrcode?aid=${aid}">链接与二维码</a>
      </li>
    </ul>

    <br>

    <!-- 响应式表格 -->
    <div class="table-container">
      <div class="btn-container">
        <button class="layui-btn" onclick="appendApply();"><i class="fa fa-plus"></i>新增报名</button>
        <button class="layui-btn" onclick="exportExcel();"><i class="fa fa-floppy-o"></i>导出Excel</button>
        <button class="layui-btn" onclick="reloadTable();"><i class="fa fa-undo"></i>刷新表格</button>
      </div>
      <table id="table" class="reponsetable"></table>
      <script type="text/html" id="editer">
        <a class="table-operation" onclick="editApplyInfo(this)" title="编辑报名信息"><i class="fa fa-pencil"></i></a><a class="table-operation" onclick="approveApply(this)" title="通过审核"><i class="fa fa-check"></i></a><a class="table-operation" onclick="rejectApply(this)" title="拒绝审核"><i class="fa fa-times"></i></a>
      </script>
    </div>

    <!-- 编辑框 -->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel"
      aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="editModalLabel">编辑报名信息</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body" id="editModalBody">
            <%@ include file="../components/options/title.jsp" %>

            <%
              String[] options = (String[])request.getAttribute("options");
              for (int i = 0; i < options.length; i++) {
            %>
              <%
                if (options[i].equals("0")) {
              %>
                <%@ include file="../components/options/img_entry.jsp" %>
                <span class="hidden table-column" data-field="imgEntry" data-title="参赛图片"></span>
              <%
                } else if (options[i].equals("1")) {
              %>
              <%@ include file="../components/options/introduction.jsp" %>
              <span class="hidden table-column" data-field="introduction" data-title="详细介绍""></span>
              <%
                } else if (options[i].equals("2")) {
              %>
              <%@ include file="../components/options/name.jsp" %>
              <span class="hidden table-column" data-field="name" data-title="详细介绍""></span>
              <%
                } else if (options[i].equals("3")) {
              %>
                <%@ include file="../components/options/sex.jsp" %>
                <span class="hidden table-column" data-field="sex" data-title="真实性别"></span>
              <%
                } else if (options[i].equals("4")) {
              %>
                <%@ include file="../components/options/age.jsp" %>
                <span class="hidden table-column" data-field="age" data-title="真实年龄"></span>
              <%
                } else if (options[i].equals("5")) {
              %>
                <%@ include file="../components/options/telephone.jsp" %>
                <span class="hidden table-column" data-field="telephone" data-title="手机号码"></span>
              <%
                } else if (options[i].equals("6")) {
              %>
                <%@ include file="../components/options/email.jsp" %>
                <span class="hidden table-column" data-field="email" data-title="电子邮件"></span>
              <%
                } else if (options[i].equals("7")) {
              %>
                <%@ include file="../components/options/school.jsp" %>
                <span class="hidden table-column" data-field="school" data-title="学校名称"></span>
              <%
                } else if (options[i].equals("8")) {
              %>
                <%@ include file="../components/options/company.jsp" %>
                <span class="hidden table-column" data-field="company" data-title="公司名称"></span>
              <%
                } else if (options[i].equals("9")) {
              %> 
                <%@ include file="../components/options/address.jsp" %>
                <span class="hidden table-column" data-field="address" data-title="收货地址"></span>
              <%
                }
              %>
            <% 
              }
            %>
          </div>
          <div class="modal-footer">
            <button id="editModalButton" type="button" class="btn btn-success" data-dismiss="modal" onclick="saveOrUpdate()">　保存　</button>
            <button id="editModalButton" type="button" class="btn btn-fefault" data-dismiss="modal">　取消　</button>
          </div>
        </div>
      </div>
    </div>
    
    <span id="aid" class="hidden">${aid}</span>

    <script src="/js/apply_manage.js"></script>
  </div>
  <%@ include file="../components/modal.jsp" %>
  <%@ include file="../components/footer.jsp" %>
</body>