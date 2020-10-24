package servlets;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Raymond
 */
public class ShoppingListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = (String) request.getParameter("action");
        if (action != null) {
            if (action.equals("logout")) {
                session.invalidate();
                session = request.getSession();
            }
        }
        String username = (String) session.getAttribute("username");
        if (username != null) {
            getServletContext().getRequestDispatcher("/WEB-INF/shoppingList.jsp").forward(request, response);
        } else {
            getServletContext().getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = (String) request.getParameter("action");
        ArrayList<String> list = (ArrayList) session.getAttribute("shoppingList");
        
        if (list == null) {
            list = new ArrayList<>();
        }
        
        if (action.equals("register")) {
            String username = request.getParameter("username");
            session.setAttribute("username", username);
        }
        if (action.equals("add")) {
            String addedItem = request.getParameter("item");
            if (!addedItem.equals("")) {
                list.add(addedItem);
            }
        }
        if (action.equals("delete")) {
            String deletedItem = request.getParameter("items");
            if (!deletedItem.equals("")) {
                list.remove(deletedItem);    
            }
        }
        session.setAttribute("shoppingList", list);
        getServletContext().getRequestDispatcher("/WEB-INF/shoppingList.jsp").forward(request, response);
    }

}
