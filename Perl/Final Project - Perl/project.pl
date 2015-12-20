#!/usr/bin/perl
# BCS316 Fall 2015 Project
# Written by Jay Kaplan

if (defined($ARGV[0])){
      $filename = $ARGV[0];
      &convertFile($filename);#calls convert file and converts inital file to upper case
      &processMenu($filename);#calls process menu
   } else {
      $filename = 'input.txt';
      &createFile($filename);#creates a file if no file is specified
      &processMenu($filename);#then processes menu
   } # end of project opening

#create a starting input.txt file;
sub createFile{
    open(my $FILE, '>', $filename) or die "Could not open file '$filename' $!"; #98 from book, $! is the error message
    close $FILE;
}# end of create file sub
 
#This function processes the menu calls based on the users choice. It calls the menu, captures the user choice and returns it
# back to the menuCall variable, which then uses RegEx to match the value. Once the value us matched, it then runs that
# function. This function uses an outter while loop to keep running, while the inner loop is an if/elsif/else nested statement.
# If an invalid choice is made, the function runs the menu again, prompting the user that their selection was invalid.
sub processMenu{
     
     while( $menuCall = true ) {
	my $menuCall = &menu();#calls menu to return users choice
	if ($menuCall =~ /^p|^P/){
	     &printUsers($filename);#processes print function
	#elsif clause from book pg 173.
	} elsif ($menuCall =~ /^a|^A/){
	     &newUser($filename);#processes create new user function
	} elsif($menuCall =~ /^s|^S/){
	     &searchUser($filename);#processes search function
	} elsif($menuCall =~ /^d|^D/){
	     &deleteUser($filename);#processes delete function
	} elsif($menuCall =~ /^x|^X/){
	     exit; #processes exit function
	} else {
	     print "Your Menu Choice was not valid. Try again.\n";
	     #$menuCall = &menu(); #processes invalid choices
	     $menuCall = true;
	}
     }# end of while loop
}# end processMenu

# This is the menu function that processes the users choice based on the menu and then returns the variable back to the calling
# function to process the choice for the next function to run. Any invalid choices are still held in the menuChoice variable and
# returned to the processMenu function in order to tell the user that their choice is invalid and choose again, calling menu back.
sub menu{ 
     print "\nMenu\n\n";
     print "===========================\n\n"; 
     print "(p, P) Print users info\n"; # sub call is printUsers
     print "(a, A) Add new user\n"; # sub call is newUser
     print "(s, S) Search user\n"; # sub call is searchUser
     print "(d, D) Delete user\n"; # sub call is deleteUser
     print "(x,X) Exit\n\n";
     print "Enter your choice:";
     my $menuChoice = <STDIN>;
     return $menuChoice;
} # end of menu

#This function captures the users first and last name in the default variable. It then uses regex to convert the first and last name
# into upper case strings. Once this has been completed, the function now creates a user name through a series of regex functions.
# The string is now split into an array where first name is in the 1st element and last name is in the 2nd element.
# The split array copies it self into another array to hold the information, while the original array becomes the user name.
# The 1st element goes into a default variable for processing. The regex takes over and catures the 1st character of the first name.
# The 2nd element does the same thing but this time it captures first 4 characters for the last part of the name.
# The user name is then concatenated back together and set to the userName variable. The data file is then opened and the username is checked
# against the file, if its found, it adds a 1 to the end. It then closes the file and reopens it to append the data at the end of the file.
# It also prints out the information to the screen as requested in the spec docs.
sub newUser{
   print "Enter new user with FIRST and LAST name: ";
   chomp($_ = <STDIN>);
   #This code is used through out the program in order to validate any undefined data.
   if ($_ eq undef){
       print "You did not enter a first name\n";
       print "Error!\n";
       return;
   }
   #RegEx - UpperCase Explaination - this code repeats in the program#
   # ($_) - this captures the STDIN in the default variable in the search pattern, in the replace part
   # the $1 variable places this before the \U which is to upper case the variable. This makes the replacement all 
   # upper case as it comes before the $1 variable. The i is a case insensitive match modifier. 
   s/($_)/\U$1/i;
   #####block creates the username#####
   my @createUser = split ( /\s+/, $_ );#now i have first and last name in name array
   my @userArray = @createUser; #sets create user into a unique array
   $_ = "$createUser[0]";
   #RegEx - Explaination - this code repeats in the program#
   # ^ - anchor to begining of string, \w - matches 1 character, {1} - match is set to max of 1, parens make this part a capture group
   # and allow the $1 at the end to be used as the capture variable
   # \w+ - matches the rest of the word in the search pattern, but only the capture group of $1 variable is in the replace string
   # the entire string is replaced with the $1
   $_ =~ s/(^\w{1})\w+/$1/;#captures 1st character of the 1st element and replacing the string with 1st character into the $1 variable
   $createUser[0] = $_;
   $_ = "$createUser[1]";
   $_ =~ s/(^.{4}).*$/$1/;#captures 1st 4 characters of 2nd element
   $createUser[1] = $_;
   chomp(my $userName = "$createUser[0]"."$createUser[1]");#username is now created.
   open my( $FILE ), '<', $filename;
   @names = <$FILE>;
   #foreach control structure from pg 53.
   foreach $names(@names){#processes through list using foreach to find if there is a match
      my $userAdd = "1";
      my @tempArray = split /\:/,$names;#split function on page 159
      chomp($_ = @tempArray[2]);
      if ($_ eq $userName){
        $userName = $userName.$userAdd;#adds 1 to the user name using concatenation
      }# end of if statement
   }#end of foreach loop
   close $FILE;
   push (@userArray, $userName);
   #chomp(my $newUser = $userArray[0].":".$userArray[1].":".$userArray[2]);#concatenates array into $userName
   (my $newUser = $userArray[0].":".$userArray[1].":".$userArray[2]);#concatenates array into $userName
   chomp $newUser;
   open my( $FILE ), '>>', $filename;
   print $FILE "$newUser\n";
   close $FILE;
   printf "first name:  %s\n", $userArray[0];
   printf "last name:  %s\n", $userArray[1];
   printf "user name will be:  %s\n", $userArray[2];
}#end of NEW user

