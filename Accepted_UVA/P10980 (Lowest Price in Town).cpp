/**************************************
 Problem: 10980 - Lowest Price in Town
 Return of the Newbies 2005
 Problemsetter: Mak Yan Kei
 Solved by Andrey Grigorov
 **************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>


int main(){
	const int maxk = 100, maxm = 20;
	double p[maxm+1],r[maxk+1],buf[maxk+1];
	int i,j,g,h,m,k,len,n_case,n[maxm+1];
	char st[1000],w[4];
	n_case = 0;
	while (scanf("%lf %d",&p[0],&m) == 2){
		for (i = 1; i <= m; i++)
			scanf("%d %lf",&n[i],&p[i]);
		for (i = 0; i <= maxk; i++)
			r[i] = i*p[0];
		for (i = 1; i <= m; i++){
			for (j = 0; j <= maxk; j++)
				buf[j] = r[j];
			for (j = 0; j <= maxk; j++)
				for (g = 1; j+(g-1)*n[i] <= maxk; g++)
					for (h = j; (h <= j+g*n[i]) && (h <= maxk); h++)
						if (buf[h] > r[j] + g*p[i])
							buf[h] = r[j] + g*p[i];
			for (j = 0; j <= maxk; j++)
				r[j] = buf[j];
		}
		gets(st);
		gets(st);
		printf("Case %d:\n",++n_case);
		len = strlen(st);
		i = 0;
		while (i < len){
			j = 0;
			while ((i < len) && (st[i] != ' ')){
				w[j++] = st[i++];
			}
			w[j] = '\0';
			k = atoi(w);
			printf("Buy %d for $%0.2lf\n",k,r[k]);
			i++;
		}
	}
	return 0;
}