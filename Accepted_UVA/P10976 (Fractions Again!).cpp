/***********************************
 Problem: 10976 - Fractions Again?!
 Return of the Newbies 2005
 Problemsetter: Mak Yan Kei
 Solved by Andrey Grigorov
 ***********************************/

#include <stdio.h>

int main(){
	long int cnt,k,y;
	while (scanf("%ld",&k) == 1){
		cnt = 0;
		for (y = k+1; y <= 2*k; y++)
			if (!(k*y % (y-k)))
				cnt++;
		printf("%ld\n",cnt);
		for (y = k+1; y <= 2*k; y++)
			if (!(k*y % (y-k)))
				printf("1/%d = 1/%d + 1/%d\n",k,k*y/(y-k),y);
	}
	return 0;
}