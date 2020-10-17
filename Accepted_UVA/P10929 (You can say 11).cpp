/********************************
 Problem: 10929 - Ypu can say 11
 Problem setter: David Deharbe
 Solved by Andrey Grigorov
 ********************************/

#include <stdio.h>
#include <string.h>

int main(){
	const int maxn = 1000;
	const char zero[2] = "0";
	char st[maxn+1];
	int i,len,s;
	gets(st);
	while (strcmp(st,zero)){
		len = strlen(st);
		s = 0;
		for (i = 0; i < len; i++)
			if (i % 2)
				s+=(int)(st[i]-'0');
			else
				s-=(int)(st[i]-'0');
		if (s % 11)
			printf("%s is not a multiple of 11.\n",st);
		else
			printf("%s is a multiple of 11.\n",st);
		gets(st);
	}
	return 0;
}