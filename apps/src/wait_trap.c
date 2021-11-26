#include "stdio.h"
int main()
{
  __asm volatile("csrsi mie, 4" : :);
  while(1);
}
