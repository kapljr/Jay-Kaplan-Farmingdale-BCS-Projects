/*Due: 11 / 21 / 14

	This program should be set up using nested loops.Read in a student id or - 9999 to control the outer loop.The second loop should read in 4 exam grades and calculate their average.Print out the student's id followed by their grades and their average grade.

	When you come out of the loops print the number of students that have been processed.
*/

// Extra Credit Lab - Nested Loops
// Due 11/21/14
// Written by Jay Kaplan

#include <iostream>

using namespace std;

int main()
{
	int studentId, totalStudents = 0, grade, grade1, grade2, grade3, grade4;
	
	cout << "Please Enter the Students ID or -9999 to Quit: ";
	cin >> studentId;

	while (studentId != -9999)
	{
		cout << "\nPlease Enter the Students 4 Grades\n";
		
		int i = 1;
		double average = 0, gradeTotal = 0;

		while (i <= 4)
		{
			cout << "Enter Grade " << i << ":";
			cin >> grade;
			gradeTotal = gradeTotal + grade;
			average = gradeTotal / 4;
			
			if (i == 1)
			grade1 = grade;
			else if (i == 2)
			grade2 = grade;
			else if (i == 3)
			grade3 = grade;
			else
			grade4 = grade; 
			i++;
		}
		cout << endl;
		cout << "==============================\n";
		cout << "Student ID: " << studentId << endl;
		cout << "Student Grades: " << endl;
		cout << "Grade 1: " << grade1 << endl;
		cout << "Grade 2: " << grade2 << endl;
		cout << "Grade 3: " << grade3 <<endl;
		cout << "Grade 4: " << grade4 << endl;
		cout << "Average of the 4 Grades: " << average;
		cout << "\n==============================\n" << endl;
		cout << "Please Enter the Next Students ID or -9999 to Quit: ";
		totalStudents++;
		cin >> studentId;
	}

	cout << "\nYou have processed a total of " << totalStudents << " students.\n";

	return 0;
}
