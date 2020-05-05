package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import Dao.AqiDao;
import entity.Aqi;
import function.Fun;

public class QueryCityAqiServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().invalidate();//清空存在session里的所有值
		String city=request.getParameter("city");
		String city_cn=Fun.findCityName(city);
		List<Aqi> alist=AqiDao.queryTodayAqi(city);
		List<Integer> historyAqi=AqiDao.queryHistoryAqi(city);
		List<Aqi> allDate=AqiDao.queryCityAllDate(city);
		List<Aqi> allMonth=AqiDao.queryCityMonth(city);
		String updateDate=alist.get(0).getDate();
		request.getSession().setAttribute("alist", alist);
		request.getSession().setAttribute("updateDate", updateDate);
		request.getSession().setAttribute("city", city);
		request.getSession().setAttribute("city_cn", city_cn);
		request.getSession().setAttribute("historyAqi", historyAqi);
		request.getSession().setAttribute("allDate", allDate);
		request.getSession().setAttribute("allMonth", allMonth);
		request.getRequestDispatcher("currentAQI.jsp").forward(request,response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
