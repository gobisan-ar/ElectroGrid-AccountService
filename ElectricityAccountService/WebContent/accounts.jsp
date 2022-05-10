<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="com.electricityaccount.model.ElectricityAccountLogic"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ElectroGrid</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">	
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/accounts.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">

				<h4>Electricity Accounts Management</h4>
				<br>

				<form id="formAccount" name="formAccount" method="post"
					action="accounts.jsp">

					<label>Account name: </label>
					<input id="accName" name="accName" type="text" class="form-control form-control-sm"> 
					<br> 
					
					<label>Billing Address:</label> 
					<input id="accAddress" name="accAddress" type="text" class="form-control form-control-sm"> 
					<br>
					
					<label>Connection Premise: </label>
					<input id="accPremise" name="accPremise" type="text" class="form-control form-control-sm"> 
					<br>
					
					<label>Connection Type:</label>
					&nbsp;&nbsp;
					
					Permanent
					<input type="radio" class="conType" id="rdoTypePermanet" name="rdoType" value="Permanent"> 
					&nbsp;&nbsp; 
					
					Temporary 
					<input type="radio" class="conType" id="rdoTypeTemporary" name="rdoType" value="Temporary"> 
					<br><br>
					
					<label>Purpose:</label>
					&nbsp;&nbsp;
					<select id="ddlPurpose" name="ddlPurpose">
							<option value="0">--Purpose of Electricity usage--</option>
							<option value="Domestic">Domestic</option>
							<option value="Shop">Shop</option>
							<option value="Factory">Factory</option>
							<option value="Hotel">Hotel</option>
							<option value="Other">Other</option>
					</select>
					<br><br>
					
					<label>Electricity Supply:</label>
					&nbsp;&nbsp;
					<select id="ddlSupply" name="ddlSupply">
							<option value="0">--Electricity Supply--</option>
							<option value="15">Single Phase 15A</option>
							<option value="30">Single Phase 30A</option>
							<option value="60">Three Phase 60A</option>
					</select>
					<br><br>
					
					<label>Status:</label>
					&nbsp;&nbsp;
					
					Active
					<input type="radio" class="conStatus" id="rdoStatusActive" name="rdoStatus" value="Active"> 
					&nbsp;&nbsp; 
					
					Disconnected 
					<input type="radio" class="conStatus" id="rdoStatusDiscon" name="rdoStatus" value="Disconnected"> 
					<br><br>
					
					<br>
					<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary"> 
					
					<input type="hidden" id="hidAccountIDSave" name="hidAccountIDSave" value="">
				</form>

				<br>

				<div id="alertSuccess" class="alert alert-success"></div>
				<div id="alertError" class="alert alert-danger"></div>
				<br><br>
			</div>
			
			<div class="col">
				<%
					ElectricityAccountLogic eacc = new ElectricityAccountLogic();
					out.print(eacc.getAllElectricityAccounts());
				%>
			</div>
			<br><br>
		</div>
	</div>
</body>
</html>
