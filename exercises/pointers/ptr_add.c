#include <stdio.h>

int main(){

  int num1, num2, sum;
  int *x;
  int *y;

  x = &num1;
  y = &num2;


  printf("Enter two nums: \n");
  scanf("%d%d", x, y);

  sum = *x + *y;
  printf("The sum is: %d", sum); 

return 0;
}

