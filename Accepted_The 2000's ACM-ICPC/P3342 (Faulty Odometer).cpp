/******************************************************
 Problem: 3342 - Faulty Odometer
 ACM ICPC - North America - Rocky Mountain - 2005/2006
 Solved by Andrey Grigorov
 ******************************************************/

#include <stdio.h>

int main(){
	long int n,res,d[10],dd[10];
	int i;
	d[0] = 1;
	dd[0] = 1;
	for (i = 1; i <= 9; i++){
		d[i] = 9*d[i-1];
		dd[i] = 10*dd[i-1];
	}
	scanf("%ld",&n);
	while (n){		
		printf("%ld: ",n);
		res = 0;
		i = 0;
		while (n){
			res += ((n % 10) < 4) ? (n % 10)*dd[i++] : ((n % 10)-1)*dd[i++];
			n /= 10;
		}
		n = res;
		i = 0;
		res = 0;
		while (n){
			res += (n % 10)*d[i++];
			n /= 10;
		}
		printf("%ld\n",res);
		scanf("%ld",&n);
	}
	return 0;
}