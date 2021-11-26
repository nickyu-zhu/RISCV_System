#include "stdio.h"
#include "common.h"


void _putch(int c)
{
  const int tty_wr_addr = 0xffff0000;
  __asm volatile("sw %0, 0(%1)"
	       : : "r" (c), "r"(tty_wr_addr)
	       );
}

void puts(const char* s)
{
  while(*s != '\0')
    {
      _putch(*s);
      s++;
    }
}


void printnum(int a, int base)
{
  if(a<0)
    {
      _putch('-');
      printnum(-a,base);
      return;
    }

  if(a == 0)
    {
      _putch('0');
      return;
    }
  int b = a / base;
  if(b > 0) printnum(b, base);
  
  if(base <= 10)
    {
      _putch((a%base) + '0');
    }
  else
    {
      _putch("0123456789ABCDEF"[a%base]);
    }


}

int _kbd_avail()
{
  const int kbd_avail_addr = 0xffff00f4;
  int avail = 0;
  __asm volatile("lw %0, 0(%1)"
		 : "=r"(avail) : "r"(kbd_avail_addr)
	       );
  return avail;
}

int _get_kbd_char()
{
  const int kbd_char_addr = 0xffff00f0;
  int ch = 0;
  __asm volatile("lw %0, 0(%1)"
		 : "=r"(ch) : "r"(kbd_char_addr)
		 );
  return ch;
}

int getchar() // used when kbd interrupt is not enabled
{

  while(!_kbd_avail());
  // wait for keyboard input
  int a = _get_kbd_char();
  return a;
}

int getline(char* ch)
{
  int cur = 0;
  int buf;
  while((buf = getchar()) != '\n')
    {
      ch[cur++] = buf;
      _putch(buf);
    }
  ch[cur] = '\0';
  _putch('\n');
}


