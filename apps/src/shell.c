#include "stdio.h"
#include "string.h"
const char help_msg[] =
  "help: \n"
  "  ls     -  list programs.\n"
  "  hello  -  hello world.\n"
  "  square -  square number.\n" ;

void exec_ls()
{
  const char progs[] = "hello    square\n";
  puts(progs);
  return;
}

void exec_hello()
{
  char p[] = "Hello, world!\n";
  puts(p);
  puts("666 in hex is ");
  printnum(666,16);
}

void exec_square()
{
    for(int i = 0; i < 10; i++)
    {
      printnum(i, 10);
      _putch('x');
      printnum(i, 10);
      _putch('=');
      printnum(i*i, 10);
      _putch('\n');
    }

}

void digest_command(const char* comm)
{
  if(strcmp(comm, "") == 0)
    {
    }
  else if(strcmp(comm, "help") == 0)
    {
      puts(help_msg);
    }
  else if(strcmp(comm, "ls") == 0)
    {
      exec_ls();
    }
  else if(strcmp(comm, "hello") == 0)
    {
      exec_hello();
    }
  else if(strcmp(comm, "square") == 0)
    {
      exec_square();
    }
  else
    {
      puts("bad command, use [help] to get help.\n");
    }
  return;
}

int main()
{
  char buf[20];
  while(1)
    {
      puts("sh> ");
      getline(buf);
      digest_command(buf);
    }
}
