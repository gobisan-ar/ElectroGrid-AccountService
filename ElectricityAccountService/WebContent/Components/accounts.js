$(document).ready(function() 
{ 
	if ($("#alertSuccess").text().trim() == "") 
	 { 
	 	$("#alertSuccess").hide(); 
	 } 
	 $("#alertError").hide(); 
});
 
// SAVE ============================================
$(document).on("click", "#btnSave", function(event) 
{ 
	// Clear alerts
	 $("#alertSuccess").text(""); 
	 $("#alertSuccess").hide(); 
	 $("#alertError").text(""); 
	 $("#alertError").hide(); 

	// Form validation
	var status = validateAccountForm(); 
	if (status != true) 
	 { 
		 $("#alertError").text(status); 
		 $("#alertError").show(); 
		 return; 
	 } 

	// If valid
	var type = ($("#hidAccountIDSave").val() == "") ? "POST" : "PUT";

	$.ajax( 
	{ 
		 url : "AccountsAPI", 
		 type : type, 
		 data : $("#formAccount").serialize(), 
		 dataType : "text", 
		 complete : function(response, status) 
		 { 
		 	onAccountSaveComplete(response.responseText, status); 
		 } 
	});
}); 

// UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event) 
{ 
	 $("#hidAccountIDSave").val($(this).data("accountid"));   
	 $("#accName").val($(this).closest("tr").find('td:eq(0)').text()); 
	 $("#accAddress").val($(this).closest("tr").find('td:eq(1)').text()); 
	 $("#accPremise").val($(this).closest("tr").find('td:eq(2)').text()); 
  	 $('input[name="rdoType"]:checked').val($(this).closest("tr").find('td:eq(3)').text()); 
  	 $("#ddlPurpose").val($(this).closest("tr").find('td:eq(4)').text()); 
  	 $("#ddlSuply").val($(this).closest("tr").find('td:eq(5)').text()); 
  	 $('input[name="rdoStatus"]:checked').val($(this).closest("tr").find('td:eq(5)').text()); 
  	 
}); 

$(document).on("click", ".btnRemove", function(event) 
{ 
	 $.ajax( 
	 { 
		 url : "AccountsAPI", 
		 type : "DELETE", 
		 data : "accountID=" + $(this).data("accountid"),
		 dataType : "text", 
		 complete : function(response, status) 
		 { 
		 	onAccountDeleteComplete(response.responseText, status); 
		 } 
	 }); 
});
	
// CLIENT-MODEL================================================================
function validateAccountForm() 
{ 
	if ($("#accName").val().trim() == "") 
	 { 
	 	return "Insert Account Name."; 
	 } 

	if ($("#accAddress").val().trim() == "") 
	 { 
	 	return "Insert Billing Address."; 
	 }

	if ($("#accPremise").val().trim() == "") 
	 { 
	 	return "Insert Connection Premise."; 
	 } 
	 
	 if ($('input[name="rdoType"]:checked').length === 0) 
	 { 
	 	return "Select Connection Type."; 
	 } 

	if ($("#ddlPurpose").val() == "0") 
	 { 
	 	return "Select usage purpose."; 
	 } 

	return true; 
}

function onAccountSaveComplete(response, status) 
{ 
	if (status == "success") 
	 { 
	 	var resultSet = JSON.parse(response); 
	 	
	 	if (resultSet.status.trim() == "success") 
		 	{ 
		 $("#alertSuccess").text("Successfully saved."); 
		 $("#alertSuccess").show(); 
		 $("#divAccountsGrid").html(resultSet.data); 
	 	} else if (resultSet.status.trim() == "error") 
	 	{ 
			 $("#alertError").text(resultSet.data); 
			 $("#alertError").show(); 
	 	} 
	 } else if (status == "error") 
	 { 
		 $("#alertError").text("Error while saving."); 
		 $("#alertError").show(); 
	 } else
	 { 
		 $("#alertError").text("Unknown error while saving.."); 
		 $("#alertError").show(); 
	 }
	 $("#hidAccountSave").val(""); 
	 $("#formAccount")[0].reset(); 
}

function onAccountDeleteComplete(response, status) 
{ 
	if (status == "success") 
	 { 
		 var resultSet = JSON.parse(response); 
		 
		 if (resultSet.status.trim() == "success") 
		 { 
		 	$("#alertSuccess").text("Successfully deleted."); 
		 	$("#alertSuccess").show(); 
		 	
		 	$("#divAccountsGrid").html(resultSet.data); 
		 } else if (resultSet.status.trim() == "error") 
		 { 
		 	$("#alertError").text(resultSet.data); 
		 	$("#alertError").show(); 
		 } 
	 } else if (status == "error") 
	 { 
	 	$("#alertError").text("Error while deleting."); 
	 	$("#alertError").show(); 
	 } else
	 { 
	 	$("#alertError").text("Unknown error while deleting.."); 
	 	$("#alertError").show(); 
	 } 
}
