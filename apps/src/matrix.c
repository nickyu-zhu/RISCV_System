#define BASE_ADDR 0xFFFF0F00
#define screen_display(offset, value) \
  *((unsigned int*)((void*)BASE_ADDR + (offset<<2))) = (value)

int main()
{
  int j = 0xff00ff00;
  for(int i = 0; i < 32; i++)
    {
      screen_display(i,j);
      j<<=1;
      j |= 1;
    }

}
