<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Solved Problem</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
            color: #333;
        }
        h2, p {
            color: #333;
        }
        #language {
            margin-bottom: 10px;
            padding: 5px;
            border-radius: 4px;
        }

        /* Editor container styled like LeetCode */
        .editor-container {
            border: 2px solid #ccc;
            border-radius: 8px;
            background-color: #1e1e1e; /* dark background for editor */
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
            overflow: hidden;
        }
        .editor-header {
            background-color: #2d2d2d;
            color: #fff;
            padding: 8px 12px;
            font-weight: bold;
            border-bottom: 1px solid #444;
        }
        #editor {
            height: 420px;
        }
        .editor-footer {
            background-color: #2d2d2d;
            padding: 8px 12px;
            border-top: 1px solid #444;
            text-align: right;
        }
        button {
            padding: 8px 14px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover { background-color: #45a049; }
        #output {
            background: #fff;
            color: #333;
            padding: 10px;
            border-radius: 6px;
            margin-top: 12px;
            border: 1px solid #ccc;
            white-space: pre-wrap;
        }
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

            // === Java Completion Provider with common imports and usage snippets ===
            monaco.languages.registerCompletionItemProvider('java', {
                provideCompletionItems: () => ({
                    suggestions: [
                        // Common imports
                        { label: 'import java.util.*', kind: monaco.languages.CompletionItemKind.Snippet, insertText: 'import java.util.*;', documentation: 'Import all java.util classes' },
                        { label: 'import java.io.*', kind: monaco.languages.CompletionItemKind.Snippet, insertText: 'import java.io.*;', documentation: 'Import all java.io classes' },
                        { label: 'import java.time.*', kind: monaco.languages.CompletionItemKind.Snippet, insertText: 'import java.time.*;', documentation: 'Import all java.time classes' },
                        { label: 'import java.sql.*', kind: monaco.languages.CompletionItemKind.Snippet, insertText: 'import java.sql.*;', documentation: 'Import all java.sql classes' },
                        { label: 'import javax.*', kind: monaco.languages.CompletionItemKind.Snippet, insertText: 'import javax.*;', documentation: 'Import all javax classes' },

                        // Usage snippets (escaped placeholders!)
                        {
                            label: 'LocalDateTime usage',
                            kind: monaco.languages.CompletionItemKind.Snippet,
                            insertText: [
                                'import java.time.LocalDateTime;',
                                '',
                                'LocalDateTime \\${1:now} = LocalDateTime.now();'
                            ].join('\n'),
                            insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
                            documentation: 'Import and use LocalDateTime'
                        },
                        {
                            label: 'DateTimeFormatter usage',
                            kind: monaco.languages.CompletionItemKind.Snippet,
                            insertText: [
                                'import java.time.format.DateTimeFormatter;',
                                '',
                                'DateTimeFormatter \\${1:formatter} = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");'
                            ].join('\n'),
                            insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
                            documentation: 'Import and use DateTimeFormatter'
                        },
                        {
                            label: 'List usage',
                            kind: monaco.languages.CompletionItemKind.Snippet,
                            insertText: [
                                'import java.util.List;',
                                'import java.util.ArrayList;',
                                '',
                                'List<String> \\${1:list} = new ArrayList<>();',
                                '\\${1:list}.add("item");'
                            ].join('\n'),
                            insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
                            documentation: 'Import and use List/ArrayList'
                        },
                        {
                            label: 'Map usage',
                            kind: monaco.languages.CompletionItemKind.Snippet,
                            insertText: [
                                'import java.util.Map;',
                                'import java.util.HashMap;',
                                '',
                                'Map<String, Integer> \\${1:map} = new HashMap<>();',
                                '\\${1:map}.put("key", 1);'
                            ].join('\n'),
                            insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
                            documentation: 'Import and use Map/HashMap'
                        },
                        {
                            label: 'Scanner usage',
                            kind: monaco.languages.CompletionItemKind.Snippet,
                            insertText: [
                                'import java.util.Scanner;',
                                '',
                                'Scanner \\${1:sc} = new Scanner(System.in);',
                                'String input = \\${1:sc}.nextLine();'
                            ].join('\n'),
                            insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
                            documentation: 'Import and use Scanner'
                        }
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
    <h2>${problem.title}</h2>
    <p>${problem.description}</p>

    <select id="language">
        <option value="java">Java</option>
        <option value="python">Python</option>
        <option value="cpp">C++</option>
    </select>

    <!-- Editor container with border like LeetCode -->
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
