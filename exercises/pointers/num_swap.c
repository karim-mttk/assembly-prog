#include <stdio.h>

void swap(int *x, int *y){

	int temp;

	temp = *x;
	*x = *y;
	*y = temp;

	printf("after swap: \n");
	printf("1st number: %d\n",*x);
	printf("2nd number: %d\n", *y);
}

int main(){

	int num1 = 4;
	int num2 = 5;

	swap(&num1, &num2);

return 0;
}

