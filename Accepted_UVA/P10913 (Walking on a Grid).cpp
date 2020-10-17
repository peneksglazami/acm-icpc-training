/****************************************************
 Problem: 10913 - Walking on a Grid
 4th IIUC Inter-University Programming Contest, 2005
 Problemsetter: Sohel Hafiz
 Solved by Andrey Grigorov
 ****************************************************/

#include <stdio.h>

long int fmax(long int a, long int b){
	return (a > b) ? a : b;
}

int main(){
	const int maxn = 75, maxk = 5;
	const long int INFINITY = -10000001;
	
	long int max,m[maxn][maxn],t[maxn][maxn][maxk+1],buf[maxn][maxk+1],buf1[maxn][maxk+1],buf2[maxn][maxk+1];
	int i,j,g,n,k,n_case;
	
	n_case = 0;
	scanf("%d %d",&n,&k);
	while (n){
		for (i = 0; i < n; i++)
			for (j = 0; j < n; j++)
				scanf("%ld",&m[i][j]);
		for (i = 0; i < n; i++)
			for (j = 0; j < n; j++)
				for (g = 0; g <= k; g++)
					t[i][j][g] = INFINITY;
		
		if (m[0][0] >= 0)
			t[0][0][0] = m[0][0];
		else
			t[0][0][1] = m[0][0];

		for (i = 1; i < n; i++)
			if (m[0][i] >= 0){
				for (g = 0; g <= k; g++)
					if (t[0][i-1][g] != INFINITY)
						t[0][i][g] = t[0][i-1][g]+m[0][i];
			}
			else
				for (g = 0; g <= k-1; g++)
					if (t[0][i-1][g] != INFINITY)
						t[0][i][g+1] = t[0][i-1][g]+m[0][i];

		for (i = 1; i < n; i++){

			for (j = 0; j < n; j++)
				if (m[i][j] >= 0){
					for (g = 0; g <= k; g++)
						if (t[i-1][j][g] != INFINITY)
							t[i][j][g] = t[i-1][j][g]+m[i][j];
				}
				else
					for (g = 0; g <= k-1; g++)
						if (t[i-1][j][g] != INFINITY)
							t[i][j][g+1] = t[i-1][j][g]+m[i][j];

			for (j = 0; j < n; j++)
				for (g = 0; g <= k; g++)
					buf[j][g] = buf1[j][g] = buf2[j][g] = t[i][j][g];
			
			for (j = 1; j < n; j++)
				if (m[i][j] >= 0){
					for (g = 0; g <= k; g++)
						if (buf1[j-1][g] != INFINITY)
							if (buf1[j-1][g]+m[i][j] > buf1[j][g])
								buf1[j][g] = buf1[j-1][g]+m[i][j];
				}
				else
					for (g = 0; g <= k-1; g++)
						if (buf1[j-1][g] != INFINITY)
							if (buf1[j-1][g]+m[i][j] > buf1[j][g+1])
								buf1[j][g+1] = buf1[j-1][g]+m[i][j];

			for (j = n-2; j >= 0 ; j--)
				if (m[i][j] >= 0){
					for (g = 0; g <= k; g++)
						if (buf2[j+1][g] != INFINITY)
							if (buf2[j+1][g]+m[i][j] > buf2[j][g])
								buf2[j][g] = buf2[j+1][g]+m[i][j];
				}
				else
					for (g = 0; g <= k-1; g++)
						if (buf2[j+1][g] != INFINITY)
							if (buf2[j+1][g]+m[i][j] > buf2[j][g+1])
								buf2[j][g+1] = buf2[j+1][g]+m[i][j];

			for (j = 0; j < n; j++)
				for (g = 0; g <= k; g++)
					t[i][j][g] = fmax(buf[j][g],fmax(buf1[j][g],buf2[j][g]));
			
		}
		max = INFINITY;
		for (g = 0; g <= k; g++)
			if (max < t[n-1][n-1][g])
				max = t[n-1][n-1][g];
		printf("Case %d: ",++n_case);
		if (max == INFINITY)
			printf("impossible\n");
		else
			printf("%ld\n",max);
		scanf("%d %d",&n,&k);
	}
	return 0;
}