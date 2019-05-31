package ISD.controller;

import ISD.dao.MovieDao;
import ISD.dao.OrderDao;
import ISD.entity.Movie;
import ISD.entity.OrderInfo;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Calendar;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "OrderServlet", urlPatterns = {"/OrderServlet"})
public class OrderServlet extends HttpServlet {
    
    private OrderDao movieOrderDao = new OrderDao();
    private MovieDao movieDao = new MovieDao();
   
     protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         doGet(request,response);
     }
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String type = request.getParameter("type");
        try{
            if("save".equals(type)){ 
                String orderId = request.getParameter("orderId");
                if(orderId==null||orderId.length()==0){
                   insert(request, response);
                }else{
                    update(request, response);
                }
            }else if("confirm".equals(type)){
                confirm(request, response);
            }else if("cancel".equals(type)){
                cancel(request, response);
            }else if("selectAll".equals(type)){
                selectAll(request, response);
            } else if("openAddPage".equals(type)){
               openAddPage(request, response);
           }else if("openUpdatePage".equals(type)){
               openUpdatePage(request, response);
           }
        }catch(Exception ex){
            request.setAttribute("msg", ex.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request,response);
        }
    }

    private void insert(HttpServletRequest request, HttpServletResponse response) throws ParseException, SQLException, ServletException, IOException {
       Integer movieId = Integer.valueOf(request.getParameter("movieId"));
       int movieNumber = Integer.valueOf(request.getParameter("movieNumber"));
       Movie movie = movieDao.selectById(movieId);    
       String movieName = movie.getMovieName();
        double moviePrice = movie.getMoviePrice();
       OrderInfo order = new OrderInfo();
        order.setMovieName(movieName);
        order.setMoviePrice(moviePrice);
        order.setMovieNumber(movieNumber);
        order.setCreateDate(new java.util.Date());
        order.setMovieId(movieId);
       if(movieNumber<=0||movieNumber>movie.getStoage()){
           request.setAttribute("msg", "quantity must between 1-"+(movie.getStoage()));
           request.setAttribute("orderInfo", order);
           request.setAttribute("movies", movieDao.selectAll(null));
           request.getRequestDispatcher("order/add.jsp").forward(request,response);
            
       }else{
        order.setOrderId(Calendar.getInstance().getTimeInMillis());
        movieOrderDao.addOrder(order);
        movieDao.updateMovieStoage(movieId, movie.getStoage()-movieNumber);
        selectAll(request,response);
       }
    }
    
    public void openAddPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
        List<Movie> movies = movieDao.selectAll(null);
        request.setAttribute("movies", movies);
        request.getRequestDispatcher("/order/add.jsp").forward(request,response);
    }
    
    public void openUpdatePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
         List<Movie> movies = movieDao.selectAll(null);
        request.setAttribute("movies", movies);
        request.setAttribute("orderInfo",movieOrderDao.selectOrderById(request.getParameter("orderId")));
        request.getRequestDispatcher("/order/add.jsp").forward(request,response);
    }
    
    private void update(HttpServletRequest request, HttpServletResponse response) throws SQLException, ParseException, ServletException, IOException {
        String orderId = request.getParameter("orderId");
        OrderInfo order = movieOrderDao.selectOrderById(orderId);
        int movieNumber = Integer.parseInt(request.getParameter("movieNumber"));
        Movie movie = movieDao.selectById(order.getMovieId());
        if(movieNumber<=0||movieNumber>movie.getStoage()+order.getMovieNumber()){
            request.setAttribute("orderInfo", order);
            request.setAttribute("movies", movieDao.selectAll(null));
            request.setAttribute("msg", "quantity must between 1-"+(movie.getStoage()+order.getMovieNumber()));
            request.getRequestDispatcher("order/add.jsp").forward(request,response);
        }else{
              movieOrderDao.updateOrder(orderId, movieNumber);
              movieDao.updateMovieStoage(order.getMovieId(), movie.getStoage()+order.getMovieNumber()-movieNumber);
         }
        selectAll(request,response);
    }

    private void cancel(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String orderId = request.getParameter("orderId");
        OrderInfo order = movieOrderDao.selectOrderById(orderId);
        movieOrderDao.updateOrderStatus(orderId,-1);
        Movie movie = movieDao.selectById(order.getMovieId());
        movieDao.updateMovieStoage(movie.getId(), movie.getStoage()+order.getMovieNumber());
         selectAll(request,response);
    }
    
     private void confirm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String orderId = request.getParameter("orderId");
        movieOrderDao.updateOrderStatus(orderId,2);
         selectAll(request,response);
    }

 private void selectAll(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
         String orderId = request.getParameter("qorderId");
        String startTime = request.getParameter("qstartTime");
        String endTime = request.getParameter("qendTime");
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        List<OrderInfo> list = movieOrderDao.selectOrderList(userId, orderId, startTime, endTime);
        request.setAttribute("orderId", orderId);
        request.setAttribute("startTime", startTime);
        request.setAttribute("endTime", endTime);
        request.setAttribute("list", list);
        request.getRequestDispatcher("/order/list.jsp").forward(request,response);
    }

   

}
