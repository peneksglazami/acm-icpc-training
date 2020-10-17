/********************************
 Problem: 10954 - Add All
 Problem setter: Md. Kamruzzaman
 Solved by Andrey Grigorov
 ********************************/

#include <stdio.h>
#include <vector>
#include <queue>
#include <functional>

using namespace std;

int main(){
	priority_queue <int, vector<int>, greater<int> > pq;
	int a,b,i,n,sum;
	scanf("%d",&n);
	while (n){
		while (!pq.empty())
			pq.pop();
		for (i = 1; i <= n; i++){
			scanf("%d",&a);
			pq.push(a);
		}
		sum = 0;
		while (n > 1){
			a = pq.top();
			pq.pop();
			b = pq.top();
			pq.pop();
			pq.push(a+b);
			sum += a+b;
			n--;
		}
		printf("%d\n",sum);
		scanf("%d",&n);
	}
	return 0;
}