BCS316 Fall 2015 Project
Written by Jay Kaplan

a) The code can be run from the command line using either of these two methods
   $ perl project.pl or $ perl project.pl input.txt
   
   *NOTE* input.txt can be any txt file, as the project will read in a file on the
   command line or create an input file if none is used on the command line. 

b) Everthing works in the code.
   - The file reads in the file or creates one and then shows the user
     a menu. 
   - The print option prints the first and last name in a formatted way
     and includes a space in between. The output sorts based on the username and all input
     is converted into uppercase letters using regex.
   - The add user option asks for the first and last name of the user, it then auto creates
     a user name using first letter of firt name and first four of last name, if the user name
     exists it adds a one to the end. Again, all input is converted to capital letters.
   - Search option will find the users first name and show all matching in the data file in a nicley
     formatted way. 
   - Delete option takes the first name and deletes all the matching records.
   - Every time a user enters data, the program doesnt' care about case and changes it to upper case.

c) Everything worked great for me.

d) I met the project spec based on the document posted in blackboard.
   Tried to comment the code well. All functions are 