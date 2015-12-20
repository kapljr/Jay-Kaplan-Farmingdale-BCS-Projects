#include <iostream>
#include <string>
#include <iomanip>

using namespace std;

//Defines the strut
struct patientType{
	string firstName;
	string lastName;
	int patientID;
};

int showMainMenu();

////builds an array inside of a struct
void addPatientData(patientType list[], int& length);
void printPatientData(patientType list[], int length);
void bubbleSortLastName(patientType list[], int length);
void bubbleSortID(patientType list[], int length);
void binarySearchLastName(const patientType list[], int length, string searchItem);
void binarySearchID(const patientType list[], int length, int searchItem);

////static count for array
const int maxSize = 10;

int main(){
	int length = 0;
	patientType patient[maxSize];//creates an object that holds the struct in an array
	int menuSelection = 0;
	string searchLastName;
	int searchPatientID;
	menuSelection = showMainMenu();
	while (menuSelection != 7){
		
		switch (menuSelection)
		{
		case 1:
			printPatientData(patient, length);
			menuSelection = 7;
			break;
		case 2:
			addPatientData(patient, length);
			menuSelection = 7;
			break;
		case 3:
			//only bubble sorting the last name. need it to bubble sort whole object
			bubbleSortLastName(patient, length);
			menuSelection = 7;
			break;
		case 4:
			bubbleSortID(patient, length);
			menuSelection = 7;
			break;
		case 5:
			cout << "Enter Last Name to be Searched: ";
			cin >> searchLastName;
			binarySearchLastName(patient, length, searchLastName);
			menuSelection = 7;
			break;
		case 6:
			cout << "Enter Patient ID: ";
			cin >> searchPatientID;
			binarySearchID(patient, length, searchPatientID);
			break;
		case 7:
			cout << "7. Quit the program" << endl;
			break;
		default:
			cout << "Please enter a valid selection";
			break;
		}//ends the switch statement
	cout << "\n******************************" << endl;
	menuSelection = showMainMenu();
	}//ends the while loop
	return 0;
}//This function prints the main menu of the program

void addPatientData(patientType list[], int& length){

	if (length < maxSize){
	cout << "Enter Patients First Name: ";
	cin >> list[length].firstName;
	cout << "Enter Patients Last Name: ";
	cin >> list[length].lastName;
	cout << "Enter Patients ID: ";
	cin >> list[length].patientID;
	length++;
	}
	else
		cout << "Your at the max amount of customers" << endl;
}

void printPatientData(patientType list[], int length){
	int j = 0;
	for (int i = 0; i < length; i++){
		cout << endl;
		cout << "Patient #" << ++j << endl;
		cout << "First Name: " << list[i].firstName << endl;
		cout << "Last Name:" << list[i].lastName << endl;
		cout << "Patients ID: " << list[i].patientID << endl;
	} //end of for loop in the print function
}//end of print function

void bubbleSortLastName(patientType list[], int length){
	string temp;
	int tempNum;
	int iteration;
	int index;
	for (iteration = 1; iteration < length; iteration++){
		for (index = 0; index < length - iteration; index++){
			if (list[index].lastName > list[index + 1].lastName){
				temp = list[index].lastName;
				list[index].lastName = list[index + 1].lastName;
				list[index + 1].lastName = temp;

				temp = list[index].firstName;
				list[index].firstName = list[index + 1].firstName;
				list[index + 1].firstName = temp;

				tempNum = list[index].patientID;
				list[index].patientID = list[index + 1].patientID;
				list[index + 1].patientID = tempNum;
			}//if statement of algorith - borrowed from book on page 1019
		}//inner for loop
	}//outter for loop
}//close of function

void bubbleSortID(patientType list[], int length){
	string temp;
	int tempNum;
	int iteration;
	int index;
	for (iteration = 1; iteration < length; iteration++){
		for (index = 0; index < length - iteration; index++){
			if (list[index].patientID > list[index + 1].patientID){
				tempNum = list[index].patientID;
				list[index].patientID = list[index + 1].patientID;
				list[index + 1].patientID = tempNum;
				
				temp = list[index].lastName;
				list[index].lastName = list[index + 1].lastName;
				list[index + 1].lastName = temp;

				temp = list[index].firstName;
				list[index].firstName = list[index + 1].firstName;
				list[index + 1].firstName = temp;

				
			}//if statement of algorith - borrowed from book on page 1019
		}//inner for loop
	}//outter for loop
}//close of function

void binarySearchLastName(const patientType list[], int length, string searchItem){
	int first = 0;
	int last = length - 1;
	int mid;
	bool found = false;
	while (first <= last && !found)
	{
		mid = (first + last) / 2;
		if (list[mid].lastName == searchItem)
			found = true;
		else if (list[mid].lastName > searchItem)
			last = mid - 1;
		else
			first = mid + 1;
	}
	
	if (found){
		cout << endl;
		cout << "*****************************" << endl;
		cout << "First Name: " << list[mid].firstName << endl;
		cout << "Last Name:" << list[mid].lastName << endl;
		cout << "Patients ID: " << list[mid].patientID << endl;
	}

	else
		cout << "Sorry not found" << endl;
}//end binarySearchLastName - binary search code found on page 1026

void binarySearchID(const patientType list[], int length, int searchItem){
	int first = 0;
	int last = length - 1;
	int mid;
	bool found = false;
	while (first <= last && !found)
	{
		mid = (first + last) / 2;
		if (list[mid].patientID == searchItem)
			found = true;
		else if (list[mid].patientID > searchItem)
			last = mid - 1;
		else
			first = mid + 1;
	}
	
	if (found){
		cout << endl;
		cout << "*****************************" << endl;
		cout << "First Name: " << list[mid].firstName << endl;
		cout << "Last Name:" << list[mid].lastName << endl;
		cout << "Patients ID: " << list[mid].patientID << endl;
	}

	else
		cout << "Sorry not found" << endl;

}//end binarySearchPatientID


int showMainMenu(){
	int menuSelection = 0;
	cout << "Patient Account Menu" << endl;
	cout << "=================" << endl;
	cout << "1. Print Patients" << endl;
	cout << "2. Add a Patient" << endl;
	cout << "3. Sort patients by last name" << endl;
	cout << "4. Sort patients by ID" << endl;
	cout << "5. Search patient by last name" << endl;
	cout << "6. Search patient by ID" << endl;
	cout << "7. Quit the program" << endl;
	cout << "Please make your number selection now: ";
	cin >> menuSelection;
	return menuSelection;
}