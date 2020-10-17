/******************************
 Problem: 10922 - 2 the 9s
 Problem setter: David Deharbe
 Solved by Andrey Grigorov
 ******************************/

#include <stdio.h>
#include <string.h>

int main(){
	const char zero[] = "0";
	char st[1001];
	int i,len,sum,cnt,n;
	scanf("%s",&st);
	while (strcmp(st,zero)){
		len = strlen(st);
		sum = 0;
		for (i = 0; i < len; i++)
			sum+=(int)(st[i]-'0');
		if (!(sum % 9)){
			cnt = 1;
			while (sum > 9){
				n = sum;
				sum = 0;
				while (n){
					sum += n % 10;
					n /= 10;
				}
				cnt++;
			}
			printf("%s is a multiple of 9 and has 9-degree %d.\n",st,cnt);
		}
		else
			printf("%s is not a multiple of 9.\n",st);
		scanf("%s",&st);
	}
	return 0;
}