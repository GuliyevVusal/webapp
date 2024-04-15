package com.influencer.educationsystemwebapp.servlet;
import com.influencer.educationsystemwebapp.student.entity.Student;
import com.influencer.educationsystemwebapp.student.repo.StudentRepo;
import com.influencer.educationsystemwebapp.util.ParamUtil;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "loginServlet", value = "/login")
public class LoginServlet extends HttpServlet {

    private final StudentRepo repo = new StudentRepo();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        final Object loggedInUser = request.getSession().getAttribute("loggedInUser");
        if (loggedInUser!=null){
            response.sendRedirect("home");
            return;
        }
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = ParamUtil.get(request.getParameter("email"));
        String password = ParamUtil.get(request.getParameter("password"));

        final List<Student> list = repo.getList(null, null, email, null, null, password);
        if (!list.isEmpty()) {
            final Student student = list.get(0);
            request.getSession().setAttribute("loggedInUser", student);
        }
        response.sendRedirect("home");
    }
}