#include "stdio.h"
#include "common.h"

void ecall_handler()
{
  puts("ecall trapped\n");
}

void extra_handler()
{
  puts("extra trapped\n");
}

void keybd_handler()
{
  puts("keybd trapped:");
  while(_kbd_avail())
    {
      _putch(_get_kbd_char());
    }
  _putch('\n');
  // flush MIP
  __asm volatile("csrci mip, 4");
  // wait
  __asm volatile("nop");
  __asm volatile("nop");
  // flush MIP
  __asm volatile("csrci mip, 4");
  // ok

}

void fault_handler()
{
  puts("fault trapped\n");
}

void ebrk_handler()
{
  puts("ebreak trapped\n");
}
