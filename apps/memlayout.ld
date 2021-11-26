SECTIONS {
  ENTRY(_begin)
  . = 0x0;
  .text : {
    *(entry)
    *(.text)
  }
  etext = .;
  _etext = .;
  .rodata : {
    *(.rodata*)
  }
  . = 0x00ff0000;
  .data : {
    *(.data)
  }
  edata = .;
  _data = .;
  .bss : {
	_bss_start = .;
    *(.bss*)
    *(.sbss*)
    *(.scommon)
  }
}
