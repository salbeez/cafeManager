<?xml version="1.0" encoding="EUC-KR" ?>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>�ߺ�Ȯ��</title>
<!-- <script type="text/javascript" src="../js/ajax2.js"></script> -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).on('click', '#test', function() {
		var id = $('#id').val();
		var htmlText = '';
		var idPattern = new RegExp('^[a-zA-Z][a-zA-Z0-9]{5,10}$','g');
		$.ajax({
			type : "post",
			url : "/k153p2/login/result/login_duple_Sign_json.jsp",
			data : {
				id : id
			},
			dataType : "html",
			success : function(data) {
					htmlText += data;
						if(!idPattern.test(id)){
							alert('ID�� �����ڸ� ���������ϴ� 6~10�ڸ��� �ۼ��� �ּ���!!');
						}else if(htmlText.match("��밡��")){
							var ynn=confirm(id+"�� ��� ������ ���̵��Դϴ� :) ����Ͻðڽ��ϱ�?");
							if(ynn){
								opener.document.frm.id.value=id;
								self.close();
							}
						}else{
							$('#d1').html(htmlText);
						}
			}
		});
	});
</script>
</head>
<body>
	<form name='frm' method='POST' >
		<input type="text" name="id" id="id">
		<input type="button" value="�ߺ�Ȯ��" id="test">
		<div id="d1"></div>
	</form>
</body>
</html>