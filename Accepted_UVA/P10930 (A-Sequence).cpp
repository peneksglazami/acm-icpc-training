/*******************************************
 Problem: 10930 - A-Sequence
 Problem setter: Sergio Queiroz de Medeiros 
 Solved by Andrey Grigorov
 *******************************************/

#include <stdio.h>

int main(){
	int sum,i,j,buf,d,n_case,a[30],q[30000],qq,qq2;
	bool ok,b[30001];
	n_case = 0;
	while (scanf("%d",&d)==1){
		sum = 0;
		printf("Case #%d:",++n_case);
		for (i = 0; i < d; i++){
			scanf("%d",&a[i]);
			printf(" %d",a[i]);
			sum+=a[i];
		}
		printf("\n");
		ok = true;
		for (i = 1; i < d; i++)
			ok = ok && (a[i-1] < a[i]);
		if (!ok){
			printf("This is not an A-sequence.\n");
			continue;
		}
		for (i = 0; i <= sum; i++)
			b[i] = false;
		q[0] = a[0];
		qq2 = 0;
		ok = true;
		for (i = 1; i < d; i++){
			if (b[a[i]]){
				ok = false;
				break;
			}
			else{
				qq = qq2;
				for (j = 0; j <= qq; j++)
					if (!b[q[j]+a[i]]){
						b[q[j]+a[i]] = true;
						q[++qq2] = q[j]+a[i];
					}
				q[++qq2] = a[i];
			}
		}
		if (ok)
			printf("This is an A-sequence.\n");
		else
			printf("This is not an A-sequence.\n");
	}
	return 0;
}