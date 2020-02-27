/**
 * CaseStatement.java is a driver for letterGrade.
 *
 * Author: David Reidsma
 * Date:   02/25/2020
 */
import java.util.Scanner;

public class CaseStatement {
    
    /**
     * Main function of a program that allows the user to enter a numerical grade from 0-100 and then prints out the equivalent letter grade.
     */
    public static void main(String[] args) {
        System.out.print("Enter your grade: ");

        Scanner scanner = new Scanner(System.in);
        int grade = Integer.parseInt(scanner.next());

        CaseStatement cs = new CaseStatement();
        System.out.println(cs.letterGrade(grade));
    }

    /**
     * letterGrade converts a numerical grade into its letter code.
     * @param average A numerical grade in range 0-100.
     * @return A letter grade.
     */
    char letterGrade(int average) {
        switch (average / 10) {
            case 10:
            case 9:
                return 'A';
            case 8:
                return 'B';
            case 7:
                return 'C';
            case 6:
                return 'D';
            default:
                return 'F';
        }
    }
}
