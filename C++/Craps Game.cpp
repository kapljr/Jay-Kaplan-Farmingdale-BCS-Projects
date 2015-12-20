
#include <iostream>
#include <time.h>

using namespace std;

void diceMenu(); //menu generator
void topMenu(); //Top of message
void bottomMenu(); //bottom of message

int main()
{
	//declares variables
	int i, dice1 = 0, dice2 = 0, roll = 0, point = 0;
	double bankRoll = 1000, bet = 0;
	char stillPlay;
	
	//sets time for random numbers
	srand(time(0));

	//Starting Message for Game
	diceMenu();
	
	//Opening bet and establish the bankroll
	cout << "\nHow much do you want to bet? ";
	cin >> bet;
	bankRoll = bankRoll - bet;
		
	//outter loop
	while (bankRoll >= 0)
	{
		dice1 = (rand() % 6 + 1);
		dice2 = (rand() % 6 + 1);
		roll = dice1 + dice2;
			
		cout << "Your new roll of the dice is " << roll << endl;
			
		//loop to check for craps roll
		while (roll == 2 || roll == 3 || roll == 7 || roll == 11 || roll == 12)
			{
				// checks for 7 or 11
				if (roll == 7 || roll == 11)
				{
					cout << "\n=============";
					cout << "\n Player Wins" << endl;
					cout << "=============\n" << endl;
										
					bankRoll = bankRoll + bet * 2; //check calculations here
					cout << "Your current bankroll is $" << bankRoll << endl;
				
					// if statement to check for money in bank
					{if (bankRoll <= 0)
						{
						topMenu();
						cout << "You have no more money left\n";
						cout << "Game Over\n";
						bottomMenu();
						return 1;
						}
					}//ending bracket for if of zero dollars left over

					//Checks if you still want to play
					cout << "\nDo you still want to play?\n(Enter Y for Yes or N for No)";
					cin >> stillPlay;
					{if (stillPlay == 'N' || stillPlay == 'n')
						if (bankRoll > 0)
						{
							if (bankRoll > 1000)
							{
								topMenu();
								cout << "You won $" << bankRoll - 1000 << ". Try again soon!!!\n";
								bottomMenu();
								return 1;
							}
							else
							{
								topMenu();
								cout << "You lost $" << 1000 - bankRoll << " today. Try again soon.\n";
								bottomMenu();
								return 1;
							}
						}
						else
						{
							topMenu();
							cout << "\nYou have no money left. You lose\n" << endl;
							bottomMenu();
							return 1;
						}
					 } //end stillPlay if statement
					
					cout << "\nHow much do you want to bet? ";
					cin >> bet;
					if (bankRoll > 0)
						bankRoll = bankRoll - bet;
					else
					{
						topMenu();
						cout << "\nYou have no more money. Try again later\n";
						bottomMenu();
						return 1;
					}
					

				} // 7 or 11 if

				//checks for 2, 3, or 12
				else if (roll == 2 || roll == 3 || roll == 12)
				{
					cout << "\n===============" << endl;
					cout << "Player Loses $" << bet << endl;
					cout << "===============" << endl;
					
					cout << "Your current bankroll is $" << bankRoll << endl;
					{if (bankRoll <= 0)
						{
							topMenu();
							cout << "You have no more money left\n";
							cout << "Game Over\n";
							bottomMenu();
							return 1;
						}
					}//ending bracket for if of zero dollars left over
					
					cout << "\nDo you still want to play?\n(Enter Y for Yes or N for No)";
					cin >> stillPlay;
					{
						if (stillPlay == 'N' || stillPlay == 'n')
							if (bankRoll > 0)
							{
								if (bankRoll > 1000)
									{
										topMenu();
										cout << "You won $" << bankRoll - 1000 << ". Try again soon!!!\n";
										bottomMenu();
										return 1;
									}
								else
									{
										topMenu();
										cout << "You lost $" << 1000 - bankRoll << " today. Try again soon.\n";
										bottomMenu();
										return 1;
									}
							}
						else
							{
								topMenu();
								cout << "\nYou have no money left. You lose\n" << endl;
								bottomMenu();
								return 1;
							}
					} //end stillPlay if statement
					
					//checks bank roll
					cout << "\nHow much do you want to bet? ";
					cin >> bet;
						if (bankRoll > 0)
							bankRoll = bankRoll - bet;
						else
						{
							cout << "\nYou have no more money. Try again later\n";
							return 1;
						}
		
				}//close 2 3 or 12 if
			
				dice1 = (rand() % 6 + 1);
				dice2 = (rand() % 6 + 1);
				roll = dice1 + dice2;
				cout << "Your new roll of the dice is " << roll << endl;
			
			}
			
			cout << "Player's roll of " << roll << " is now the point" << endl;
			point = roll;

	//Inner While loop for roll
	while (roll == 4 || roll == 5 || roll == 6 || roll == 8 || roll == 9 || roll == 10 || roll == 2 || roll == 3 || roll == 11 || roll == 12)
	
		{
			dice1 = (rand() % 6 + 1);
			dice2 = (rand() % 6 + 1);
			roll = dice1 + dice2;
			cout << "Your next roll of the dice was " << roll << endl;

			//checks now for 2, 3, 12, 7 or 11 and prints out message for those rolls, all others are the point
			if (roll == 2 || roll == 3 || roll == 12)
					cout << "Craps, Keep Rolling" << endl;
			else if (roll == 11)
					cout << "Keep Rolling" << endl;	
			else if (roll == 7)
				{
					cout << "\n===========" << endl;
					cout << "You Lose $" << bet << endl;
					cout << "===========\n" << endl;
				}
			else if (point == roll)
				{
					cout << "\n====================" << endl;
					cout << " You made the Point" << endl;
					cout << "   Player Wins" << endl;
					cout << "====================\n" << endl;
					bankRoll = bankRoll + bet * 2;
					break;
				}
			
		} // closing bracket for inner while loop roll
			cout << "Your current bankroll is $" << bankRoll << endl;
			{
				if (bankRoll <= 0)
					{
					topMenu();
					cout << "You have no more money left\n";
					cout << "Game Over\n";
					bottomMenu();
					return 1;
					}
			}//ending bracket for if of zero dollars left over
			
			cout << "\nDo you still want to play?\n(Enter Y for Yes or N for No)";
			
			//checks for stillplay
			cin >> stillPlay;
			{
				if (stillPlay == 'N' || stillPlay == 'n')
					if (bankRoll > 0)
					{
						if (bankRoll > 1000)
							{
								topMenu();
								cout << "You won $" << bankRoll - 1000 << ". Try again soon!!!\n";
								bottomMenu();
								return 1;
							}
						else
							{
								topMenu();
								cout << "You lost $" << 1000 - bankRoll << " today. Try again soon.\n";
								bottomMenu();
								return 1;
							}
					}
					else
					{
						topMenu();
						cout << "\nYou have no more money. Try again later";
						bottomMenu();
						return 1;
					}
			} //end stillPlay if statement
			
			cout << "\nHow much do you want to bet? ";
			cin >> bet;

			if (bankRoll > 0)
				bankRoll = bankRoll - bet;
			else
			{
				topMenu();
				cout << "\nYou have no more money. Try again later";
				bottomMenu();
				return 1;
			}
	}//While loop closing bracket
	
	if (bankRoll == 0)
		cout << "\nSorry you have no more money left\n";
	else
	{
		topMenu();
		cout << "Sorry, You can't bet that amount, try again later" << endl;
		bottomMenu();
	}
	return 0;
} //Main Function closing bracket

void diceMenu()
{
	cout << "Welcome to Jay's Dice Game" << endl;
	cout << "==========================" << endl;
	cout << "Your starting bankroll is $1000" << endl;
	cout << "Good Luck!!!" << endl;
	cout << "==========================" << endl;
}

void topMenu()
{
	cout << "\n=================================" << endl;
	cout << "Thanks for Playing Jay's Dice Game" << endl;
}

void bottomMenu()
{
	cout << "=================================" << endl;

}