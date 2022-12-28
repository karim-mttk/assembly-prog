#include <stdio.h>


int main(){
	int arr[]= {5,6,3,4,2};
	int *x;
	
	x = arr;

	for (int i = 0; i<5; i++){

	printf("arr value: %d\n", *x);
	
	x++; }
return 0;
}
