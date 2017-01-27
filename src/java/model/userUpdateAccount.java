package model;

import db.UpdateAccountDatabase;
import dto.EditAccount;
import java.sql.*;

public class userUpdateAccount 
{
    String npassword,ccpassword;

    public String getNpassword() {
        return npassword;
    }

    public void setNpassword(String npassword) {
        this.npassword = npassword;
    }

    public String getCcpassword() {
        return ccpassword;
    }

    public void setCcpassword(String ccpassword) {
        this.ccpassword = ccpassword;
    }
    public boolean edit(EditAccount ea)
    {
        String empid=ea.getEmpid();
        System.out.println("here emp id is "+empid);
        String address=ea.getAddress();
        String pincode = ea.getPincode();
        String password= ea.getPassword();
        System.out.println("current password is"+password);
        System.out.println("new password is "+npassword);
        System.out.println("confirm new password is"+ccpassword);
        Connection con = UpdateAccountDatabase.getCon();
        PreparedStatement pst=UpdateAccountDatabase.getSt();
        try
        {
           pst=con.prepareStatement("update regrecord set address=?, pincode=?,password=? where empid=?");
            pst.setString(1,address);
            pst.setString(2,pincode);
            if(npassword!=null && ccpassword!=null&& !npassword.trim().equals("")&& !ccpassword.trim().equals("") && npassword.equals(ccpassword))
            {
                System.out.println("i am in this block"+npassword);
                ea.setPassword(npassword);
                password= npassword;
            }
            pst.setString(3,password);
            pst.setString(4, empid);
            
            int i = pst.executeUpdate();

            if(i>0)
            {
                System.out.println(i+" Record Updated");
                return true;
            }
            else
            {
                System.out.println("Record Not Updated");
                return false;
            }
        } 
        catch (SQLException e) 
        {
            System.out.println(e);
        }
        return false;
        }
    }