# Search user captures the first name from the keyboard and changes it to all upper case using the same case converter
# as previously used in the program. The file is then opened and a foreach loop takes the first name as it walks through
# the file. It then compares the 1st element to the default variable. If there is a match, it then prints the rest of the
# array being held in the default tempArray.
sub searchUser{
   print "Enter user's first name to SEARCH: ";
   chomp($_ = <STDIN>);
   if ($_ eq undef){
       print "You did not enter a first name\n";
       print "Error!\n";
       return;
   }
   s/($_)/\U$1/i;
   open my( $FILE ), '<', $filename;
   @names = <$FILE>;
   #foreach control structure from pg 53.
   foreach $names(@names){
      my @tempArray = split /\:/,$names;#split function on page 159
      if (@tempArray[0] eq $_){
            printf "%-7s%-10s%-10s\n",$tempArray[0], $tempArray[1], $tempArray[2];
           }       
   }#end of foreach loop
   close $FILE;
}#end of SEARCH user

# Delete user takes first name from the user and then capitalizes the word. It then opens the file
# and does the same processing as search user. Except when there is a match, it reprints the file
# without the match, thereby deleting the word from the file.
sub deleteUser{
   print "Enter user's first name to DELETE: ";
   chomp($_ = <STDIN>);
   #vaidates if $_ has data in it.
   if ($_ eq undef){
       print "You did not enter a first name\n";
       print "Error!\n";
       return;
   }
   s/($_)/\U$1/i;
   chomp $_;
   open my( $FILE ), '<', $filename;
   @names = <$FILE>;
   close $FILE;
   open ($FILE , '>', $filename);
   foreach $names(@names){
      my @tempArray = split /\:/,$names;#split function on page 159
      if ($_ ne @tempArray[0]){
        print $FILE $names;
      }# end of if       
   }#end of foreach loop
   close $FILE;
}#end of delete user

# The printUsers function, creates a hash which will be used for sorting. Then opens the file
# reads in the file one row at a time, splits the data into an array, which is the created
# into another array to be used for the value of the hash. The user name from the file
# is then pushed onto the hash as the key, while the array is used as the value.
# After the processing is completed, a foreach loop unwinds the hash sorting
# and printing the values to the screen.
sub printUsers{
     my %users;
     open my( $FILE ), '<', $filename;
     while(my $row = <$FILE>){
       chomp $row;
       my @fields = split /:/,$row; #split function on page 159
       my @names = ($fields[0],$fields[1]);#adds first name and last name to array
       push @{$users{$fields[2]}}, @names;#pushes array onto the hash during the loop
     }#end of while loop 
     close $FILE; # close the FILE
     
     #Foreach for hash was taken from book page 117.
     foreach my $keys(sort keys %users) {
       $_ = "$keys @{$users{$keys}}"; #sets the default variable equal to the row of data that gets split and sorted to the screen
       s/($_)/\U$1/i;
       my @fields = split /\s+/,$_; #split function on page 159
       printf "%-15s %-15s %-15s\n",$fields[0], $fields[1], $fields[2];
     }# end of foreach loop - this is what sorts the hash array
} # end of printUsers

# The convertFile function reads in the entire file and adjusts in case any characters are lower case.
# The function opens the file, reads in one line at a time and converts all characters into uppercase.
# It then chomps any extra lines added in processing and pushes it into a temp array named convertFile.
# After the file is closed, it is then opened again for reprocessing into the file. $" is used to space
# out the arrays with a new line, but an extra newline is added to the end of the array before printing
# to the file in order to balance out missnig newline at the end of the file.
sub convertFile{
   open my( $FILE ), '<', $filename;
   while($_ = <$FILE>){
      s/($_)/\U$1/i;
      chomp $_;
      push (@convertFile,$_);# pushes row of data from file into array.
   }#end of while loop
   close $FILE;
   open my( $FILE ), '>', $filename;
   $" = "\n";
   chomp($_ = "\n"); #adds new line but chops any extra space and newlines from the newline character
   push (@convertFile,$_);#pushes the newline character to the end of the file.
   print $FILE "@convertFile";#prints the array into the new file.
   close $FILE;
}#end of convert file