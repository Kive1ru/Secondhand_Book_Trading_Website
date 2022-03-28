package com.book.db;
import java.sql.*;

public class Database {
	private Connection conn = null;
	
	private void open(){
		//��Щ���������еĹ����У�������쳣��Exception��
		//�쳣�����Ǵ����д�Ĵ���
		try{
			Class.forName("com.mysql.jdbc.Driver");//������������
			conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/booktrans","root", "000627==");
		}catch(Exception e){
			System.out.println(e.toString());
		}
	}
	private void close(){
		conn = null;
	}
	
	public int execute(String sql){
		int re = -1;            //Ĭ������£�-1����ִ��ʧ��
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
