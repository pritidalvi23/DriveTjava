package view;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import create.Createpojo;
import create.Jdconn;


@WebServlet("/Edit")
public class Edit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BufferedReader br=request.getReader();
		String s = br.readLine();
		System.out.println("angular data"+s);
		
		ObjectMapper mp=new ObjectMapper();
	    Createpojo rp=mp.readValue(s,Createpojo.class);
		System.out.println("java object"+rp);
	
		try {
		Connection con = Jdconn.getDBConnection();

		PreparedStatement ps = con.prepareStatement("update drive set company_name=?, no_of_rsrcs=?, exp_req=?, ctc=?, position=?, join_crt=?,edu_crt=?,follow_up=?,bond=? where d_id=?");
		
		ps.setObject(1, rp.getCompany_Name());
		ps.setObject(2, rp.getResources());
		ps.setObject(3, rp.getExperience());
		ps.setObject(4, rp.getCtc());
		ps.setObject(5, rp.getPosition());
		ps.setObject(6, rp.getJoiningc());
		ps.setObject(7, rp.getEducationc());

		ps.setObject(8, rp.getFollowup());
		ps.setObject(9, rp.getBond());
		ps.setObject(10, rp.getD_id());
		int status = ps.executeUpdate();
    System.out.println(status);
		Map<String, String> m = new HashMap<>();

		if (status == 1) 
		{
			m.put("msg", "succesfully register");
		} 
		else 
		{
			m.put("msg", "error");
		}
		System.out.println("map object=" + m);
		
		String jsonstr=mp.writeValueAsString(m);
		
		System.out.println("json string="+jsonstr);
		
		PrintWriter pw=response.getWriter();
		
		pw.write(jsonstr);
		
			
		}catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			
		}
		
		
	
	}

	}


