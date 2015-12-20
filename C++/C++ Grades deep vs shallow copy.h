
#include <iostream>
#include <string>

using namespace std;

// this class is implemented to hold the grades for an exam
class examType
{

private:
	int maxNoOfStudents; // this is the max size of the dynamic list
	int noOfStudents; // this is the current number of elements in the  dynamic array
	double *grades; // grades is a pointer the the dynamic array

public:
	// constructor with parameters
	examType(int maxSize)
	{
		noOfStudents = 0;
		maxNoOfStudents = maxSize;
		grades = new double[maxNoOfStudents];
	}

	~examType()
	{
		delete[] grades;
		grades = NULL;

	}

	//syntax on 879
	examType& operator=(const examType&);
	// overload the assignment operator = to allow deep copy of the grades pointer!
	//...

	int getNoOfStudents()
	{
		return noOfStudents;
	}

	int getMaxNoOfStudents()
	{
		return maxNoOfStudents;
	}

	void append(double newGrade)
	{
		if (noOfStudents < maxNoOfStudents)
		{
			grades[noOfStudents] = newGrade;
			noOfStudents++;
		}
		else
		{
			cout << "Error: This list cannot get more elements. " << endl;
		}
	}

	double getGrade(int thePosition)
	{
		return grades[thePosition];
	}

	void print()
	{
		cout << "Number of Students in the Exam: " << noOfStudents << endl;

		for (int i = 0; i < noOfStudents; i++)
		{
			cout << grades[i] << "\t";
		}
		cout << endl;
	}

};
//noOfStudents ~~   length
//maxNoOfStudents ~~   maxSize
//grades ~~ p
examType& examType::operator=(const examType& examObject){
	//syntax of overloading the assignment operator is on page 879
	if (this != &examObject){
			this->maxNoOfStudents = examObject.maxNoOfStudents;
			noOfStudents = examObject.noOfStudents;
			delete[] this->grades;

			grades = new double[maxNoOfStudents];

			for (int i = 0; i < noOfStudents; i++)
			grades[i] = examObject.grades[i];
		}
	return *this;
}
//use this for the code above.
  // if (this != &rightObj) // to avoid self-assignment
    // {
        // // copy rightObj to this object
        // // …
		// this->maxSize = rightObj.maxSize;
		// length = rightObj.length;

		// delete[] this->p;
		// //deep copy of p
		// p = new int[maxSize];

		// for (int i = 0; i < length; i++)
			// p[i] = rightObj.p[i];

    // }



int main()
{

	examType midterm(10);
	examType copyOfMidterm(4);


	// enter grades for midterm1
	midterm.append(50);
	midterm.append(100);
	midterm.append(80);

	// print results for midterm 1	
	midterm.print();

	copyOfMidterm = midterm; // by default assignment operator = does shallow copy here. 
	// your job is to overload the assignment operator = in the class above, so that deep copying is done!

	copyOfMidterm.print();


	copyOfMidterm.append(55); // add a new grade to copyOf Midterm	

	// *****hint: if you overloaded the = operator correctly and did deep copying you 
	// should see that the copyOfMidterm object prints the additional grade!
	midterm.print();
	copyOfMidterm.print();


	system("pause");
	return 0;
}
