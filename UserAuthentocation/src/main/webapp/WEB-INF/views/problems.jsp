<%@page import="com.example.UserAuthentocation.entity.Problem"%>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
<head>
    <title>DSA Problems</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .difficulty-badge {
            font-weight: bold;
            padding: 5px 10px;
            border-radius: 12px;
            color: white;
        }
        .Easy { background-color: #28a745; }   /* Green */
        .Medium { background-color: #ffc107; } /* Yellow */
        .Hard { background-color: #dc3545; }   /* Red */
        .table-hover tbody tr:hover { background-color: #f1f1f1; cursor: pointer; }
        .pagination a { margin: 0 5px; text-decoration: none; }
        .sort-arrow { font-size: 12px; margin-left: 5px; }
    </style>
</head>
<body class="container my-4">
<h2 class="mb-4">DSA Problems</h2>

<%
    // Fetch model attributes
    List<Problem> problems = (List<Problem>) request.getAttribute("problems");
    Integer currentPage = (Integer) request.getAttribute("currentPage");
    Integer totalPages = (Integer) request.getAttribute("totalPages");
    String sortField = (String) request.getAttribute("sortField");
    String sortDir = (String) request.getAttribute("sortDir");
    String difficulty = (String) request.getAttribute("difficulty");
    if (currentPage == null) currentPage = 0;
    if (totalPages == null) totalPages = 1;
    if (sortField == null) sortField = "dateAdded";
    if (sortDir == null) sortDir = "desc";
    if (difficulty == null) difficulty = "";
%>

<!-- Filter & Sort Form -->
<form method="get" action="/problems" class="row g-3 align-items-center mb-4">
    <div class="col-auto">
        <label>Difficulty:</label>
        <select name="difficulty" class="form-select">
            <option value="" <%= "".equals(difficulty) ? "selected" : "" %>>All</option>
            <option value="Easy" <%= "Easy".equals(difficulty) ? "selected" : "" %>>Easy</option>
            <option value="Medium" <%= "Medium".equals(difficulty) ? "selected" : "" %>>Medium</option>
            <option value="Hard" <%= "Hard".equals(difficulty) ? "selected" : "" %>>Hard</option>
        </select>
    </div>
    <div class="col-auto">
        <label>Sort By:</label>
        <select name="sortField" class="form-select">
            <option value="dateAdded" <%= "dateAdded".equals(sortField) ? "selected" : "" %>>Date Added</option>
            <option value="popularity" <%= "popularity".equals(sortField) ? "selected" : "" %>>Popularity</option>
        </select>
    </div>
    <div class="col-auto">
        <label>Order:</label>
        <select name="sortDir" class="form-select">
            <option value="asc" <%= "asc".equals(sortDir) ? "selected" : "" %>>Ascending</option>
            <option value="desc" <%= "desc".equals(sortDir) ? "selected" : "" %>>Descending</option>
        </select>
    </div>
    <div class="col-auto mt-4">
        <button type="submit" class="btn btn-primary">Apply</button>
    </div>
</form>

<!-- Problems Table -->
<table class="table table-bordered table-hover">
    <thead class="table-dark">
        <tr>
            <th>Title</th>
            <th>Description</th>
            <th>Difficulty</th>
            <th>Popularity <span class="sort-arrow"><%= "popularity".equals(sortField) ? ("asc".equals(sortDir) ? "↑" : "↓") : "" %></span></th>
            <th>Date Added <span class="sort-arrow"><%= "dateAdded".equals(sortField) ? ("asc".equals(sortDir) ? "↑" : "↓") : "" %></span></th>
        </tr>
    </thead>
    <tbody>
    <%
        if (problems != null && !problems.isEmpty()) {
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            for (Problem p : problems) {
    %>
        <tr onclick="alert('Problem: <%= p.getTitle() %>')">
            <td><%= p.getTitle() %></td>
            <td><%= p.getDescription() %></td>
            <td>
                <span class="difficulty-badge <%= p.getDifficulty() %>"><%= p.getDifficulty() %></span>
            </td>
            <%-- <td><%= p.getPopularity() %></td>
            <td><%= p.getDateAdded() != null ? sdf.format(p.getDateAdded()) : "" %></td> --%>
        </tr>
    <%
            }
        } else {
    %>
        <tr><td colspan="5" class="text-center">No problems found</td></tr>
    <%
        }
    %>
    </tbody>
</table>

<!-- Pagination -->
<nav aria-label="Page navigation">
    <ul class="pagination">
    <%
        for (int i = 0; i < totalPages; i++) {
            String activeClass = (currentPage == i) ? "active" : "";
    %>
        <li class="page-item <%= activeClass %>">
            <a class="page-link" href="?page=<%= i %>&difficulty=<%= difficulty %>&sortField=<%= sortField %>&sortDir=<%= sortDir %>"><%= i + 1 %></a>
        </li>
    <%
        }
    %>
    </ul>
</nav>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
