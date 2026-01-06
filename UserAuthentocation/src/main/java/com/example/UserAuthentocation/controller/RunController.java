package com.example.UserAuthentocation.controller;
import org.springframework.web.bind.annotation.*;
import javax.tools.*;
import java.io.*;
import java.util.*;

@RestController
public class RunController {

    @PostMapping("/run")
    public String runCode(@RequestBody Map<String, String> payload) {
    	
    	System.out.println("Calling the run Code Methods");
        String source = payload.get("source");

        try {
            String className = "Main";
            File sourceFile = new File(className + ".java");
            try (FileWriter writer = new FileWriter(sourceFile)) {
                writer.write(source);
            }

            // Compile
            JavaCompiler compiler = ToolProvider.getSystemJavaCompiler();
            int result = compiler.run(null, null, null, sourceFile.getPath());
            if (result != 0) {
                return "Compilation failed!";
            }

            // Run
            Process process = Runtime.getRuntime().exec("java " + className);
            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
            StringBuilder output = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                output.append(line).append("\n");
            }
            System.out.println("The output after running the code is :="+output.toString());
            return output.toString();

        } catch (Exception e) {
            return "Error: " + e.getMessage();
        }
    }
}
