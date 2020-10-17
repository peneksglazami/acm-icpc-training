/*****************************
 Problem: 661 - Blowing Fuses
 Author: Miguel Revilla
 Solved by Andrey Grigorov
 *****************************/

#include <stdio.h>
const int maxn = 20;

int main(){
	int i,n,m,c,nn,max,sum,a[maxn+1],n_case;
	bool blow,b[maxn+1];
	n_case = 0;
	scanf("%d %d %d",&n,&m,&c);
	while ((n != 0) || (m != 0) || (c != 0)){
		for (i = 1; i <= n; i++){
			scanf("%d",&a[i]);
			b[i] = false;
		}
		blow = false;
		sum = 0;
		max = 0;
		for (i = 1; i <= m; i++){
			scanf("%d",&nn);
			if (blow)
				continue;
			b[nn] = !b[nn];
			sum = (b[nn]) ? sum+a[nn] : sum-a[nn];
			blow = blow || (sum > c);
			if (!blow)
				if (sum > max)
					max = sum;
		}
		n_case++;
		printf("Sequence %d\n",n_case);
		if (blow)
			printf("Fuse was blown.\n");
		else{
			printf("Fuse was not blown.\n");
			printf("Maximal power consumption was %d amperes.\n",max);
		}
		scanf("%d %d %d",&n,&m,&c);
		if ((n != 0) || (m != 0) || (c != 0))
			printf("\n");
	}
	return 0;
}