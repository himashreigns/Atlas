/******************************************************************************
 * lscript.ld — Standalone Zynq-7000 application linker script
 * Code/data live in DDR3 (ps7_ddr_0). FSBL loads us to ps7_ddr_0_S_AXI_BASEADDR.
 ******************************************************************************/

_STACK_SIZE             = DEFINED(_STACK_SIZE)             ? _STACK_SIZE             : 0x4000;
_HEAP_SIZE              = DEFINED(_HEAP_SIZE)              ? _HEAP_SIZE              : 0x4000;
_ABORT_STACK_SIZE       = DEFINED(_ABORT_STACK_SIZE)       ? _ABORT_STACK_SIZE       : 1024;
_SUPERVISOR_STACK_SIZE  = DEFINED(_SUPERVISOR_STACK_SIZE)  ? _SUPERVISOR_STACK_SIZE  : 2048;
_FIQ_STACK_SIZE         = DEFINED(_FIQ_STACK_SIZE)         ? _FIQ_STACK_SIZE         : 1024;
_UNDEF_STACK_SIZE       = DEFINED(_UNDEF_STACK_SIZE)       ? _UNDEF_STACK_SIZE       : 1024;
_IRQ_STACK_SIZE         = DEFINED(_IRQ_STACK_SIZE)         ? _IRQ_STACK_SIZE         : 1024;

MEMORY
{
   /* App lives in DDR above the FSBL/MMU page-table region. We reserve the
    * bottom 16 MB at 0x10000000 (DNN_DMA_POOL_BASE) and below for the
    * accelerator's DMA pool; app code/data sit above that. */
   ps7_ddr_0 : ORIGIN = 0x00100000, LENGTH = 0x0FF00000   /* 0x0010_0000..0x0FFF_FFFF (~255 MB) */
   ps7_ram_0 : ORIGIN = 0x00000000, LENGTH = 0x00030000   /* OCM low — vectors */
}

ENTRY(_vector_table)

