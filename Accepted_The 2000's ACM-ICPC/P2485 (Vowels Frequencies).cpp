/***********************************************
 Problem: 2485 - Vowels Frequencies
 ACM ICPC - Oceania - South Pacific - 2002/2003
 Solved by Andrey Grigorov
 ***********************************************/

#include <stdio.h>
#include <string.h>
#include <ctype.h>

int chartoint(char ch){
	switch (ch){
		case 'a': return 0;
		case 'e': return 1;
		case 'i': return 2;
		case 'o': return 3;
		case 'u': return 4;
		default: return -1;
	}
}

int main(){
	const char v[5] = {'a','e','i','o','u'};
	const int maxn = 200;
	char st[maxn+2];
	int i,j,len,buf,a[5],ch[5];	
	while (strcmp(gets(st),"#")){
		memset(a,0,sizeof(a));
		for (i = 0; i <= 4; i++)
			ch[i] = i;
		len = strlen(st);
		for (i = 0; i < len; i++)
			if (chartoint(tolower(st[i])) != -1)
				a[chartoint(tolower(st[i]))]++;
		for (i = 0; i < 4; i++)
			for (j = i+1; j < 5; j++)
				if ((a[i] < a[j]) || ((a[i] == a[j]) && (ch[i] > ch[j]))){
					buf = a[i]; a[i] = a[j]; a[j] = buf;
					buf = ch[i]; ch[i] = ch[j]; ch[j] = buf;
				}
		for (i = 0; i < 4; i++)
			printf("%c:%d ",v[ch[i]],a[i]);
		printf("%c:%d.\n",v[ch[4]],a[4]);
	}
	return 0;
}