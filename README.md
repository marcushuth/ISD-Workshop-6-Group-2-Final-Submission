# ISD-Demo-MVC
Read the Lab 9 instructions on UTSOnline
Create a JDBC database instance named: studentsdb
Update DB super-class URL field
Complete DBManager CRUD operations:
    • step 1: complete 'addStudent(...)' in DBManager
    • step 2: test addStudent using TestDB application
    • step 3: test addStudent in the view welcome.jsp
    • step 4: complete 'findStudent(...)' in DBManager
    • step 5: test findStudent in view loginAction.jsp
    • step 6: complete 'updateStudent(...)' in DBManager
    • step 7: test updateStudent in view edit_user.jsp
    • step 8: complete 'deleteStudent(...)' in DBManager
    • step 9: update edit_user.jsp to include delete account 
    • step10: test deleteStudent in edit_user.jsp

#NOTE: 
It is important the understand the role of connection pool servlet 
ConnServlet. ConnServlet creates a connection instance for DBManager to use.
Then dbmanager instance is saved to the session for the view objects to use.
Once the application is terminated the destroy() method in the servlet runs
and terminate the database connection. 
#In MVC architecture, apply the following rules:
    • model.dao handles database connection and CRUD operations
    • controller handle the traffic of data/events between model and view
    • view uses the model.dao CRUD operations to get and display data
