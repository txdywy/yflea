<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>yfox Home!</title>
  <script type="text/javascript" src="/js/renren_js_sdk/renren.js"></script>
  <script type="text/javascript">
    function sendRequest(isSendToMany, toId) {
        var params = {"accept_url":"http://apps.renren.com/yfleabite/welcome","accept_label":"接受邀请"};
        var style = null;
        if (isSendToMany) {
            params["actiontext"] = "邀请好友来玩吧";
        }
        else {
            params["to"] = toId;
  		  style = {
  			  "width":500,  
  			  "height":350  
  		  };
        }
  	  var uiOpts = {
  		  url : "request",
  		  display : "iframe",
  		  params : params,
  		  style : style,
  		  onSuccess: function(r){},
  		  onFailure: function(r){} 
  	  };
  	  Renren.ui(uiOpts);
    }
  </script>
</head>
<body>
  <script type="text/javascript">Renren.init({appId:${requestScope.appId}});</script>
  <img src="${requestScope.userHead}"/>
  <p>喂!!!</p>
  <p>我是小迷狐!</p> 
  <img src="http://app.xnimg.cn/application/logo/20110717/08/10/L06X345g018153.jpg"/>
  <p>${requestScope.userName}快来看我!!!</p>
  <p>我很口耐哦!<img src="http://app.xnimg.cn/application/20110717/08/25/L3wEC61n018153.jpg"/></p>
  <p>下面是${requestScope.userName}的一部分好友：</p>
  <p>经过严格的数学模型计算...</p>
  <p>算了很长很长时间...</p>
  <p>很长很长哦...</p>
  <p>.................................................................................................................................................................这么长!</p>
  <p>结论就是————他们的共同特点是...</p>
  <c:forEach var="friend" items="${requestScope.friendsList}">
  <c:if test="${friend.id!='30709674'}"><a href="javascript:sendRequest(false,${friend.id})"><img src="${friend.tinyurl}"/></a></c:if>
  <c:if test="${friend.id=='30709674'}"><a href="javascript:sendRequest(false,${friend.id})"><strong>(貌似只有他<img src="${friend.tinyurl}"/>除外哦^(00)^)</strong></a></c:if>
  </c:forEach>
  <p>都米有你聪明!!!<img src="http://app.xnimg.cn/application/logo48/20110717/08/20/LusTd44a018153.jpg"/></p> 
  <p><a href="javascript:sendRequest(true)">邀请更多好友^o^!</a></p>
</body>
</html>