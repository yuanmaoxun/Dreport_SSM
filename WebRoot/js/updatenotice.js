function updateNotice(){
		var xmlhttp;
		xmlhttp = new XMLHttpRequest;
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState==4 && xmlhttp.status==200){
				if(xmlhttp.responseText != NULL){
					noticeObj = JSON.parse(xmlhttp.responseText);
					var type;
					if(noticeObj[0].nmRank == 0)
						type = "�µ�Info";
					else type= "�µ�Warining";
					swal(type, "��Ϣ����ID��" + noticeObj[0].nmFromUserId +
						"\n��Ϣ���ݣ�" + noticeObj[0].nmMessageContent +
						"\nʱ�䣺" + noticeObj[0].nmTime.toLocaleString, "success");
				}
			}
		};
		xmlhttp.open("GET","/dreport/noticemessageController/queryUserNotice.action" + "&time=" + Math.random(),true);
		xmlhttp.send();
	}
	function getMessage(){
		window.onload = "getMessage()";
		window.setInterval(updateNotice, 10000);
	}