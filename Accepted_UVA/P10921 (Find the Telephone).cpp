/*******************************************
 Problem: 10921 - Find the Telephone
 Problem setter: Sergio Queiroz de Medeiros
 Solved by Andrey Grigorov
 *******************************************/

#include <stdio.h>
#include <string.h>
#include <ctype.h>

const char code[26] = {'2','2','2',
                       '3','3','3',
                       '4','4','4',
                       '5','5','5',
                       '6','6','6',
                       '7','7','7','7',
                       '8','8','8',
                       '9','9','9','9'};

char decode(char ch){
	if (isupper(ch))
		return code[ch-'A'];
	else
		return ch;
}

int main(){
	char st[32];
	int i,len;
	while (scanf("%s",&st) != EOF){
		len = strlen(st);
		for (i = 0; i < len; i++)
			printf("%c",decode(st[i]));
		printf("\n");
	}
	return 0;
}