/*******************************************
 Problem: 10924 - Prime Words
 Problem setter: Sergio Queiroz de Medeiros
 Solved by Andrey Grigorov
 *******************************************/

#include <stdio.h>
#include <string.h>
#include <ctype.h>

const int maxl = 20;

bool p[52*maxl+2];

int char_to_int(char ch){
	if (islower(ch))
		return ch-'a'+1;
	else
		return 27+ch-'A';
}

void create_prime(){
	int i,j;
	for (i = 2; i <= 52*maxl+1; i++){
		if (!p[i])
			for (j = i+i; j <= 52*maxl+1; j+=i)
				p[j] = true;
	}
}

bool isprime(int i){
	return !p[i];
}

int main(){
	char st[22];
	int i,sum,len;
	create_prime();
	while (scanf("%s",&st) != EOF){
		sum = 0;
		len = strlen(st);
		for (i = 0; i < len; i++)
			sum += char_to_int(st[i]);
		if (isprime(sum))
			printf("It is a prime word.\n");
		else
			printf("It is not a prime word.\n");
	}
	return 0;
}