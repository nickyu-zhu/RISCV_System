#include "stdio.h"
int main()
{
  for(int i = 0; i < 100; i++)
    {
      printnum(i, 10);
      _putch('x');
      printnum(i, 10);
      _putch('=');
      printnum(i*i, 10);
      _putch('\n');
    }
}
