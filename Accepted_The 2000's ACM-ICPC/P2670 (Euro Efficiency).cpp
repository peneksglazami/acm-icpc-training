/************************************
 Problem: 2670 - Euro Efficiency
 Europe - Northwestern - 2002/2003
 Solved by Andrey Grigorov
 ************************************/

#include <stdio.h>
#include <string.h>

const int maxn = 10000, maxc = 6;

int i,j,test,sum,max,a[2*maxn+1],c[maxc],q1[2*maxn+1],q2[2*maxn+1],q1_cnt,q2_cnt,step;

int n_to_m(int n){
	return n+maxn;
}

int main(){
	scanf("%d",&test);
	while (test--){
		memset(a,0,(2*maxn+1)*sizeof(a[0]));
		q1_cnt = maxc;
		for (i = 0; i < maxc; i++){
			scanf("%d",&c[i]);
			a[n_to_m(c[i])] = 1;
			q1[i] = c[i];			
		}
		step = 0;
		do{
			step++;
			for (i = 0; i <= q1_cnt; i++){
				q2[i] = q1[i];
				q2[i] = q1[i];
			}
			q2_cnt = q1_cnt;
			q1_cnt = 0;
			for (i = 0; i < q2_cnt; i++)
				for (j = 0; j < maxc; j++){
					if (q2[i] - c[j] >= -maxn){
						if (!a[n_to_m(q2[i]-c[j])]){
							a[n_to_m(q2[i]-c[j])] = a[n_to_m(q2[i])]+1;
							q1[q1_cnt++] = q2[i]-c[j];
						}
					}
					if (q2[i] + c[j] <= maxn){
						if (!a[n_to_m(q2[i]+c[j])]){
							a[n_to_m(q2[i]+c[j])] = a[n_to_m(q2[i])]+1;
							q1[q1_cnt++] = q2[i]+c[j];
						}
					}
				}
		}while (q1_cnt && (step <= 100));
		sum = 0;
		max = 0;
		for (i = 1; i <= 100; i++){
			sum+=a[n_to_m(i)];
			if (max < a[n_to_m(i)])
				max = a[n_to_m(i)];
		}
		printf("%0.2f %d\n",(float)sum/100,max);
	}
	return 0;
}