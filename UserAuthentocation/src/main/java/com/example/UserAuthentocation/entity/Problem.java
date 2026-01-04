package com.example.UserAuthentocation.entity;

import java.util.List;

import org.springframework.data.mongodb.core.mapping.Document;

import jakarta.persistence.Id;

@Document(collection = "problems")
public class Problem {

    @Id
    private String id;
    private String title;
    private String difficulty;
    private String description;
    private List<String> tags;
    private List<Example> examples;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDifficulty() {
		return difficulty;
	}
	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public List<String> getTags() {
		return tags;
	}
	public void setTags(List<String> tags) {
		this.tags = tags;
	}
	public List<Example> getExamples() {
		return examples;
	}
	public void setExamples(List<Example> examples) {
		this.examples = examples;
	}

    
    
}
