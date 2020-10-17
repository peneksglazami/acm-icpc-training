/* **********************************************************************
 Problem: 1225 - Flags
 2002-2003 ACM Central Region of Russia Quarterfinal Programming Contest
 Rybinsk, October 2002
 Solved by Andrey Grigorov
 ************************************************************************/

#include <stdio.h>

int main(){
	const int maxn = 45;
	unsigned long int t[maxn][3];
	int i,n;
	scanf("%d",&n);
	t[0][0] = 1; //red
	t[0][1] = 1; //white
	t[0][2] = 0; //red blue
	t[0][3] = 0; //white blue
	for (i = 1; i <= n-1; i++){
		t[i][0] = t[i-1][1]+t[i-1][3];
		t[i][1] = t[i-1][0]+t[i-1][2];
		t[i][2] = t[i-1][0];
		t[i][3] = t[i-1][1];
	}
	printf("%lu",t[n-1][0]+t[n-1][1]);
	return 0;
}