<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src='js/jquery.js'>
</script>

<style>
.container {
	border: 4px double black;
	display: inline-block;
}

.participants {
	border: 2px double black;
}

.actions {
	border: 2px double black;
}

.time {
	border: 2px double black;
}

table.center {
	margin-left: auto;
	margin-right: auto;
}

body {
	text-align: center;
}
</style>
</head>
<body>
	<div class="container">

		<form action="GenerateMoM" method="post">
			<div>
				<table class="center">
					<tr>

						<th>mom subject :</th>
						<th>mom purpose :</th>
					</tr>
					<tr>
						<td><input type="text" id="momSubject" name="subject" /></td>

						<td><input type="text" id="momPurpose" name="purpose" /></td>


					</tr>
					<tr>
						<td>Creator Id: <input type="text" id="creatorId" name="creatorId"></td>
					
					</tr>


				</table>

			</div>
			<br>
			<div class="time">
				<table class="center">
					<tr>

						<th>Meeting Initiated at :</th>
						<th>Meeting Terminted at:</th>
					</tr>
					<tr>
						<td><input type="time" id="momSubject" name="startTime" /></td>

						<td><input type="time" id="momPurpose" name="endTime" /></td>

						<td>
					</tr>


				</table>

			</div>

	<div class="info">

				<table >
					<tr>
						<th>Decisions taken</th>
						<th>Points discussed</th>
					</tr>
					<tr>
					<td><textarea rows="3" cols="20" placeholder="DecisionTaken" name="dt"></textarea>
					<td><textarea rows="3" cols="20" placeholder="points discussed" name="pd"></textarea>
					</tr>

				</table>
				

			</div>
			<div class="participants">

				<table id="partTable">
					<tr>
						<th>Enter participants Id:</th>
						<th>Enter Attendance :</th>
					</tr>
					<tr>
						<td><input type="text" id="part1" name="part1" /></td>
						<td><select name='attendance1' id='attendance1'>
								<option value='present'>Present</option>
								<option value='absent'>Absent</option>
						</select></td>
					</tr>

				</table>
					<input type="button" value="add" id="addPart" name="add" />

			</div>

			<div class="actions">

				<table id="actTable">
					<tr>
						<th>Enter Action Items</th>
						<th>Action Owner</th>
					</tr>
					<tr>
						<td><input type="text" placeholder="Enter Action Items" id="actionOwner1" name="actionItem1"/></td>


						<td><input type="text"  placeholder="Enter emp id" name="actionOwner1" id="actionOwner1" /></td>

					</tr>

				</table>
					<input type="button" value="add" id="addActions" name="add" />

			</div>

			<div class="items">

				<table>

					<tr>
						<th>Open items</th>
					</tr>
					<tr>
						<td><textarea rows="3" cols="20" name="openItems"></textarea></td>
						<td><button type="submit">CREATE MOM</button> </td>
					</tr>
				</table>


			</div>
		</form>

	</div>
	
	
	
	<script>
	 var idPartVal=1;
	 var idActVal=1;
	 
	$('#addPart').click(function()
			
	
	{
		
		idPartVal+=1;
		if(idPartVal<15)
		$('#partTable').append(" <tr> <td><input type='text' id='part"+idPartVal+"' name='part"+idPartVal+"' /></td> <td><select name='attendance"+idPartVal+"' id=''attendance"+idPartVal+"' > <option value='present'>Present</option> <option value='absent'>Absent</option> </select></td></tr>");
	});
	$('#addActions').click(function()
			
			
			{
				
				idActVal+=1;
				if(idActVal<15)
				$('#actTable').append(" <tr> <td><input type='text' placeholder='Enter Action Items' name='actionItem"+idActVal+"'/></td> <td><input type='text' placeholde='Enter emp id' name='actionOwner"+idActVal+"' id='actionOwner"+idActVal+"' /></td></tr>");
			});
	
	</script>
</body>
</html>