SECTIONS
{
.vectors : {
   *(.vectors)
   *(.boot)
} > ps7_ddr_0

.text : {
   *(.text)
   *(.text.*)
   *(.gnu.linkonce.t.*)
   *(.plt)
   *(.gnu_warning)
   *(.gcc_except_table)
   *(.glue_7)
   *(.glue_7t)
   *(.vfp11_veneer)
   *(.ARM.extab)
   *(.gnu.linkonce.armextab.*)
} > ps7_ddr_0

.init : { KEEP (*(.init)) } > ps7_ddr_0
.fini : { KEEP (*(.fini)) } > ps7_ddr_0

.rodata : {
   __rodata_start = .;
   *(.rodata)
   *(.rodata.*)
   *(.gnu.linkonce.r.*)
   __rodata_end = .;
} > ps7_ddr_0

.rodata1 : {
   __rodata1_start = .;
   *(.rodata1)
   *(.rodata1.*)
   __rodata1_end = .;
} > ps7_ddr_0

.data : {
   . = ALIGN(4);
   __data_start = .;
   *(.data)
   *(.data.*)
   *(.gnu.linkonce.d.*)
   *(.jcr)
   *(.got)
   *(.got.plt)
   __data_end = .;
} > ps7_ddr_0

.got : { *(.got) } > ps7_ddr_0
.got1 : { *(.got1) } > ps7_ddr_0
.got2 : { *(.got2) } > ps7_ddr_0

.ctors : {
   __CTOR_LIST__ = .;
   ___CTORS_LIST___ = .;
   KEEP (*crtbegin.o(.ctors))
   KEEP (*(EXCLUDE_FILE(*crtend.o) .ctors))
   KEEP (*(SORT(.ctors.*)))
   KEEP (*(.ctors))
   __CTOR_END__ = .;
   ___CTORS_END___ = .;
} > ps7_ddr_0

.dtors : {
   __DTOR_LIST__ = .;
   ___DTORS_LIST___ = .;
   KEEP (*crtbegin.o(.dtors))
   KEEP (*(EXCLUDE_FILE(*crtend.o) .dtors))
   KEEP (*(SORT(.dtors.*)))
   KEEP (*(.dtors))
   __DTOR_END__ = .;
   ___DTORS_END___ = .;
} > ps7_ddr_0

.fixup : { __fixup_start = .; *(.fixup) __fixup_end = .; } > ps7_ddr_0
.eh_frame : { *(.eh_frame) } > ps7_ddr_0
.eh_framehdr : { __eh_framehdr_start = .; *(.eh_framehdr) __eh_framehdr_end = .; } > ps7_ddr_0
.gcc_except_table : { *(.gcc_except_table) } > ps7_ddr_0

.mmu_tbl (ALIGN(16384)) : {
   __mmu_tbl_start = .;
   *(.mmu_tbl)
   __mmu_tbl_end = .;
} > ps7_ddr_0

.ARM.exidx : {
   __exidx_start = .;
   *(.ARM.exidx*)
   *(.gnu.linkonce.armexidx.*)
   __exidx_end = .;
} > ps7_ddr_0

.preinit_array : {
   . = ALIGN(4);
   __preinit_array_start = .;
   KEEP (*(SORT(.preinit_array.*)))
   KEEP (*(.preinit_array))
   __preinit_array_end = .;
} > ps7_ddr_0

.init_array : {
   . = ALIGN(4);
   __init_array_start = .;
   KEEP (*(SORT(.init_array.*)))
   KEEP (*(.init_array))
   __init_array_end = .;
} > ps7_ddr_0

.fini_array : {
   . = ALIGN(4);
   __fini_array_start = .;
   KEEP (*(SORT(.fini_array.*)))
   KEEP (*(.fini_array))
   __fini_array_end = .;
} > ps7_ddr_0

.ARM.attributes : {
   __ARM.attributes_start = .;
   *(.ARM.attributes)
   __ARM.attributes_end = .;
} > ps7_ddr_0

.sdata : {
   . = ALIGN(4);
   __sdata_start = .;
   *(.sdata)
   *(.sdata.*)
   *(.gnu.linkonce.s.*)
   __sdata_end = .;
} > ps7_ddr_0

.sbss (NOLOAD) : {
   . = ALIGN(4);
   __sbss_start = .;
   *(.sbss)
   *(.sbss.*)
   *(.gnu.linkonce.sb.*)
   __sbss_end = .;
} > ps7_ddr_0

.tdata : {
   . = ALIGN(4);
   __tdata_start = .;
   *(.tdata)
   *(.tdata.*)
   *(.gnu.linkonce.td.*)
   __tdata_end = .;
} > ps7_ddr_0

.tbss : {
   . = ALIGN(4);
   __tbss_start = .;
   *(.tbss)
   *(.tbss.*)
   *(.gnu.linkonce.tb.*)
   __tbss_end = .;
} > ps7_ddr_0

.bss (NOLOAD) : {
   . = ALIGN(4);
   __bss_start = .;
   *(.bss)
   *(.bss.*)
   *(.gnu.linkonce.b.*)
   *(COMMON)
   . = ALIGN(4);
   __bss_end = .;
} > ps7_ddr_0

_SDA_BASE_ = __sdata_start + ((__sbss_end - __sdata_start) / 2 );
/* SDA2 not used on Cortex-A9 standalone */

/* Stack regions (one per CPU mode) */
.heap (NOLOAD) : {
   . = ALIGN(16);
   _heap = .;
   HeapBase = .;
   _heap_start = .;
   . += _HEAP_SIZE;
   _heap_end = .;
   HeapLimit = .;
} > ps7_ddr_0

.stack (NOLOAD) : {
   . = ALIGN(16);
   _stack_end = .;
   . += _STACK_SIZE;
   . = ALIGN(16);
   _stack = .;
   __stack = _stack;
   . = ALIGN(16);
   _irq_stack_end = .;
   . += _IRQ_STACK_SIZE;
   . = ALIGN(16);
   __irq_stack = .;
   _supervisor_stack_end = .;
   . += _SUPERVISOR_STACK_SIZE;
   . = ALIGN(16);
   __supervisor_stack = .;
   _abort_stack_end = .;
   . += _ABORT_STACK_SIZE;
   . = ALIGN(16);
   __abort_stack = .;
   _fiq_stack_end = .;
   . += _FIQ_STACK_SIZE;
   . = ALIGN(16);
   __fiq_stack = .;
   _undef_stack_end = .;
   . += _UNDEF_STACK_SIZE;
   . = ALIGN(16);
   __undef_stack = .;
} > ps7_ddr_0

_end = .;
}
