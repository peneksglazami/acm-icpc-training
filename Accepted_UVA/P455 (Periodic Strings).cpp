/********************************
 Problem: 455 - Periodic Strings
 Solved by Andrey Grigorov
 ********************************/

#include <stdio.h>
#include <string.h>

int main(){
	const int maxlen = 80; 
	char st1[maxlen+1],st2[maxlen+1],st3[maxlen+1];
	int i,j,min,test;
	unsigned int len;
	scanf("%d",&test);
	while (test){
		scanf("");
		scanf("%s",&st1);
		len = strlen(st1);
		for (i = 1; i <= len; i++)
			if (len % i == 0){
				for (j = 0; j <= i-1; j++)
					st2[j] = st1[j];
				st2[i] = 0;
				st3[0] = '\0';
				for (j = 1; j <= len/i; j++)
					strcat(st3,st2);
				if (!strcmp(st1,st3)){
					min = i;
					break;
				}
			}
		printf("%d\n",min);
		test--;
		if (test){
			printf("\n");
		}
	}
	return 0;
}