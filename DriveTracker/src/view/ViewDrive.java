package view;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.sun.org.apache.xerces.internal.util.SynchronizedSymbolTable;

import create.Createpojo;

@WebServlet("/ViewD")
public class ViewDrive extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		try {
		
		Connection con=Jdbconn.getDBConnection();
		
		PreparedStatement ps=con.prepareStatement("select *from drive");
		
		ResultSet rs=ps.executeQuery();
		
		ArrayList<Createpojo>al=new ArrayList<>();
		
		while(rs.next())
		{
			Createpojo rp=new Createpojo();
			//System.out.println(rs.getString(2));
			rp.setD_id(rs.getInt(1));
			rp.setCompany_name(rs.getString(2));
			//System.out.println(rp.getCompany_Name());
			rp.setResources(rs.getInt(3));
			rp.setExperience(rs.getInt(4));
			rp.setCtc(rs.getInt(5));
			rp.setBond(rs.getFloat(7));
			rp.setPosition(rs.getInt(8));
			rp.setFollowup(rs.getString(9));
			rp.setEducationc(rs.getInt(10));
			rp.setJoiningc(rs.getInt(6));
		
			al.add(rp);
		}
		
		ObjectMapper ob=new ObjectMapper();
		String s=ob.writeValueAsString(al);
		PrintWriter pw=response.getWriter();
		pw.write(s);
		
		}
		catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			
		}
	}

}
