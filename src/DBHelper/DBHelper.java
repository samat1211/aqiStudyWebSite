package DBHelper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBHelper {
	private static String driver = "com.mysql.jdbc.Driver";
	private static String url = "";
	private static String user = "", pwd = "";
	private static Connection con;
    /*加载驱动程序*/
	static {
		try {
			Class.forName(driver);
		} catch (Exception ex) {
ex.printStackTrace();
		}
	}
    /*执行增删改操作*/
	public static void executeUpdate(String sql) {
		try {
			con = DriverManager.getConnection(url, user, pwd);
			Statement cmd = con.createStatement();
			cmd.executeUpdate(sql);
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
/*执行查询操作*/
	public static ResultSet executeQuery(String sql) {
		ResultSet rs = null;
		try {
			con = DriverManager.getConnection(url, user, pwd);
			Statement cmd = con.createStatement();
			rs = cmd.executeQuery(sql);
		} catch (Exception ex) { 
			ex.printStackTrace();
		}
		return rs;
	}
   /*执行关闭数据库连接操作*/
public static void closeConnection() {
		try {
           if(!con.isClosed())
			con.close();
		  } catch (Exception ex) {
		}
	}
}
