package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.AqiDao;
import entity.Aqi;
import function.Fun;

public class QueryCityHistoryAqiServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().invalidate();//清空存在session里的所有值
		String city=request.getParameter("city");
		String city_cn=Fun.findCityName(city);
		String year_month=request.getParameter("date");
		List<Aqi> historyAqi=AqiDao.queryCityHistoryAqi(city, year_month);
		request.getSession().setAttribute("historyAqi", historyAqi);
		request.getSession().setAttribute("city_cn", city_cn);
		request.getRequestDispatcher("historyAQI.jsp").forward(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
