package function;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class Fun {
	public static String aqiLevel(int aqi) {
		String level="";
		if(aqi>0&&aqi<50) {
			level="优";
		}else if(aqi>=51&&aqi<100) {
			level="良";
		}else if(aqi>100&&aqi<150) {
			level="轻度污染";
		}else if(aqi>150&&aqi<200) {
			level="中度污染";
		}else if(aqi>200&&aqi<300) {
			level="重度污染";
		}else
			level="严重污染";
		return level;
	}
	
	public static String findCityName(String cityName_en) {  //根据城市的英文，返回城市的中文
		Map <String,String> map=new HashMap<>();
		map.put("shanghai", "上海");
		map.put("nantong", "南通");
		map.put("nanjing", "南京");
		map.put("hangzhou", "杭州");
		String result=map.get(cityName_en);
		return result;
	}
}
