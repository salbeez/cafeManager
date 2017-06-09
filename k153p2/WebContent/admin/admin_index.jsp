<?xml version="1.0" encoding="EUC-KR" ?>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/basic.css"></link>
<%--��Ÿ�� ��Ʈ ���� --%>
<script src="${pageContext.request.contextPath}/js/ajax.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
	//-------------------------------���� �ȳ� �����̵�-----------------------------------------
	var bg = new Array();
	bg[0] = "/k153p2/img/����1.png";
	bg[1] = "/k153p2/img/����2.png";
	bg[2] = "/k153p2/img/����3.png";
	var i = 0;
	//-------------------------------------------------------------------------------------

	$(function() {
		$("#sidebar").load("${pageContext.request.contextPath}/admin/admin_Menu.jsp");
		setInterval(function() {
			$("#table001_id").css({
				'background-image' : 'url(' + bg[i]
			});
			i = (i < 2) ? i + 1 : 0;
		}, 3000);
	});
	$(document).on('click', '#sideMenu1', function() { //��� ���
		$("#subSideM1").toggle();
	});
	$(document).on('click', '#sideMenu2', function() { //��� ���
		if ("${loginInfo.member_grade}" == "M") {
			$("#subSideM2").toggle();
		} else {
			alert("��� ������ �����ϴ�");
		}
	});
	$(document).on('click', '#sideMenu3', function() { //��� ���
	//	if ("${loginInfo.member_grade}" == "A") {
			$("#subSideM3").toggle();
/* 		} else {
			alert("��� ������ �����ϴ�");
		} */
	});

	$(document).on('click', '.input', function() { //���� ���̵� �޴� �� Ŭ�� ���� ��
		var subSideMenu_id = $(this).attr("id");
		if (subSideMenu_id.match("franchiseIntro")) { //���� �ȳ��� ����
			$("#content").load("${pageContext.request.contextPath}/admin/index_franchiseIntro.jsp");
		} else if (subSideMenu_id.match("branch_office_Manager")) { //���� ������ ����
			$("#content").load("${pageContext.request.contextPath}/admin/admin_select_Fr_M.jsp");
		} else if (subSideMenu_id.match("product_order")) { //��ǰ ���Ÿ� ����
			$("#content").load("${pageContext.request.contextPath}/admin/admin_product_Fr_M.jsp");

		} else if (subSideMenu_id.match("branch_office_Net_Sales")) { //������ ���⸦ ����

		} else { //��ǰ �����⸦ ����

		}
	});

	$(document).on('click', '.buttonFM', function() {
		var id = $(this).attr("id");
		if (id.match("F_manager")) { //���� ������ Ŭ�� ������
			var w = 300;
			var h = 500; 
			var left = (screen.width / 2) - (w / 2);
			var top = (screen.height / 2) - (h / 2);
			window.open("${pageContext.request.contextPath}/admin/admin_Manager_MyStore.jsp", "���� ����", 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);

		} else {
			$("#content").load("${pageContext.request.contextPath}/admin/admin_Manager_Registration.jsp");
		}
	});
	$(document).on('click', '#store_product', function() { //���� ��� -> �Ǹ��� ������ �����غ�
		window.open("${pageContext.request.contextPath}/admin/admin_SalesProduct_regit.jsp");
	});

	$(document).on('click', '#regitFormSubmit', function() { //���� ��� -> ��� ��ư ����
		var formData = $("#regitForm").serialize(); // �������͸� ����ȭ
		var htmlText = "";
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/admin/admin_regit_store_json.jsp",
			data : {
				data : formData
			},
			success : function(data) {
				htmlText = data; //
				$("#content").html(htmlText);
			},
			error : function(xhr, status, error) {
				console.log("����!: " + error + " " + "����" + status);
			},
		});
	});
	
	$(document).on('click', '#p_Stock', function() {//��� ��Ȳ Ŭ��
		var w = 300;
		var h = 300; 
		var left = (screen.width / 2) - (w / 2);
		var top = (screen.height / 2) - (h / 2);
		window.open("${pageContext.request.contextPath}/admin/stock/admin_crrent_Stock.jsp", "��� ��Ȳ", 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);

	});
</script>

<title>Insert title here</title>
</head>
<body>
	<div id="header">a</div>
	<div id="header2">
		<jsp:include page="/product/product_TopMenu.jsp"></jsp:include>
	</div>
	<div id="sidebar">b</div>
	<div id="content">c</div>
	<div id="testDiv"></div>
</body>
</html>