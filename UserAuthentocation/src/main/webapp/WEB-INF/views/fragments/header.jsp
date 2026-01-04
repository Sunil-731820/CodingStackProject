<%@ page import="java.util.*, com.example.UserAuthentocation.entity.Problem" %>
<!DOCTYPE html>
<html>
<head>
    <title>DSA Problems</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }

        th {
            background: #f2f2f2;
        }

        .easy { color: green; font-weight: bold; }
        .medium { color: orange; font-weight: bold; }
        .hard { color: red; font-weight: bold; }

        button {
            padding: 5px 10px;
            cursor: pointer;
        }
        
        .action-buttons {
    display: flex;
    gap: 10px;
}

.action-btn {
    border: none;
    padding: 6px 10px;
    border-radius: 6px;
    font-size: 14px;
    cursor: pointer;
    display: flex;
    align-items: center;
    gap: 6px;
    transition: 0.2s ease-in-out;
}

.solve-btn {
    background-color: #e8f5e9;
    color: #2e7d32;
}

.solve-btn:hover {
    background-color: #c8e6c9;
}

.fav-btn {
    background-color: #fff3e0;
    color: #ef6c00;
}

.fav-btn:hover {
    background-color: #ffe0b2;
}
 
.action-btn span {
    font-size: 16px;
}
        
    </style>
    <script>
    let solved = <%= request.getAttribute("solvedCount") %>;
    let total  = <%= request.getAttribute("totalProblems") %>;
    </script>
</head>
<body>

<h2>Welcome to Code Bloom, DSA Problems Skills </h2>
<div style="margin:15px 0;">
    <b>Progress:</b>
    <div style="background:#eee;width:100%;height:20px;border-radius:10px;">
        <div id="progressBar"
             style="height:20px;border-radius:10px;background:#4caf50;width:0%;">
        </div>
    </div>
    <small id="progressText"></small>
</div>

