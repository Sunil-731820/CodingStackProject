<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Home | CodePractice</title>

<style>
body {
	margin: 0;
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		Arial;
	background-color: #f7f8fa;
	color: #333;
}

/* ===== TOP NAVBAR ===== */
.navbar {
	background-color: #1c1c1c;
	padding: 14px 30px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	color: white;
}

.navbar h2 {
	margin: 0;
	font-size: 22px;
	color: #ffa116;
}

.navbar a {
	color: #ddd;
	margin-left: 20px;
	text-decoration: none;
	font-size: 14px;
}

.navbar a:hover {
	color: white;
}

/* ===== PAGE LAYOUT ===== */
.page {
	display: flex;
	padding: 25px;
}

/* ===== LEFT SIDEBAR ===== */
.sidebar {
	width: 220px;
	background: white;
	border-radius: 8px;
	padding: 15px;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.08);
	height: fit-content;
}

.sidebar h4 {
	margin-top: 0;
	color: #666;
}

.sidebar a {
	display: block;
	padding: 10px;
	border-radius: 5px;
	color: #333;
	text-decoration: none;
	margin-bottom: 6px;
	font-size: 14px;
}

.sidebar a:hover {
	background-color: #f0f0f0;
}

/* ===== MAIN CONTENT ===== */
.content {
	flex: 1;
	margin-left: 25px;
}

/* ===== STATS ===== */
.stats {
	display: flex;
	gap: 20px;
	margin-bottom: 25px;
}

.stat-card {
	flex: 1;
	background: white;
	border-radius: 8px;
	padding: 18px;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.08);
	text-align: center;
}

.stat-card h2 {
	margin: 0;
	color: #ffa116;
}

.stat-card p {
	margin: 6px 0 0;
	font-size: 14px;
	color: gray;
}

/* ===== PROBLEM TABLE ===== */
.table-container {
	background: white;
	border-radius: 8px;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.08);
	overflow: hidden;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th {
	background-color: #f5f6f8;
	padding: 12px;
	font-size: 13px;
	text-align: left;
	color: #555;
}

td {
	padding: 12px;
	border-top: 1px solid #eee;
	font-size: 14px;
}

tr:hover {
	background-color: #fafafa;
}

.easy {
	color: #2db55d;
}

.medium {
	color: #f0a500;
}

.hard {
	color: #e74c3c;
}

.status-solved {
	color: #2db55d;
}

.status-attempted {
	color: #f0a500;
}

.status-new {
	color: gray;
}

.solve-btn {
	background-color: #007bff;
	color: white;
	padding: 6px 12px;
	border-radius: 5px;
	text-decoration: none;
	font-size: 13px;
}

.solve-btn:hover {
	background-color: #0056b3;
}
</style>
</head>

<body>

	<!-- NAVBAR -->
	<div class="navbar">
		<h2>CodePractice</h2>
		<div>
			<span>${userName}</span> <a href="profile">Profile</a> <a
				href="${pageContext.request.contextPath}/logout">Logout</a>
		</div>
	</div>

	<!-- PAGE -->
	<div class="page">

		<!-- SIDEBAR -->
		<div class="sidebar">
			<h4>Menu</h4>
			<a href="home">🏠 Home</a> <a href="problems">📚 Problems</a> <a
				href="daily">🔥 Daily Challenge</a> <a href="leaderboard">🏆
				Leaderboard</a> <a href="profile">👤 Profile</a>
		</div>

		<!-- CONTENT -->
		<div class="content">

			<!-- STATS -->
			<div class="stats">
				<div class="stat-card">
					<h2>12</h2>
					<p>Solved</p>
				</div>
				<div class="stat-card">
					<h2>20</h2>
					<p>Attempted</p>
				</div>
				<div class="stat-card">
					<h2>60%</h2>
					<p>Acceptance</p>
				</div>
			</div>

			<!-- PROBLEM LIST -->
			<div class="table-container">
				<table>
					<tr>
						<th>Title</th>
						<th>Difficulty</th>
						<th>Status</th>
						<th></th>
					</tr>

					<tr>
						<td>Two Sum</td>
						<td class="easy">Easy</td>
						<td class="status-solved">Solved</td>
						<td><a href="problem/1" class="solve-btn">Solve</a></td>
					</tr>

					<tr>
						<td>Longest Substring Without Repeating Characters</td>
						<td class="medium">Medium</td>
						<td class="status-attempted">Attempted</td>
						<td><a href="problem/2" class="solve-btn">Solve</a></td>
					</tr>

					<tr>
						<td>LRU Cache</td>
						<td class="hard">Hard</td>
						<td class="status-new">Not Tried</td>
						<td><a href="problem/3" class="solve-btn">Solve</a></td>
					</tr>
				</table>
			</div>

		</div>
	</div>

</body>
</html>
