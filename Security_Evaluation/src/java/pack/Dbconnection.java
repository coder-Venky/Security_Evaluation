/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pack;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author IBN33
 */
public class Dbconnection {

    public static Connection getConn() throws Exception{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/security_evaluation","root","root");
         return con;
    }
    
}
