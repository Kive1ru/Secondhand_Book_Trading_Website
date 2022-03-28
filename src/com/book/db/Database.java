package com.book.db;
import java.sql.*;

public class Database {
	private Connection conn = null;
	
	private void open(){
		//有些代码在运行的过程中，会出现异常（Exception）
		//异常：不是代码编写的错误
		try{
			Class.forName("com.mysql.jdbc.Driver");//设置驱动类型
			conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/booktrans","root", "000627==");
		}catch(Exception e){
			System.out.println(e.toString());
		}
	}
	private void close(){
		conn = null;
	}
	
	public int execute(String sql){
		int re = -1;            //默认情况下，-1代表执行失败
		this.open();
		try{
			Statement stmt = conn.createStatement();
			re = stmt.executeUpdate(sql);
			stmt = null;
		}catch(Exception e){
			System.out.println(e.toString() + sql);
		}
		this.close();
		return re;
	}
	
	public ResultSet query(String sql){
		ResultSet rs = null;
		this.open();
		try {
			Statement stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {			
			System.out.println(e.toString() + sql);
		}
		//this.close();
		return rs;
	}
}
