/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package inc;

import java.sql.Connection;
import java.sql.DriverManager;
/**
 *
 * @author LUKAS PUTRA DIANTAMA
 */
public class config {
    public static Connection conn;
    
    public static Connection Conn(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/8772","root","");
        }catch(Exception e){
            System.out.println("Kok Gak Bisa Konek Ke Database Ki Piye Lhooo Jhonnn :( ");
        }
        return conn;
    }
    
    public static void main(String args[]){
        System.out.println(config.Conn());
    }
}
