package com.quinnox.mom.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

import com.quinnox.mom.model.Actions;
import com.quinnox.mom.model.Mom;
import com.quinnox.mom.model.Participants;

public class MomDAO {

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

	public static int insertMom(ArrayList<Mom> mom, ArrayList<Participants> participants, ArrayList<Actions> action,
			HttpServletRequest request) {
		Connection con = MomDAO.getConnection();
		PreparedStatement pst = null;
		int mom_id = 0;
		try {
			pst = con.prepareStatement("select count(*) from mom1");
			ResultSet count = pst.executeQuery();
			while (count.next()) {
				mom_id = count.getInt(1);
				mom_id++; // automatically incrementing momid value
			}

			if (MomDAO.setMom(mom, mom_id)) {
				return 1;
			}
			if (ParticipantDAO.setParticipant(participants, mom_id))
				return 2;
			if (ActionDAO.setAction(action, mom_id))
				return 3;
			else

				return 5;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 5;
		}

	}

	public static boolean setMom(ArrayList<Mom> mom, int mom_id) {
		Connection con = MomDAO.getConnection();
		PreparedStatement pst = null;
		try {
			pst = con.prepareStatement("insert into mom1 values(?,?,?,?,?,?,?,?)");
			pst.setInt(1, mom_id);
		
			for (Mom mObj : mom) {
				pst.setInt(2, mObj.getCreator_id());
				pst.setString(3, mObj.getMom_purpose());
				pst.setString(4, mObj.getMom_sub());
				pst.setString(5, mObj.getMom_s_date());
				pst.setString(6, mObj.getMom_e_date());
				pst.setString(7, mObj.getPointsDiscussed());
				pst.setString(8, mObj.getDecisionTaken());
				
			
			}
			int rowsUpdated = pst.executeUpdate();
			if (rowsUpdated == 1)
				return true;
			else
				return false;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

}