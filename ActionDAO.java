package com.quinnox.mom.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.quinnox.mom.model.Actions;

public class ActionDAO {

	public static Connection getConnection() {
		Connection con = null;

		try {

			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("Connecting to database...");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe", "adarsh", "adarsh");
		} catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}

	public static boolean setAction(ArrayList<Actions> action, int momId) {
		Connection con = ActionDAO.getConnection();
		PreparedStatement pst = null;
		int actionId = 0;
		int rowsUpdated = 0;
		for (Actions at : action) {
			try {

				pst = con.prepareStatement("select count(*) from actions");
				ResultSet rs = pst.executeQuery();
				while (rs.next())
					actionId = rs.getInt(1);
				actionId++;
				pst = con.prepareStatement("insert into actions values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
				pst.setInt(1, actionId);
				pst.setString(2, at.getActionName());
				pst.setInt(3, at.getAssignedTo());
				pst.setString(4, at.getStatus());
				pst.setInt(5, momId);
				pst.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
				pst.setTimestamp(7, null);
				pst.setTimestamp(8, null);
				pst.setTimestamp(9, null);
				pst.setString(10, null);
				pst.setTimestamp(11, null);
				pst.setString(12, null);
				pst.setTimestamp(13, null);
				rowsUpdated = pst.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
		}
		if (rowsUpdated == 1)
			return true;
		else
			return false;

	}
}
