package webcanvas;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.renren.api.client.RenrenApiClient;
import webcanvas.config.AppConfig;

@SuppressWarnings("serial")
public class HomeServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, java.io.IOException {
		String sessionKey = request.getParameter("xn_sig_session_key");
		String renrenUserId = request.getParameter("xn_sig_user");
		if (sessionKey != null && renrenUserId != null) {
			RenrenApiClient apiClient = new RenrenApiClient(sessionKey);
			//获取用户信息
			JSONArray userInfo = apiClient.getUserService().getInfo(renrenUserId, "name,headurl");
			if (userInfo != null && userInfo.size() > 0) {
				JSONObject currentUser = (JSONObject) userInfo.get(0);
				if (currentUser != null) {
					String userName = (String) currentUser.get("name");
					String userHead = (String) currentUser.get("headurl");
					request.setAttribute("userName", userName);
					request.setAttribute("userHead", userHead);
				}
			}
			//获取好友列表数据
			JSONArray friendsList = apiClient.getFriendsService().getFriends(1, 100);//最多取30个好友
			request.setAttribute("friendsList", friendsList);
		}
		request.setAttribute("appId", AppConfig.APP_ID);
		RequestDispatcher welcomeDispatcher = request.getRequestDispatcher("/home.jsp");
		welcomeDispatcher.forward(request, response);
	}
}
