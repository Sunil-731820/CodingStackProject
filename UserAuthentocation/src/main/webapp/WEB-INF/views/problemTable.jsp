<%@page import="com.example.UserAuthentocation.entity.Problem"%>
<%@page import="java.util.List"%>
<%
    List<Problem> problems = (List<Problem>) request.getAttribute("problems");
%>

<table id="problemTable">
	<tr>
		<th>Title</th>
		<th>Difficulty</th>
		<th>Tags</th>
		<th>Actions</th>
	</tr>

	<%
if (problems != null) {
    for (Problem p : problems) {
%>

	<tr data-title="<%=p.getTitle().toLowerCase()%>"
		data-difficulty="<%=p.getDifficulty()%>"
		data-tags="<%=p.getTags() != null ? String.join(",", p.getTags()).toLowerCase() : "" %>">

		<td
			onclick="openModal('<%=p.getTitle()%>', '<%=p.getDescription()%>')"
			style="cursor: pointer; color: blue;"><%=p.getTitle()%></td>

		<td class="<%=p.getDifficulty().toLowerCase()%>"><%=p.getDifficulty()%>
		</td>

		<td><%= p.getTags() != null ? String.join(", ", p.getTags()) : "" %>
		</td> 

		<td>
		<a href="/solve/<%=p.getId()%>">Solve In Editor</a>
<br><br>
		
			<%-- <button onclick="markSolved('<%=p.getId()%>')"
				style="background:<%=p.isSolved()?"green":"#ccc"%>;color:white">
				✔ Solve</button>

			<button onclick="toggleFavorite('<%=p.getId()%>')"
				style="color:<%=p.isFavorite()?"gold":"black"%>">★ Favorite
			</button>
 --%>			
		</td>
		
		<td>
   
</td>
<!-- <td>
<a href="/NavigateToSolveproblem">Solve In Editor</a><br><br>
</td>
 -->	</tr>

	<%
    }
}
%>

</table>