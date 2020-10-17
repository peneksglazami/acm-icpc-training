/*************************
 Problem: 10365 - Blocks
 Solved by Andrey Grigorov
 *************************/

#include <iostream.h>

int main(){
  int l,w,h,n,test,minS,S;
  cin >> test;
  while (test >= 1){
    cin >> n;
    if (n == 0){
      cout << 0 << endl;
      test--;
      continue;
    }
    minS=-1;
    for (l = 1; l <= n; l++)
      for (w = 1; w <= n/l; w++)
	if (n%(l*w) == 0){
     	  h = n/(l*w);
	  S = 2*(l*w+l*h+h*w);
	  if (minS == -1)
            minS = S;
	  else
            if (minS > S)
              minS = S;
	}
    cout << minS << endl;	  
    test--;
  }
  return 0;
}