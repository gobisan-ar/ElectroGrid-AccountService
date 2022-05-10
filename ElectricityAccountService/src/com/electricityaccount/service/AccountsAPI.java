package com.electricityaccount.service;

import java.io.IOException; 
import java.util.HashMap; 
import java.util.Map; 
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.electricityaccount.model.ElectricityAccount;
import com.electricityaccount.model.ElectricityAccountLogic;

/**
 * Servlet implementation class AccountsAPI
 */
@WebServlet("/AccountsAPI")
public class AccountsAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ElectricityAccountLogic eacclogic = new ElectricityAccountLogic();

	/**
	 * Default constructor. 
	 */
	public AccountsAPI() {
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ElectricityAccount eacc = new ElectricityAccount();

		eacc.setEaccName(request.getParameter("accName"));
		eacc.setBillingAddress(request.getParameter("accAddress"));
		eacc.setPremise(request.getParameter("accPremise"));
		eacc.setConType(request.getParameter("rdoType"));
		eacc.setConPurpose(request.getParameter("ddlPurpose"));
		eacc.setElectrcitySupply(request.getParameter("ddlSupply"));
		eacc.setConStatus(request.getParameter("rdoStatus"));

		String output = eacclogic.insertElectricityAccount(eacc); 

		response.getWriter().write(output); 
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map paras = getParasMap(request); 

		ElectricityAccount eacc = new ElectricityAccount();

		eacc.setEaccID(Integer.parseInt(paras.get("hidAccountIDSave").toString()));
		eacc.setEaccName(paras.get("accName").toString());
		eacc.setBillingAddress(paras.get("accAddress").toString());
		eacc.setPremise(paras.get("accPremise").toString());
		eacc.setConType(paras.get("rdoType").toString());
		eacc.setConPurpose(paras.get("ddlPurpose").toString());
		eacc.setElectrcitySupply(paras.get("ddlSupply").toString());
		eacc.setConStatus(paras.get("rdoStatus").toString());

		String output = eacclogic.updateElectricityAccount(eacc); 
		response.getWriter().write(output); 
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map paras = getParasMap(request); 
		String output = eacclogic.deleteElectricityAccount(Integer.parseInt(paras.get("accountID").toString())); 
		response.getWriter().write(output); 

	}

	// Convert request parameters to a Map
	private static Map getParasMap(HttpServletRequest request) 
	{ 
		Map<String, String> map = new HashMap<String, String>(); 
		try
		{ 
			Scanner scanner = new Scanner(request.getInputStream(), "UTF-8"); 
			String queryString = scanner.hasNext() ? 
					scanner.useDelimiter("\\A").next() : ""; 
			scanner.close(); 
			String[] params = queryString.split("&"); 
			for (String param : params) 
			{ 

				String[] p = param.split("="); 
				map.put(p[0], p[1]); 
			} 
		} 
		catch (Exception e) 
		{ 
		} 
		return map; 
	}
}
