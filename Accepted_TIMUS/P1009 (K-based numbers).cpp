/********************************
 Problem: 1009 - K-based numbers
 Solved by Andrey Grigorov
 ********************************/

#include <stdio.h>

const int maxk = 10, maxn = 16;

int main(){
	int i,j,g,n,k;
	long int t[maxn+1][maxk],sum;
	scanf("%d %d",&n,&k);
	t[1][0] = 0;
	for (i = 1; i <= k-1; i++)
		t[1][i] = 1;
	for (i = 2; i <= n; i++)
		for (j = 0; j <= k-1; j++){
			t[i][j] = 0;
			for (g = (j) ? 0 : 1; g <= k-1; g++)
				t[i][j] += t[i-1][g];
		}
	sum = 0;
	for (i = 0; i <= k-1; i++)
		sum += t[n][i];
	printf("%ld",sum);
	return 0;
}