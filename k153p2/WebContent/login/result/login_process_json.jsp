<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.kosta.k153p2.login.dto.MemberInfo"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.kosta.k153p2.login.dao.MemberInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String logout = request.getParameter("logout");

	if (logout == null) {//���� �α����� �Ѱ��� �α׾ƿ��� �Ѱ��� �Ǵ�
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		MemberInfoDAO dao = new MemberInfoDAO();
		boolean loginResult = dao.selectLogin(id, pass);

		JSONObject jsonObj = new JSONObject();
		if (loginResult) {
			jsonObj.put("loginResult", "success");
			MemberInfo info = dao.selectinfo(id);
			session.setAttribute("loginInfo", info);
		} else {
			jsonObj.put("loginResult", "fail");
		}
		String str = jsonObj.toJSONString();
		out.print(str);
		out.flush();//���۸� ��� �����
	} else {
		//�α׾ƿ��� ����
		session.invalidate(); //���� ���ǰ� �ִ� ���� ���� ��� ����
		request.getRequestDispatcher("/login/login_index.jsp").forward(request, response);
	}
%>