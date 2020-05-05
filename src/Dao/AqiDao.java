package Dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import entity.Aqi;
import function.Fun;
import DBHelper.DBHelper;

public class AqiDao {
	public static List<Aqi> queryCityAqi(String city){ //遍历指定城市的空气质量详细数据
		ArrayList<Aqi> list=new ArrayList<Aqi>();
		String sql="select * from "+city+"AQI;";
		ResultSet rs=DBHelper.executeQuery(sql);
		try {
			while(rs.next()) {
				Aqi a=new Aqi();
				a.setCity(city);
				a.setDate(rs.getString(1));
				a.setAqi(rs.getInt(2));
				a.setPm25(rs.getInt(3));
				a.setPm10(rs.getInt(4));
				a.setSo2(rs.getInt(5));
				a.setNo2(rs.getInt(6));
				a.setCo(rs.getFloat(7));
				a.setO3(rs.getInt(8));
				list.add(a);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		DBHelper.closeConnection();
		return list;
	}
	
	public static List<Aqi> queryTodayAqi(String city){
		ArrayList<Aqi> list=new ArrayList<Aqi>();
		String sql="select * from "+city+"AQI order by date desc limit 1";
		ResultSet rs=DBHelper.executeQuery(sql);
		try {
			while(rs.next()) {
				Aqi a=new Aqi();
				a.setCity(city);
				a.setDate(rs.getString(1));
				a.setAqi(rs.getInt(2));
				a.setPm25(rs.getInt(3));
				a.setPm10(rs.getInt(4));
				a.setSo2(rs.getInt(5));
				a.setNo2(rs.getInt(6));
				a.setCo(rs.getFloat(7));
				a.setO3(rs.getInt(8));
				a.setLevel(Fun.aqiLevel(rs.getInt(2)));
				list.add(a);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		DBHelper.closeConnection();
		return list;
	}
	
	public static List<Integer> queryHistoryAqi(String city) {
		List<Integer> list=new ArrayList<Integer>();
		String sql="select aqi from "+city+"AQI";
		ResultSet rs=DBHelper.executeQuery(sql);
		try {
			while(rs.next()) {
				list.add(rs.getInt(1));
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		DBHelper.closeConnection();
		return list;
	}
	
	public static List<Aqi> queryCityAllDate(String city){
		ArrayList<Aqi> list=new ArrayList<Aqi>();
		String sql="select date from "+city+"AQI";
		ResultSet rs=DBHelper.executeQuery(sql);
		try {
			while(rs.next()) {
				Aqi a=new Aqi();
				a.setDate(rs.getString(1));
				list.add(a);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		DBHelper.closeConnection();
		return list;
	}
	
	public static List<Aqi> queryCityMonth(String city){ //查询指定城市的年月(yyyy-mm)
		ArrayList<Aqi> list=new ArrayList<Aqi>();
		String sql="select distinct substring(date,1,7) from "+city+"AQI";
		ResultSet rs=DBHelper.executeQuery(sql);
		try {
			while(rs.next()) {
				Aqi a=new Aqi();
				a.setDate(rs.getString(1));
				list.add(a);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		DBHelper.closeConnection();
		return list;
	}
	
	public static List<Aqi> queryCityHistoryAqi(String city,String year_month){ //查询指定城市某年某月的历史AQI信息
		ArrayList<Aqi> list=new ArrayList<Aqi>();
		String sql="select * from "+city+"AQI where date like \""+year_month+"%\"";
		ResultSet rs=DBHelper.executeQuery(sql);
		try {
			while(rs.next()) {
				Aqi a=new Aqi();
				a.setDate(rs.getString(1));
				a.setAqi(rs.getInt(2));
				a.setPm25(rs.getInt(3));
				a.setPm10(rs.getInt(4));
				a.setSo2(rs.getInt(5));
				a.setNo2(rs.getInt(6));
				a.setCo(rs.getFloat(7));
				a.setO3(rs.getInt(8));
				a.setLevel(Fun.aqiLevel(rs.getInt(2)));
				list.add(a);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		DBHelper.closeConnection();
		return list;
	}
}
