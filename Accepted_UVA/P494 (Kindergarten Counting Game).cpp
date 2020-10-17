/******************************************
 Problem: 494 - Kindergarten Counting Game
 Solved by Andrey Grigorov
 ******************************************/

#include <iostream>
#include <string>
#include <ctype.h>

using namespace std;

int main(){
	string st;
	int i,cnt;
	bool new_word;
	while (getline(cin,st)){
		cnt = 0;
		new_word = true;
		for (i = 0; i < st.length(); i++)
			if (isalpha(st.at(i))){
				if (new_word){
					new_word = false;
					cnt++;
				}
			}
			else
				new_word = true;
		cout << cnt << endl;
	}
	return 0;
}