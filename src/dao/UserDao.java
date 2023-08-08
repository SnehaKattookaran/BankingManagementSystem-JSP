package dao;

import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import bean.UserBean;
import java.sql.DriverManager;
import java.sql.Connection;

public class UserDao
{
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");
        }
        catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }
    
    public static int emplogin(final UserBean ub) {
        int position = 0;
        try {
            if (ub.getEmail().contentEquals("admin@gmail.com") && ub.getPassword().contentEquals("admin")) {
                position = 1;
            }
            else if (ub.getEmail().contentEquals("hr@gmail.com") && ub.getPassword().contentEquals("hr123")) {
                position = 2;
            }
        }
        catch (Exception e) {
            System.out.println(e);
        }
        return position;
    }
    
    public static long custlogin(final UserBean ub) {
        long acctno = 0L;
        try {
            final Connection con = getConnection();
            final PreparedStatement ps = con.prepareStatement("select * from Cust_reg WHERE email=? AND password=?");
            ps.setString(1, ub.getEmail());
            ps.setString(2, ub.getPassword());
            final ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                acctno = rs.getInt("acc_no");
            }
        }
        catch (Exception e) {
            System.out.println(e);
        }
        return acctno;
    }
    
    public static int empsave(final UserBean ub) {
        int status = 0;
        try {
            final Connection con = getConnection();
            final PreparedStatement p = con.prepareStatement("select * from Emp_master WHERE designation=?");
            p.setString(1, ub.getEmp_designation());
            final ResultSet rs = p.executeQuery();
            if (rs.next()) {
                final int salary = rs.getInt("basic_pay") + rs.getInt("basic_pay") * rs.getInt("DA") / 100 + rs.getInt("basic_pay") * rs.getInt("HRA") / 100;
                final PreparedStatement ps = con.prepareStatement("insert into Emp_reg (emp_name,emp_place,emp_designation,emp_age,emp_qualification,emp_salary) values(?,?,?,?,?,?)");
                ps.setString(1, ub.getEmp_name());
                ps.setString(2, ub.getEmp_place());
                ps.setString(3, ub.getEmp_designation());
                ps.setInt(4, ub.getEmp_age());
                ps.setString(5, ub.getEmp_qualification());
                ps.setInt(6, salary);
                status = ps.executeUpdate();
            }
        }
        catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }
    
    public static int custsave(final UserBean ub) {
        int status = 0;
        try {
            final Connection con = getConnection();
            final PreparedStatement ps = con.prepareStatement("insert into Cust_reg (cust_name,cust_place,cust_mobileno,acc_type,email,password,bal_amnt) values(?,?,?,?,?,?,?)");
            ps.setString(1, ub.getCust_name());
            ps.setString(2, ub.getCust_place());
            ps.setLong(3, ub.getCust_mobileno());
            ps.setString(4, ub.getAcc_type());
            ps.setString(5, ub.getEmail());
            ps.setString(6, ub.getPassword());
            ps.setDouble(7, 0.0);
            status = ps.executeUpdate();
        }
        catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }
    
    public static List<UserBean> getAllEmpRecords() {
        final List<UserBean> list = new ArrayList<UserBean>();
        try {
            final Connection con = getConnection();
            final PreparedStatement ps = con.prepareStatement("select r.emp_id,r.emp_name,r.emp_place,r.emp_designation,r.emp_age,r.emp_qualification,m.basic_pay,m.DA,m.HRA,r.emp_salary from Emp_reg as r left join Emp_master as m on r.emp_designation=m.designation order by r.emp_id");
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                final UserBean ub = new UserBean();
                ub.setEmp_id(rs.getInt("emp_id"));
                ub.setEmp_name(rs.getString("emp_name"));
                ub.setEmp_place(rs.getString("emp_place"));
                ub.setEmp_designation(rs.getString("emp_designation"));
                ub.setEmp_age(rs.getInt("emp_age"));
                ub.setEmp_qualification(rs.getString("emp_qualification"));
                final int BasicPay = rs.getInt("basic_pay");
                final int DA = rs.getInt("DA") * BasicPay / 100;
                final int HRA = rs.getInt("HRA") * BasicPay / 100;
                ub.setBasic_pay(BasicPay);
                ub.setDA(DA);
                ub.setHRA(HRA);
                ub.setEmp_salary(rs.getInt("emp_salary"));
                list.add(ub);
            }
        }
        catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public static List<UserBean> getAllCustRecords() {
        final List<UserBean> list1 = new ArrayList<UserBean>();
        try {
            final Connection con = getConnection();
            final PreparedStatement ps = con.prepareStatement("select * from Cust_reg");
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                final UserBean ub = new UserBean();
                ub.setAcc_no(rs.getLong("acc_no"));
                ub.setCust_name(rs.getString("cust_name"));
                ub.setCust_place(rs.getString("cust_place"));
                ub.setCust_mobileno(rs.getLong("cust_mobileno"));
                ub.setAcc_type(rs.getString("acc_type"));
                ub.setEmail(rs.getString("email"));
                ub.setPassword(rs.getString("password"));
                ub.setBal_amnt(rs.getDouble("bal_amnt"));
                list1.add(ub);
            }
        }
        catch (Exception e) {
            System.out.println(e);
        }
        return list1;
    }
    
    public static UserBean getCustRecordByNumber(final long number) {
        UserBean ub = null;
        try {
            final Connection con = getConnection();
            final PreparedStatement ps = con.prepareStatement("select * from Cust_reg where acc_no=?");
            ps.setLong(1, number);
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ub = new UserBean();
                ub.setCust_name(rs.getString("cust_name"));
                ub.setCust_place(rs.getString("cust_place"));
                ub.setCust_mobileno(rs.getLong("cust_mobileno"));
                ub.setAcc_type(rs.getString("acc_type"));
                ub.setEmail(rs.getString("email"));
                ub.setPassword(rs.getString("password"));
                ub.setBal_amnt(rs.getDouble("bal_amnt"));
                ub.setAcc_no(rs.getLong("acc_no"));
            }
        }
        catch (Exception e) {
            System.out.println(e);
        }
        return ub;
    }
    
    public static int cashtrans(final UserBean ub, final long number) {
        int status = 0;
        try {
            final Connection con = getConnection();
            final PreparedStatement ps = con.prepareStatement("select * from Cust_reg where acc_no=?");
            ps.setLong(1, number);
            final ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                if (ub.getDeposit() > 0.0) {
                    final double balance1 = rs.getDouble("bal_amnt") + ub.getDeposit();
                    final PreparedStatement p1 = con.prepareStatement("update Cust_reg set bal_amnt=? where acc_no=?");
                    p1.setDouble(1, balance1);
                    p1.setLong(2, number);
                    p1.executeUpdate();
                    status = 1;
                }
                else if (ub.getWithdrawal() > 0.0 && ub.getWithdrawal() <= rs.getDouble("bal_amnt")) {
                    final double balance2 = rs.getDouble("bal_amnt") - ub.getWithdrawal();
                    final PreparedStatement p2 = con.prepareStatement("update Cust_reg set bal_amnt=? where acc_no=?");
                    p2.setDouble(1, balance2);
                    p2.setLong(2, number);
                    p2.executeUpdate();
                    status = 2;
                }
                else if (ub.getWithdrawal() >= 0.0 && ub.getWithdrawal() > rs.getDouble("bal_amnt")) {
                    status = 3;
                }
            }
        }
        catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }
} 