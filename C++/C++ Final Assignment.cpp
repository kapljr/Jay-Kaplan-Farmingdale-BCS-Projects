/*Write a C++ program to do the following : The main program reads in three integers,
representing the degree measurement of three angles of a triangle and sends them to a function.
If the function says that the three integers form a valid triangle, the main program calls
another function to classify the triangle.After repeating this process for the entire set of
data, the main program prints out how many groups formed valid triangles and how many formed
invalid ones.
The first function, which checks for validity, uses the following rule : The three angles form
a valid triangle if they add up to 180 and each one is greater than 0. For example 70, 60 and 50
is valid while 120, 80, and - 20 is invalid.
The classification function calls two additional functions.One of them determines if the
triangle is equiangular(all three angles are equal), isosceles(exactly two angles are equal),
or scalene(all three angles different).The other function determines if the triangle is right
has one angle with 90 degrees), obtuse(one angle above 90), or acute(all three below 90).

Be sure to cover all the possible combinations and to include some invalid triangles as well.
Make sure your name appears on the printout.
You should create a well formatted report indicating whether or not the set of angles is valid
or not.If they are valid then classify the triangles as to whether it is equiangular, isosceles
or scalene, and whether it has an obtuse angle, right angle or is acute.
Read the data from an input file.To make it easier for you, declare the input and output files globally.

Hints:

Three choices to write to a file :
1.      Declare the files globally
ofstream outFile;

2.      In main, pass the file name as a reference
variable

void classify(ofstream&, int, int, int);

classify(outfile, angle1, angle2, angle3);

3.      Use reference variables and send all the answers
back to main and print everything from main.

Below is a sample printout :

Angle 1    Angle 2    Angle3      Status        Type            Kind
70            70            40        Valid        isosceles      acute
20            60           100       Valid        scalene       obtuse

2 valid triangles
0 invalid triangles
*/

//Due 12/15/2014
//Programming Assignment 8
//Written by Jay Kaplan

#include <iostream>
#include <fstream>
#include <iomanip>
#include <string>

using namespace std;

//ofstream - ifstream: these initialize all the information below, these two lines are needed up top
ofstream outfile;
ifstream infile;

void validTriangle(int, int, int, int&); //Function A - is function a valid triangle
void classifyTriangle (int, int, int, string&, string&); // we will return type and kind
void triangleTypes(int, int, int, string&); //this will return the type of triangle
void triangleKinds(int, int, int, string&); //this will return 

int main()
{
	int angle1, angle2, angle3, validCount=0, invalidCount=0;
	int triangleStatus, valid, invalid;
	string typeOfTriangle, statusOfTriangle, type, kind;
	
	//Below two lines are needed to create the output file
	//and also use the input file which creates the data for the input file.
	outfile.open("outPutFile.txt");
	infile.open("inputData.txt");

	//Can't Open File Code
	if (!infile)
	{
		cout << "This program can't open your file. " << endl << "Please Try Again" << endl;
		return 1;
	}

	//this is info from the input file that goes into the variables, each line of the document
	//goes to a the infile variable below
	
	//This will print the headers for the file
	outfile << "Angle 1" << setw(10) << "Angle 2" << setw(10) << "Angle 3" << setw(11) << "Status" << setw(13) << "Type" << setw(12) << "Kind" << endl;
	outfile << "=================================================================\n";

	while (!infile.eof())
	{
		infile >> angle1;
		infile >> angle2;
		infile >> angle3;
		validTriangle(angle1, angle2, angle3, triangleStatus);
	
		if (triangleStatus == 1)
		{
			statusOfTriangle = "Valid";
			validCount++;
			classifyTriangle(angle1, angle2, angle3, type, kind);			
		}
		
		else
		{
			statusOfTriangle = "inValid";
			invalidCount++;
			type.clear();
			kind.clear();

		}
		
		//Data that gets sent to the outfile for Formatting
		
		outfile << setw(4) << angle1 << setw(11) << angle2 << setw(9) << angle3 << setw(15) << statusOfTriangle << setw(15) << type << setw(10) << kind << endl;
	}
	outfile << endl;
	outfile << validCount << " Valid Triangles" << endl;
	outfile << invalidCount << " Inalid Triangles" << endl;
	outfile << "\nWritten by Jay Kaplan\n" << endl;

	//Important for Closing the file
	outfile.close();
	infile.close();

	return 0;
}

void validTriangle(int angNum1, int angNum2, int angNum3, int& validTriangle) //Function A - is function a valid triangle
{
	if (((angNum1 + angNum2 + angNum3) == 180) & (angNum1 > 0) & (angNum2 > 0) & (angNum3 > 0))
		validTriangle = 1;//Valid Triangle
	else
		validTriangle = 0; //inValid Triangle
}

// Function B - calls 2 other functions to find type and kind of triangle
// copying 3 angles: angle1, angle2
// needing answers for type and kind of triangle
// use an if statement to figure out the values getting returned


void classifyTriangle(int side1, int side2, int side3, string& triangleType, string& triangleKind) // Function B - calls 2 other functions to find type and kind of triangle

{
	triangleTypes(side1, side2, side3, triangleType);
	triangleKinds(side1, side2, side3, triangleKind);
}

void triangleTypes(int type1, int type2, int type3, string& returnType) // Function C - figures out what type of triangle and passes a string reference back to the classify - function B
{
	if ((type1 != type2) & (type2 != type3))
		returnType = "scalene";
	else if ((type1 == type2) & (type2 == type3))
		returnType = "equilateral";
	else
		returnType = "isosceles";
}

void triangleKinds(int type1, int type2, int type3, string& returnKind) // Function D - figures out what kind of triangle and passes a reference string back to classify - Function B
{
	if ((type1 == 90) || (type2 == 90) || (type3 == 90))
		returnKind = "right";
	else if ((type1 > 90) || (type2 > 90) || (type3 > 90))
		returnKind = "obtuse";
	else
		returnKind = "acute";
}