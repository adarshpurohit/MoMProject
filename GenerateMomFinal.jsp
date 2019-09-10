<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="js/jquery.js">
</script>

</head>
<style>
table {
	border: 2px dotted red;
}
</style>
</head>



<body>
	<center>
	
		<form method='post' action='GenerateMoM'>
			<br>
			<table>

				<tr>
					<th>Subject:</th>
					<td><textarea rows="1" cols="50"
							placeholder="Enter the subject of meeting..." id='subject'
							name='subject' required></textarea></br></td>
				</tr>
				<tr>
					<th>Enter Creater Id:</th>
					<td><input type="text" 
							placeholder="Enter creator id" id='creator'
							name='creator' required/></br></td>
				</tr>
				<tr>
					<th>Meeting Purpose:</th>
					<td><textarea rows="1" cols="50"
							placeholder="Enter the purpose of meeting..." id='purpose'
							name='purpose'></textarea></br></td>
				</tr>
				<tr>
					<th>Date:</th>
					<td><input type="date" id='date' name='date' /></br></td>
				</tr>
				<tr>
					<th>Start Time:</th>
					<td><input type="time" id='start_time' name='start_time' /></td>
				</tr>
				<tr>
					<th>End Time:</th>
					<td><input type="time" id='end_time' name='end_time' /></td>
				</tr>
			</table>
			Participants:
			<table border=2 id="myTable">

				<tr>
					<td><input type='number' rows="1" cols="10"
						placeholder="Add Employee code" id='1' name='code1'></input></td>
					<td><select name='attendance1' id='1'>
							<option value='present'>  present </option>
							<option value='absent'>  absent </option>
					</select> <input type="button" value="+" id="addPartic" name="add" /> 
				
				</tr>


			</table>
			<h2>Please enter the details of the meeting below :</h2>
			<br> Points Discussed:
			<table border=2 id="points_discussed">
				<tr>
					<td><textarea rows="1" cols="50"
							placeholder="Enter the points to be Discussed..."
							name='points_discussed1'></textarea></td>
				</tr>
			</table>
			<br> <input type="button" value="add" id="addPoint" name="add" /><br>
			Decision Taken:<br>
			<textarea rows="4" cols="50"
				placeholder="Enter the decisions taken..." id='decisionTaken'
				name='decisionTaken'></textarea>
			<br> <br> Action Items:
			<table border=2 id="actionTable">

				<tr>
					<th>Action</th>

				</tr>
				<tr>
					<td><textarea rows="1" cols="30"
							placeholder="Add Action items" id='ActionItem1'
							name='ActionItem1' class='c1'></textarea></td>

				</tr>
			</table>
			<input type="button" value="add" id="addAction" />
			<div id="errorAction"></div>
			Open Items:<br>
			<textarea rows="4" cols="50" placeholder="Enter..." id='open_items'
				name='open_items'></textarea>
			<br> <input type="submit" value="Submit" />
		</form>

		<script>
			var idValue = 1;
			var idValPoint = 1;
			var idValAction = 1;
			$('#addPartic')
					.click(
							function() {
								idValue = idValue + 1;
								if (idValue < 11)
									$('#myTable')
											.append(
													" <tr> <td><input type='number' rows='1' cols='10'  placeholder='Add Employee code' id='"+idValue+"' name='code"+idValue+"'></textarea></td> "
															+ "<td> <select name='attendance"+idValue+"'> <option  value='present'>  present </option> "
															+ "<option  value='absent'>  absent </option></select> </td> </tr>");
							});
			
			$('#addPoint')
					.click(
							function() {
								idValPoint = idValPoint + 1;
								if (idValPoint < 6)
									$('#points_discussed')
											.append(
													"<tr> <td> <textarea rows='1' cols='50' placeholder='Enter the points to be Discussed...' name='points_discussed"+idValPoint+"'></textarea> </td> </tr>");
							});
			$('#addAction')
					.click(
							function() {

								idValAction = idValAction + 1;
								if (idValAction < 6)
									$('#actionTable')
											.append(
													"<tr> "
															+ "<td><textarea rows='1' cols='30' placeholder='Add Action items' id='ActionItem"+idValAction+"' name='ActionItem"+idValAction+"' class='c1'></textarea></td>"
															+ "</tr>");

							});
		</script>
	</center>

</body>
</html>