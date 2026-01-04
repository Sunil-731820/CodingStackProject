<%@page import="com.example.UserAuthentocation.entity.Problem"%>
<%@ page import="java.util.List"%>

<%
List<Problem> problems = (List<Problem>) request.getAttribute("problems");
out.println("The Size of the problems is :="+problems.size());
%>

<h2>DSA Problems</h2>

<%
if (problems != null && !problems.isEmpty()) {
	out.println("Inside the If COnditions :=");
%>
<%
for (Problem p : problems) {
%>
<div style="border: 1px solid #ccc; padding: 10px; margin: 10px;">
	<h3><%=p.getTitle() %></h3>
	<p>
		<b>Difficulty:</b>
		<%=p.getDifficulty()%></p>
	<p><%=p.getDescription()%></p>
</div>
<%
}
%>
<%
} else {
%>
<p>No problems found.</p>
<%
}
%>
