/*****************************************************************************
 Problem: 1068 - Sum
 2000-2001 ACM Northeastern European Regional Programming Contest (test tour)
 Solved by Andrey Grigorov
 *****************************************************************************/

#include <stdio.h>

int main(){
	long int n;
	scanf("%ld",&n);
	if (n <= 0){
		n = -n;
		printf("%ld",-n*(n+1)/2+1);
	}
	else
		printf("%ld",n*(n+1)/2);
	return 0;
}