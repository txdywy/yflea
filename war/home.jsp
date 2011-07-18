<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>yfox Home!</title>
</head>
<body>
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
  <c:if test="${friend.id!='30709674'}"><img src="${friend.tinyurl}"/></c:if>
  <c:if test="${friend.id=='30709674'}"><strong>(貌似只有他<img src="${friend.tinyurl}"/>除外哦^(00)^)</strong></c:if>
  </c:forEach>
  <p>都米有你聪明!!!<img src="http://app.xnimg.cn/application/logo48/20110717/08/20/LusTd44a018153.jpg"/></p> 
</body>
</html>