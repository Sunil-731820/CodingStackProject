<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Solved Problem</title>
    <style>
    .problem-card {
        background: #fff;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        margin: 20px auto;
        max-width: 800px;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        padding: 20px;
        transition: transform 0.2s ease, box-shadow 0.2s ease;
    }
    .problem-card:hover {
        transform: translateY(-3px);
        box-shadow: 0 6px 16px rgba(0,0,0,0.15);
    }

    .problem-id {
        font-size: 14px;
        color: #6b7280;
        font-weight: bold;
    }
    .problem-title {
        font-size: 22px;
        font-weight: 600;
        color: #2563eb;
        margin: 10px 0;
    }
    .problem-description {
        font-size: 15px;
        color: #374151;
        line-height: 1.6;
        margin-top: 15px;
    }

    .difficulty-badge {
        padding: 4px 10px;
        border-radius: 12px;
        font-size: 12px;
        font-weight: bold;
        color: #fff;
    }
    .easy { background: #10b981; }
    .medium { background: #f59e0b; }
    .hard { background: #ef4444; }

    .tags {
        margin-top: 10px;
        font-size: 13px;
        color: #6b7280;
    }

    .problem-actions {
        margin-top: 20px;
        display: flex;
        gap: 10px;
    }
    .action-btn {
        padding: 8px 14px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-size: 14px;
        transition: all 0.2s ease;
    }
    .solve-btn { background: #2563eb; color: #fff; }
    .solve-btn:hover { background: #1e40af; }
    .favorite-btn { background: #f3f4f6; color: #f59e0b; border: 1px solid #f59e0b; }
    .favorite-btn:hover { background: #fef3c7; }

        body { font-family: Arial, sans-serif; margin: 20px; background-color: #f5f5f5; color: #333; }
        h2, p { color: #333; }
        #language { margin-bottom: 10px; padding: 5px; border-radius: 4px; }
        .editor-container { border: 2px solid #ccc; border-radius: 8px; background-color: #1e1e1e; box-shadow: 0 4px 12px rgba(0,0,0,0.2); overflow: hidden; }
        .editor-header { background-color: #2d2d2d; color: #fff; padding: 8px 12px; font-weight: bold; border-bottom: 1px solid #444; }
        #editor { height: 420px; }
        .editor-footer { background-color: #2d2d2d; padding: 8px 12px; border-top: 1px solid #444; text-align: right; }
        button { padding: 8px 14px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer; }
        button:hover { background-color: #45a049; }
        #output { background: #fff; color: #333; padding: 10px; border-radius: 6px; margin-top: 12px; border: 1px solid #ccc; white-space: pre-wrap; }
    </style>

    <!-- Monaco Editor via CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/monaco-editor/0.44.0/min/vs/loader.min.js"></script>
    <script>
        require.config({ paths: { 'vs': 'https://cdnjs.cloudflare.com/ajax/libs/monaco-editor/0.44.0/min/vs' }});
        require(['vs/editor/editor.main'], function() {
            window.editor = monaco.editor.create(document.getElementById('editor'), {
                value: "public class Main {\n    public static void main(String[] args) {\n        System.out.println(\"Hello World\");\n    }\n}",
                language: "java",
                theme: "vs-dark",
                automaticLayout: true,
                fontSize: 14
            });

            // Helper to insert import at the top without moving cursor
            function addImport(importLine) {
                const model = window.editor.getModel();
                const currentValue = model.getValue();

                // Skip if already present
                if (currentValue.includes(importLine)) return;

                // Save current cursor position
                const currentSelection = window.editor.getSelection();

                // Insert import at line 1, column 1
                model.pushEditOperations(
                    [],
                    [{
                        range: new monaco.Range(1,1,1,1),
                        text: importLine + "\n"
                    }],
                    () => null
                );

                // Adjust selection down by one line
                const newSelection = new monaco.Selection(
                    currentSelection.startLineNumber + 1,
                    currentSelection.startColumn,
                    currentSelection.endLineNumber + 1,
                    currentSelection.endColumn
                );

                window.editor.setSelection(newSelection);
            }

            // Register command to add imports
            monaco.editor.registerCommand('editor.action.addImport', function(_, importLine) {
                addImport(importLine);
            });

            // Completion provider with auto-import commands
            monaco.languages.registerCompletionItemProvider('java', {
                provideCompletionItems: () => ({
                    suggestions: [
                        {
                            label: 'LocalDateTime',
                            kind: monaco.languages.CompletionItemKind.Class,
                            insertText: 'LocalDateTime',
                            documentation: 'java.time.LocalDateTime',
                            command: { id: 'editor.action.addImport', title: 'Add Import', arguments: ['import java.time.LocalDateTime;'] }
                        },
                        {
                            label: 'DateTimeFormatter',
                            kind: monaco.languages.CompletionItemKind.Class,
                            insertText: 'DateTimeFormatter',
                            documentation: 'java.time.format.DateTimeFormatter',
                            command: { id: 'editor.action.addImport', title: 'Add Import', arguments: ['import java.time.format.DateTimeFormatter;'] }
                        },
                        {
                            label: 'List',
                            kind: monaco.languages.CompletionItemKind.Class,
                            insertText: 'List',
                            documentation: 'java.util.List',
                            command: { id: 'editor.action.addImport', title: 'Add Import', arguments: ['import java.util.List;'] }
                        },
                        {
                            label: 'ArrayList',
                            kind: monaco.languages.CompletionItemKind.Class,
                            insertText: 'ArrayList',
                            documentation: 'java.util.ArrayList',
                            command: { id: 'editor.action.addImport', title: 'Add Import', arguments: ['import java.util.ArrayList;'] }
                        },
                        {
                            label: 'Map',
                            kind: monaco.languages.CompletionItemKind.Class,
                            insertText: 'Map',
                            documentation: 'java.util.Map',
                            command: { id: 'editor.action.addImport', title: 'Add Import', arguments: ['import java.util.Map;'] }
                        },
                        {
                            label: 'HashMap',
                            kind: monaco.languages.CompletionItemKind.Class,
                            insertText: 'HashMap',
                            documentation: 'java.util.HashMap',
                            command: { id: 'editor.action.addImport', title: 'Add Import', arguments: ['import java.util.HashMap;'] }
                        }
                        // Scanner intentionally omitted to avoid blocking input
                    ]
                })
            });
        });

        function changeLanguage() {
            const lang = document.getElementById("language").value;
            let monacoLang;
            switch (lang) {
                case "java": monacoLang = "java"; break;
                case "python": monacoLang = "python"; break;
                case "cpp": monacoLang = "cpp"; break;
                default: monacoLang = "plaintext";
            }
            monaco.editor.setModelLanguage(window.editor.getModel(), monacoLang);
        }
        document.getElementById("language").addEventListener("change", changeLanguage);

        async function runCode() {
            const code = window.editor.getValue();
            const outputEl = document.getElementById("output");
            outputEl.textContent = "Running...";
            try {
                const res = await fetch("<%= request.getContextPath() %>/run", {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify({ "source": code })
                });
                const text = await res.text();
                outputEl.textContent = text;
            } catch (err) {
                outputEl.textContent = "Error calling backend: " + err.message;
            }
        }

        
    </script>
</head>
<body>
<div class="problem-card">
<!--     <div class="problem-id">Problem #${problem.id}</div>
 -->    <div class="problem-title">${problem.title}</div> &nbsp;&nbsp;&nbsp;
    <span class="difficulty-badge ${problem.difficulty.toLowerCase()}">${problem.difficulty}</span>

    <!--  Full description is always visible here -->
    <div class="problem-description">${problem.description}</div>

<%--     <div class="tags">Tags: ${problem.tags}</div>
 --%>
    <%-- <div class="problem-actions">
        <button class="action-btn solve-btn" onclick="window.location.href='/solve/${problem.id}'">
            Solve In Editor
        </button>
        <button class="action-btn favorite-btn" onclick="toggleFavorite(${problem.id})">
            ★ Favorite
        </button>
    </div> --%>
</div>


<%-- <div class="problem-card">
    <div class="problem-id">Problem #${problem.id}</div>
    <div class="problem-title">${problem.title}</div>
    <div class="problem-description">${problem.description}</div>
 --%>
    <%-- <div class="problem-actions">
        <button class="action-btn solve-btn" onclick="window.location.href='/solve/${problem.id}'">
            Solve In Editor
        </button>
        <button class="action-btn favorite-btn" onclick="toggleFavorite(${problem.id})">
            ★ Favorite
        </button>
    </div> --%>
<!-- </div>
 -->
    <select id="language">
        <option value="java">Java</option>
        <option value="python">Python</option>
        <option value="cpp">C++</option>
    </select>

    <div class="editor-container">
        <div class="editor-header">Code Editor</div>
        <div id="editor"></div>
        <div class="editor-footer">
            <button onclick="runCode()">Run Code</button>
        </div>
    </div>

    <pre id="output"></pre>
</body>
</html>
