package com.quinnox.mom.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.quinnox.mom.model.Participants;

public class ParticipantDAO {

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

	public static boolean setParticipant(ArrayList<Participants> participants, int momId) {
		Connection con = MomDAO.getConnection();
		PreparedStatement pst = null;
		int rowsUpdated = 0;
		for (Participants pt : participants) {
			try {
				pst = con.prepareStatement("select count(*) from employees where emp_id=?");
				pst.setInt(1, pt.getEmp_id());
				ResultSet isValid = pst.executeQuery();
				while (isValid.next())
					if (isValid.getInt(1) == 0) {
						return false;
					}

				pst = con.prepareStatement("insert into participants values(?,?,?)");

				pst.setInt(1, momId);
				pst.setInt(2, pt.getEmp_id());
				pst.setString(3, pt.getAttendance());

				rowsUpdated = pst.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

			}
		}
		if (rowsUpdated == 1)
			return true;
		else
			return false;

	}

}
