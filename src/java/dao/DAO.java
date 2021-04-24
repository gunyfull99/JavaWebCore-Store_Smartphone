package dao;
//load data from sql 

import context.DBContext;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Product> getALl() {
        List<Product> list = new ArrayList<>();
        String query = "select * from product";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7)));
            }

        } catch (Exception e) {
        }
        return list;
    }

    public List<Customer> getCustomers() {
        String query = "select * from Customer";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            List<Customer> list = new ArrayList<>();
            while (rs.next()) {
                Customer c = new Customer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7));
                list.add(c);
            }
            return list;
        } catch (Exception e) {
        }

        return null;
    }

    public List<Bill> getBills() {
        String query = "select * from Bill";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            List<Bill> list = new ArrayList<>();
            while (rs.next()) {
                Bill c = new Bill(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8));
                list.add(c);
            }
            return list;
        } catch (Exception e) {
        }

        return null;
    }

    public List<Bill> searchBill(int status) {
        String query = "select * from Bill where status=?";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, status);
            rs = ps.executeQuery();
            List<Bill> list = new ArrayList<>();
            while (rs.next()) {
                Bill c = new Bill(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8));
                list.add(c);
            }
            return list;
        } catch (Exception e) {
        }

        return null;
    }

    public List<BillDetail> getBillDetails(int bid) {
        String query = "select * from BillDetail where bid=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, bid);
            rs = ps.executeQuery();
            List<BillDetail> list = new ArrayList<>();
            while (rs.next()) {
                BillDetail c = new BillDetail(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getDouble(4), rs.getString(5));
                list.add(c);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public int getStatus(int bid) {
        String query = "select status from Bill where bid=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, bid);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public Customer selectCustomer(int n) {

        String query = "select * from Customer where cid=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, n);
            rs = ps.executeQuery();
            while (rs.next()) {
                Customer c = new Customer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7));
                return c;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public int updateCustomer(int cid, String fullName, String address, String phone, int status) {
        String query = "UPDATE Customer SET fullName=?, address=?, phone=?,status=? where cid=?";
        int n = 0;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, fullName);
            ps.setString(2, address);
            ps.setString(3, phone);
            ps.setInt(4, status);
            ps.setInt(5, cid);
            n = ps.executeUpdate();
            //rs = stm.executeQuery();
        } catch (Exception ex) {
        }
        return n;
    }

    public int updateNameBill(String fullName, int cid) {
        String query = "UPDATE Bill SET recName=? where cid=?";
        int n = 0;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, fullName);
            ps.setInt(2, cid);
            n = ps.executeUpdate();
            //rs = stm.executeQuery();
        } catch (Exception ex) {
        }
        return n;
    }

    public void updateBill(int bid, int status) {
        String query = "UPDATE Bill SET status =? where bid=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, status);
            ps.setInt(2, bid);
            ps.executeUpdate();
            //rs = stm.executeQuery();
        } catch (Exception ex) {
        }
    }

    public int insertCustomer(String fullName, String address, String phone, String username, String password, int status) {
        String query = "insert into Customer(fullName,address,phone,username,password,status) values(?,?,?,?,?,?)";
        int n = 0;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, fullName);
            ps.setString(2, address);
            ps.setString(3, phone);
            ps.setString(4, username);
            ps.setString(5, password);
            ps.setInt(6, status);
            n = ps.executeUpdate();
            //rs=stm.executeQuery();
        } catch (Exception ex) {
        }
        return n;
    }

    public int insertBill(Date dateCreate, double total, String recName, String recAddress, String recPhone, int status, int cid) {
        String query = "insert into Bill(dateCreate,total,recName,recAddress,recPhone,status,cid) values(?,?,?,?,?,?,?)";
        int n = 0;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setDate(1, dateCreate);
            ps.setDouble(2, total);
            ps.setString(3, recName);
            ps.setString(4, recAddress);
            ps.setString(5, recPhone);
            ps.setInt(6, status);
            ps.setInt(7, cid);
            n = ps.executeUpdate();
            //rs=stm.executeQuery();
        } catch (Exception ex) {
        }
        return n;
    }

    public int check(int id, List<Product> list) {
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getId() == id) {
                return i;
            }
        }

        return -1;
    }

    public Product add2Cart(int id) {
        String sql = "select * from product where id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5), rs.getString(6), rs.getInt(7), 1);
            }

        } catch (Exception e) {
        }
        return null;
    }

    public int getBid() {
        String sql = "select top (1) bid from Bill order by bid DESC";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
        }
        return 0;
    }

    public int insertBillDetails(int bid, int pid, int quantity, double price, String nameProduct) {
        String query = "insert into BillDetail(bid,pid,quantity,price,nameProduct) values(?,?,?,?,?)";
        int n = 0;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, bid);
            ps.setInt(2, pid);
            ps.setInt(3, quantity);
            ps.setDouble(4, price);
            ps.setString(5, nameProduct);
            n = ps.executeUpdate();
            //rs=stm.executeQuery();
        } catch (Exception ex) {
        }
        return n;

    }

    public Customer getCus(String id) {
        String sql = "select * from Customer where username=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Customer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public int countProduct() {
        String query = "select count (*) from product";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Product> getProduct(int paging) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT*FROM  product ORDER BY  id OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY;";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, paging);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7)));
            }

        } catch (Exception e) {
        }
        return list;
    }

    public void updateProduct(String name, String image, double price, String title, String description, int cateID, String id) {
        String query = "UPDATE product SET name=?, image=?, price=?,title=?,description=?,cateID=?  WHERE id=?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, name);//nem cau lenh query sang sql
            ps.setString(2, image);//nem cau lenh query sang sql
            ps.setDouble(3, price);
            ps.setString(4, title);//nem cau lenh query sang sql
            ps.setString(5, description);//nem cau lenh query sang sql
            ps.setInt(6, cateID);//nem cau lenh query sang sql
            ps.setString(7, id);//nem cau lenh query sang sql
            ps.executeUpdate();
            //rs = stm.executeQuery();
        } catch (Exception ex) {
        }
    }

    public void updateProductQuantity(int quantity, int id) {
        String query = "UPDATE product SET quantity=quantity-? WHERE id=?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, quantity);//nem cau lenh query sang sql
            ps.setInt(2, id);//nem cau lenh query sang sql
            ps.executeUpdate();
            //rs = stm.executeQuery();
        } catch (Exception ex) {
        }
    }

    public void insetProduct(String name, String image, double price, String title, String description, int cateID, int sell_id) {
        try {
            String query = "insert into product(name,image,price,title,description,cateID,sell_ID)\n"
                    + "values(?,?,?,?,?,?,?)";
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, name);//nem cau lenh query sang sql
            ps.setString(2, image);//nem cau lenh query sang sql
            ps.setDouble(3, price);
            ps.setString(4, title);//nem cau lenh query sang sql
            ps.setString(5, description);//nem cau lenh query sang sql
            ps.setInt(6, cateID);//nem cau lenh query sang sql
            ps.setInt(7, sell_id);//nem cau lenh query sang sql
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteProduct(String id) {
        String query = "delete  from product where id= ?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public void deleBill(int id) {
        String query = "delete  from Bill where bid= ?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public void deleBillDetail(int id) {
        String query = "delete  from BillDetail where bid= ?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public void deleteCus(int id) {
        String query = "delete  from Customer where cid= ?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public List<Product> getProductByPID(int id) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product where sell_ID = ?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setInt(1, id);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7)));
            }

        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getProductByID(String id) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product where cateID=?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, id);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7)));
            }

        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> searchProducts(String name) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product where name like ?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, "%" + name + "%");
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7)));
            }

        } catch (Exception e) {
        }
        return list;
    }

    public Product getDetailProduct(String id) {
        String query = "select * from product where id=?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, id);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7));
            }

        } catch (Exception e) {
        }
        return null;
    }

    public List<Account> getALLAccount() {
        List<Account> list = new ArrayList<>();
        String query = "select * from account";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5)));
            }

        } catch (Exception e) {
        }
        return list;
    }

    public List<Category> getALLCate() {
        List<Category> list = new ArrayList<>();
        String query = "select * from category";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Category(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Product getLast() {
        String query = "select top 1 * from product\n"
                + "order by id desc";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Account login(String account, String pass) {
        String query = "select * from Account where [user]= ? and pass=?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, account);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Account checkAccountExist(String account) {
        String query = "select * from Account where [user]= ? ";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, account);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void insertAccount(String user, String pass, int admin) {
        String query = "insert into Account([user],pass,isSell,isAdmin) values(?,?,0,?)";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setInt(3, admin);
            ps.executeUpdate();

        } catch (Exception e) {
        }

    }

}
