<%@ page session="true" %>
<%
  session.invalidate();
  response.sendRedirect("homepage.jsp");
%>
