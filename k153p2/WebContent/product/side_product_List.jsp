<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.kosta.k153p2.product.dto.ItemInfo"%>
<%@page import="java.util.List"%>
<%@page import="com.kosta.k153p2.product.dao.ItemInfoDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
/*
�޾ƾ� �ϴ� �Ķ���ʹ� 
	1. � ���̵� �޴��� �����ߴ���
	2. � �������� �����ߴ���
*/
	//������ ���̵� �޴��� ���� ��ǰ ���� json���� ������
	session.removeAttribute("totPage");
	session.removeAttribute("crr_page");
	
	
	ItemInfoDao dao = new ItemInfoDao();
	String sideM_Str = request.getParameter("sideMenu");
	int sideM = Integer.parseInt(sideM_Str);//���̵�
	
	String crr_strPage = request.getParameter("crr_page");
	int crr_page = 0;
	if(crr_strPage ==null){
		crr_page=1;	
	}else{
		crr_page =  Integer.parseInt(crr_strPage);//������
	}


	int recordCount = 10;// �� ȭ�鿡 ������ ������ ��
	int totRecord = dao.selectCount(sideM); // ���̵忡 ���� �� ���ڵ� ��
	System.out.println("�� �������� ����");
	int totPage = totRecord / recordCount; // �� ������ ��
	if (totRecord % recordCount > 0) {
		totPage++;
	}
	session.setAttribute("totPage", totPage);
	session.setAttribute("crr_page", crr_page);
	
	List<ItemInfo> returnList = dao.selectMenu(sideM);//�� ���̵� �޴��� ���� ���
	returnList = dao.selectPage(crr_page, recordCount, sideM);//����¡�� ���� ���
	///// �ҷ��� ������ ����Ʈ�� Json��ü �������� ������ �ٽ� Ŭ���̾�Ʈ�� ���� /////
	JSONArray jArray = new JSONArray();

	for (int i = 0; i < returnList.size(); i++) {
		System.out.println(i + " " + returnList.get(i).getItem_no());
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("item_no", returnList.get(i).getItem_no());
		jsonObj.put("item_name", returnList.get(i).getItem_name());
		jsonObj.put("item_userPrice", returnList.get(i).getItem_userPrice());
		jsonObj.put("item_type", returnList.get(i).getItemtype_no());
		jArray.add(jsonObj);
	}

	String str = jArray.toString();

	out.print(str);
	out.flush();//���۸� ��� �����
%>