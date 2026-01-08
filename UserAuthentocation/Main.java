import java.util.HashMap;
import java.util.Map;
public class Main {
    public static void main(String[] args) {
        System.out.println("Hello World");
        System.out.println("This is the Example of the One Of The Best Code Editor used for Java ");
        // For loop to print numbers from 1 to 10
        int sum = 0;
        for (int i = 1; i <= 10; i++) {
            System.out.println("Number: " + i);
            sum += i; // add each number to sum
        }

        // Print the final sum
        System.out.println("Sum of numbers from 1 to 10 is: " + sum);

        System.out.println("I am calling the Multiplication table CLass below one okay:=");

        MultiplicationTable mult = new MultiplicationTable();
        mult.multiply();

        System.out.println("Another new Code is Added ++++++++++++++++++++");
        int[] nums = {2, 7, 11, 15};
        int target = 9;

        TwoSum twoSum1 = new TwoSum();

        int[] result = twoSum1.twoSum(nums, target);

        System.out.println("Indices: " + result[0] + ", " + result[1]);


    }
}

class MultiplicationTable {
    public static void multiply() {
        int number = 5; // you can change this to any number

        System.out.println("Multiplication Table of " + number);

        // For loop to generate table from 1 to 10
        for (int i = 1; i <= 10; i++) {
            int result = number * i;
            System.out.println(number + " x " + i + " = " + result);
        }
    }
}

class TwoSum {
    public static int[] twoSum(int[] nums, int target) {
        // Map to store number and its index
        Map<Integer, Integer> map = new HashMap<>();

        for (int i = 0; i < nums.length; i++) {
            int complement = target - nums[i];

            // Check if complement exists in map
            if (map.containsKey(complement)) {
                return new int[] { map.get(complement), i };
            }

            // Store current number with its index
            map.put(nums[i], i);
        }

        // If no solution found
        throw new IllegalArgumentException("No two sum solution");
    }
}
