package com.quinnox.mom.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.quinnox.mom.dao.EmployeeDAO;
import com.quinnox.mom.dao.MomDAO;
import com.quinnox.mom.model.Actions;
import com.quinnox.mom.model.Mom;
import com.quinnox.mom.model.Participants;

@WebServlet("/GenerateMoM")
public class GenerateMoM extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GenerateMoM() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();

		String subject = request.getParameter("subject");
		String purpose = request.getParameter("purpose");
		String st = request.getParameter("start_time");
		String et = request.getParameter("end_time");
		String pnts_disc = request.getParameter("pd");
		String decision_taken = request.getParameter("dt");

		ArrayList<Participants> Participants = new ArrayList<>();

		String empId;
		String attdn = null;
		for (int i = 1; i < 11; i++) {

			empId = request.getParameter("code" + i);
			attdn = request.getParameter("attendance" + i);
			//System.out.println(empId);
		//	System.out.println(attdn);
			if (empId != "" && attdn != null) {
				Participants pt = new Participants();
				pt.setEmp_id(Integer.parseInt(empId));
				pt.setAttendance(attdn);
				Participants.add(pt);
				
				
				
			} else
				break;
		}

		ArrayList<Mom> mom = new ArrayList<>();

		String sc_id = request.getParameter("creator");
		int c_id = Integer.parseInt(sc_id);
		Mom momObj = new Mom();

		momObj.setMom_sub(subject);
		momObj.setCreator_id(c_id);
		momObj.setMom_s_date(st);
		momObj.setMom_e_date(et);
		momObj.setMom_purpose(purpose);
		momObj.setPointsDiscussed(pnts_disc);
		momObj.setDecisionTaken(decision_taken);
		mom.add(momObj);

		ArrayList<Actions> action = new ArrayList<>();
		for (int i = 1; i < 6; i++) {
			String actionName = request.getParameter("ActionItem" + i);
			// String assignTo=request.getParameter("ActionItemsAssignedTo"+i);
			// String doc=request.getParameter("doc"+i);
			if (actionName != "") {
				Actions actionObj = new Actions();
				actionObj.setActionName(actionName);
				// actionObj.setAssignedTo(Integer.parseInt(assignTo));
				// actionObj.setExpectedDt(doc);
				action.add(actionObj);

			} else {
				break;
			}

		}

		int i = MomDAO.insertMom(mom, Participants, action, request);
		System.out.println(i);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

	}

}
