<%@page import="com.kosta.k153p2.login.dto.MemberInfo"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.kosta.k153p2.admin.dto.StoreInfo"%>
<%@page import="com.kosta.k153p2.admin.dao.StoreInfoDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%-- admin_Manager_Registration.jsp���� ���� ������ db�� ����  ���� ���--%>
<%
	request.setCharacterEncoding("UTF-8");
	MemberInfo info = (MemberInfo) session.getAttribute("loginInfo");

	String data[] = URLDecoder.decode(request.getParameter("data"), "UTF-8").split("&");//����ȭ�� ���� �ѱ� ���� ����
	String store_name[] = data[0].split("=");//0=���� 1=���� ��
	String store_addr2[] = data[1].split("=");
	String store_tel[] = data[2].split("=");

	String arritemlist[] = data[3].split("=");
	String itemlist[] = arritemlist[1].split("%");

	System.out.println("store_name :" + store_name[1] + " itemlist ������ : " + itemlist.length);

	StoreInfoDao dao = new StoreInfoDao();
	StoreInfo store = new StoreInfo(store_name[1], store_addr2[1], store_tel[1], arritemlist[1]);
	store.setStore_owner(info.getMember_id());

	System.out.println("���� ������ �ִ� ���� ���� : " + dao.sel_count_owner(info.getMember_id()));
	if (dao.sel_count_owner(info.getMember_id()) <= 0) {//�������� ������ �ִ� ������ ������ 1���� ���� ����... 2���� �����κ� ���� ������.
		boolean result = dao.insert(store);
		if (result) {
			for (int i = 0; i < itemlist.length; i++) {
				System.out.println(i + "��° ������ : " + itemlist[i]);
				dao.insert_init_stock(dao.sel_STOREINFO_SEQ(), Integer.parseInt( itemlist[i]));
			}
			out.print("success");
		} else {
			out.print("fail");
		}
	} else {
		out.print("�������� 1���� ������ ������ �ֽ��ϴ�");
	}

	out.flush();//���۸� ��� �����
%>
