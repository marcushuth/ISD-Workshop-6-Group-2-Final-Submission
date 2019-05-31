package ISD.dao;

import ISD.entity.OrderInfo;
import ISD.util.DBUtil;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;


public class OrderDao {
    

    public List<OrderInfo> selectOrderList(String userid,String orderId, String startTimeDate, String endTime) throws SQLException{
       StringBuffer sql = new StringBuffer();
       List<Object> preparms = new ArrayList();
       List<OrderInfo> orders = new ArrayList();
         sql.append("select * from OrderInfo where 1=1 ");
         if(userid==null||userid.length()==0){
             sql.append("and user_id is null");
         }else{
              sql.append("and user_id = ?");
              preparms.add(userid);
         } 
        if(startTimeDate!=null&&startTimeDate.length()>0){
              sql.append(" and create_Date>='"+startTimeDate+"'");
          }
        if(endTime!=null&&endTime.length()>0){
            sql.append(" and create_Date<='"+endTime+"'");
        }
         if(orderId!=null&&orderId.length()>0){
            sql.append(" and id="+orderId);
        }
        ResultSet rs=DBUtil.runSelectSql(sql.toString(), preparms.toArray()); 
        while(rs.next()){  
                    OrderInfo order=new OrderInfo();  
                    order.setOrderId(rs.getLong("ID"));
                    order.setMovieName(rs.getString("movie_name"));
                    order.setMoviePrice(rs.getDouble("movie_price"));
                    order.setMovieNumber(rs.getInt("quantity"));
                    order.setCreateDate(rs.getDate("create_date"));
                    order.setUserId(rs.getString("user_id"));
                    order.setStatus(rs.getInt("status"));
                    order.setMovieId(rs.getInt("movie_id"));
                    orders.add(order);  
                }  
        return  orders;
     }
    
    
    public OrderInfo selectOrderById(String orderId) throws SQLException{
        return  selectOrderList(null,orderId,null,null).get(0);
     }
    
    public void addOrder(OrderInfo order) throws SQLException{
        List<Object> preparms = new ArrayList();
        String sql = "insert into OrderInfo(id,movie_id,movie_name,movie_price,quantity,user_id,create_date)"
                + " values(?,?,?,?,?,?,?)";
        preparms.add(order.getOrderId());
        preparms.add(order.getMovieId());
        preparms.add(order.getMovieName());
        preparms.add(order.getMoviePrice());
        preparms.add(order.getMovieNumber());
        preparms.add(order.getUserId());
        preparms.add(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(order.getCreateDate()));
        DBUtil.runNoSelectSql(sql, preparms.toArray());
        
    }
    
    public void updateOrder(String orderId,int movieNumber) throws SQLException{
        String sql = "update OrderInfo set quantity=? where id = ?";
        List<Object> preparms = new ArrayList();
        preparms.add(movieNumber);
        preparms.add(orderId);
        DBUtil.runNoSelectSql(sql, preparms.toArray());
    }
    
     public void updateOrderStatus(String orderId,int status) throws SQLException{
        String sql = "update OrderInfo set status=? where id = ? ";
        List<Object> preparms = new ArrayList();
        preparms.add(status);
        preparms.add(orderId);
        DBUtil.runNoSelectSql(sql, preparms.toArray());
    }
     
    
}
