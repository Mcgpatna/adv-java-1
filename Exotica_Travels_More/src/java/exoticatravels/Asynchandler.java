/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package exoticatravels;

import java.util.Iterator;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.AsyncContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author rmn
 */
public class Asynchandler implements Runnable{
    AsyncContext ctx;
    HttpServletRequest rq;
    HttpSession session;
    String requestingPageName;
    
    public Asynchandler(AsyncContext aCtx)
    {
        this.ctx = aCtx;
        rq = (HttpServletRequest)ctx.getRequest();
        requestingPageName = rq.getParameter("PageName");
    }
    
    public void run()
    {
        session = rq.getSession(false);
        if(requestingPageName.equals("Destination"))
        {
            String selectedDestination = rq.getParameter("selvar");
            session.setAttribute("selDestination", selectedDestination);
            ctx.dispatch("Hotels.jsp");
        }
        else if(requestingPageName.equals("Hotels"))
        {
            String selectedHotel = ctx.getRequest().getParameter("selvar");
            String noOfDays = ctx.getRequest().getParameter("numOfDays");
            session.setAttribute("selHotel", selectedHotel);
            session.setAttribute("numDays", noOfDays);
            ctx.dispatch("Flights.jsp");
        }
        else if(requestingPageName.equals("FlightsServlet"))
        {
            String selectedAirline = ctx.getRequest().getParameter("selvar");
            session.setAttribute("selAirline",selectedAirline);
            calculatePrice();
            ctx.dispatch("Cart.jsp");
        }
    }
    
    private void calculatePrice()
    {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("ExoticaTravelsPU");
        EntityManager em = emf.createEntityManager();
        EntityTransaction userTransaction = em.getTransaction();
        session = rq.getSession(false);
        //userTransaction.begin();
        
        
        String dest = session.getAttribute("selDestination").toString();
        String destprice = "SELECT baseprice FROM Locations_country WHERE place='" + dest + "'";
        Query query1 = em.createNativeQuery(destprice);
        List result1 = query1.getResultList(); //check
        Iterator it1 = result1.iterator();
        while(it1.hasNext())
        {
            String abc = it1.next().toString();
            System.out.println("it1.next().toString(): "+abc);
            session.setAttribute("destPrice", abc);
        }
        
        String hotel = session.getAttribute("selHotel").toString();
        String hotelprice = "SELECT price FROM Hotels WHERE hotelname='" + hotel + "'";
        Query query2 = em.createNativeQuery(hotelprice);
        List result2 = query2.getResultList(); //check
        Iterator it2 = result2.iterator();
        while(it2.hasNext())
        {
            String abc = it2.next().toString();
            System.out.println("it3.next().toString(): "+abc);
            session.setAttribute("hotelPrice", abc);
        }
        
        String airline = session.getAttribute("selAirline").toString();
        String airlineprice = "SELECT price FROM Airlines WHERE airlinename='" + airline + "'";
        Query query3 = em.createNativeQuery(airlineprice);
        List result3 = query3.getResultList(); //check
        Iterator it3 = result3.iterator();
        while(it3.hasNext())
        {
            String abc = it3.next().toString();
            System.out.println("it3.next().toString(): "+abc);
            session.setAttribute("airlinePrice", abc);
        }
    }
}
