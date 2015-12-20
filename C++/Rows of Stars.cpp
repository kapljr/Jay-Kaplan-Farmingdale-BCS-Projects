/*Due: 11/30/13

Write a an application that prints the following patterns separately one below the other. Use for loops to generate the patterns. All asterisks (*) should be printed by a single statement of the form cout << '*' ; (this causes the asterisks to print side by side). Hint: The last two patterns require that each line begin with an appropriate number of blanks.

You will receive 3 points for each pattern that you print out. You can get an extra 3 points if you can get the patterns to print accross as shown below.

(A)                                            (B)                           (C)                                          (D)
*                                             **********                     **********                                      *
**                                           *********                         *********                                    **
***                                         ********                             ********                                  ***
****                                       *******                                 *******                                ****
*****                                     ******                                     ******                              *****
******                                   *****                                         *****                            ******
*******                                 ****                                             ****                          *******
********                               ***                                                 ***                        ********
*********                             **                                                     **                      *********
**********                           *                                                         *                    **********
Instructions: Enter or paste your written work and/or click "Attachments" to upload your files.*/

#include <iostream>
using namespace std;

void printAsterik(int, int); //function prototype for printing rows of stars

int main()
{
	int starRows; //declares variable for rows
	starRows = 10; // this changes how the program looks

	for (int i = 1; i < starRows; i++) // for loop for first triangle
	{
		printAsterik(i,0);
		cout << endl;
	}
	cout << endl;
	
	for (int i = starRows; i > 0; i--) // 2nd for loop
	{
		printAsterik(i, 0);
		cout << endl;
	}
	cout << endl;

	for (int i = starRows; i > 0; i--) //third for loop
	{
		printAsterik(i, starRows - i);
		cout << endl;
	}
	cout << endl;
	
	for (int i = 1; i < starRows; i++) // 4th for loop
	{
		printAsterik(i, starRows - i);
		cout << endl;
	}
	
	return 0;
}

void printAsterik(int row, int space) // function that prints space and stars
{
	for (int i = 0; i < space; i++)
	{
		cout << " ";
	}

	for (int j = 0; j < row; j++)
	{
		cout << "*";
	}
	
}
