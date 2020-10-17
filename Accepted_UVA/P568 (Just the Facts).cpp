/******************************
 Problem: 568 - Just the Facts
 Author: Miguel A. Revilla
 Solved by Andrey Grigorov
 ******************************/

#include <stdio.h>

int main(){
	const int maxn = 10000, maxmod = 100000;
	long int i,n,a[maxn+1];
	a[0] = 1;
	for (i = 1; i <= maxn; i++){
		a[i] = a[i-1]*i;
		while (!(a[i] % 10))
			a[i] /= 10;
		a[i] %= maxmod; 
	}
	while (scanf("%ld",&n) != EOF)
		printf("%5ld -> %ld\n",n,a[n]%10);
	return 0;
}