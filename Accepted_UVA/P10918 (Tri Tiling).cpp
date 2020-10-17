/****************************
 Problem: 10918 - Tri Tiling
 Author: Piotr Rudnicki
 Solved by Andrey Grigorov
 ****************************/

#include <stdio.h>

bool Can(int l, int k){
	bool b = false;
	const int d[3] = {1,2,4};
	int i;
	for (i = 0; i <= 2; i++)
		if (!(k & d[i]))
			if (!(l & d[i]))
				b = !b;
			else{
				if (b)
					return false;
			}
		else
			if ((l & k) || b)
				return false;
	return !b;
}

int main(){
	long int b[8][31];
	int i,j,k,l,n;
	for (i = 0; i <= 7; i++)
		for (j = 0; j <= 30; j++)
			b[i][j] = 0;
	b[0][0] = 1;
	for (i = 1; i <= 30; i++)
		for (k = 0; k <= 7; k++)
			for (l = 0; l <= 7; l++)
				if (Can(l,k))
					b[k][i] += b[l][i-1];	
	scanf("%d",&n);
	while (n != -1){
		printf("%ld\n",b[0][n]);
		scanf("%d",&n);
	}
	return 0;
}