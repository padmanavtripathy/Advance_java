package com.json;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;
import org.json.JSONException;

public class Home extends HttpServlet{  

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{      
        res.setContentType("text/html; charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        res.setCharacterEncoding("UTF-8");      
        StringWriter sWriter= new StringWriter();  
        PrintWriter out= new PrintWriter(sWriter);                     
        
        JSONObject jsonText = new JSONObject();
        String name = req.getParameter("fname");
        String lname = req.getParameter("lname");
        jsonText.put("name", name);
        jsonText.put("lname", lname);
        out.println(jsonText);
        try{
            JSONObject json = new JSONObject(jsonText);       
            String name1 = jsonText.getString("name");
            String lname1 = jsonText.getString("lname");
            out.println(json.toString()+"<br>"+"Name = "+name1);
            out.println(json.toString()+"<br>"+"LName = "+lname1);
        }catch(JSONException e){
            e.printStackTrace();
        }

        res.getWriter().print(sWriter.toString());
        out.flush();
        out.close();
    }       
}//class
