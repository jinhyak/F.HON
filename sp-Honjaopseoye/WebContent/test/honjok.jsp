<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../../include/include/commonUI.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
	$( document ).ready(function() {
		$('.ui.sticky')
	  	.sticky({
	    	context: '#example1'
	  	});
	});
	</script>
</head>
<body>
    
    
<div id="login">
    <h1><i class="ico spr"></i><span>��湲곗�� �ъ�λ��/鍮�利��쇳��</span></h1>
    <form class="form-signin form-horizontal" method="POST">
        <fieldset>
            <div style="display:none"><input type="hidden" name="csrfmiddlewaretoken" value="p9k4HDyZEdd06NxIrEZXtsifJG2fWiXE"></div>
            
            <div class="alert">
                <a class="close" onclick="$('.alert').hide()">�</a>
                濡�洹몄�� �� �� ���듬����. �ㅼ�� ������ 二쇱�몄��.
            </div>
            
            <br>
            <div class="control-group">
                <label class="control-label" for="username">���대��</label>
                <div class="input-wrap">
                    <i class="ico spr ico-id"></i>
                    <input type="text" id="username" name="username" class="input-block-level">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="password">鍮�諛�踰���</label>
                <div class="input-wrap">
                    <i class="ico spr ico-pw"></i>
                    <input type="password" id="password" name="password" class="input-block-level">
                </div>
            </div>
            <div class="controls">
                <button type="submit" class="button">濡�洹몄��</button>
            </div>
            <div class="control-group center">
                <a class="register" href="/owner/registration/1/">����媛��� / ���대�� 蹂�寃�</a>
            </div>
    </fieldset>
    </form>
</div>
    <script type="text/javascript" src="/media/owners/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/media/owners/js/bootstrap-2.3.2.min.js"></script>
    <script type="text/javascript" src="/media/owners/js/soundmanager2.js"></script>
    <script type="text/javascript" src="/media/js/lib/jquery-ui-1.10.3.min.js"></script>
    <script type="text/javascript" src="/media/owners/js/google_analytics.js"></script>
    <script type="text/javascript" src="/jsi18n/"></script>
    <script>
        if (typeof(window.Yogiyo) == 'undefined') {
            window.Yogiyo = {};
        }
        window.Yogiyo.OWNER_RELAY_PING_INTERVAL = 10000;
    </script>
    <div class="modal fade popup-pwd-notice" id="modal-pwd-notice">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">�</button>
        <h3 id="myModalLabel">鍮�諛�踰��� 蹂�寃� ����</h3>
    </div>
    <div class="modal-body">
        怨�媛����� ��以��� ��蹂대�� 蹂댄�명��湲� ���� <strong>3媛��� 二쇨린濡� 鍮�諛�踰��� 蹂�寃�</strong>�� ���댄�� ��由ш� ���듬����.<br>
        遺��명�������쇰�� 二쇨린���쇰� 鍮�諛�踰��몃�� 蹂�寃쏀���� �ъ�⑺�� 二쇱��湲� 遺�����由쎈����.
    </div>
    <div class="pop-btns">
        <a href="#" data-dismiss="modal" class="btn btn1">�ㅼ���� 蹂�寃쏀��湲�</a>
        <a href="#" onclick="redirectLogin('/owner/password_change/')" data-dismiss="modal" class="btn btn2">鍮�諛�踰��� 蹂�寃쏀��湲�</a>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function() {
        var regexS = "[\\?&]login=([^&#]*)";
        var regex = new RegExp( regexS );
        var results = regex.exec(window.location.href);
        if (results) {
            $('.popup-pwd-notice').modal('show');
        }
    });
</script>
<script>
    $(document).ready(function() {
        $('.form-signin').on('submit', function(evt){
            $(this).find('input').each(function(idx, elem){
                $(elem).val( $(elem).val().trim() );
            });
        });
    });
</script>



</body>
</html>