package com.example.UserAuthentocation;

import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import com.example.UserAuthentocation.entity.Example;
import com.example.UserAuthentocation.entity.Problem;
import com.example.UserAuthentocation.repository.mongo.ProblemRepository;

import java.time.LocalDateTime;
import java.util.List;

@Component
public class DataLoader implements CommandLineRunner {

	@Override
	public void run(String... args) throws Exception {
		// TODO Auto-generated method stub
		
	}
//    private final ProblemRepository problemRepo;

	/*
	 * public DataLoader(ProblemRepository problemRepo) { this.problemRepo =
	 * problemRepo; }
	 * 
	 * @Override public void run(String... args) throws Exception {
	 * System.out.println("calling the run method by Spring Boot App :="); Example
	 * ex1 = new Example("2, 3", "5", "2 + 3 = 5"); Example ex2 = new
	 * Example("10, -4", "6", "10 + (-4) = 6");
	 * 
	 * Problem problem = new Problem(); problem.setTitle("Add Two Numbers");
	 * problem.setDescription("Given two integers, return their sum.");
	 * problem.setDifficulty("Easy"); problem.setPopularity(10);
	 * problem.setTags(List.of("math", "arrays")); problem.setExamples(List.of(ex1,
	 * ex2)); problem.setSolved(false); problem.setFavorite(false);
	 * problem.setDateAdded(LocalDateTime.now());
	 * problem.setSupportedLanguages(List.of("java", "python", "cpp"));
	 * System.out.println("before saving the problem Object to the database ");
	 * problemRepo.save(problem); }
	 */
}
