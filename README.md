# W65C02_Board
Ben Eater board with Nick's G-Pascal Compiler

![board](images/proto.jpg "Main board")

Press the green NMI button on start-up
```console
G-Pascal compiler, version 4.07.
Written by Nick Gammon.
Type H for help.
:
```
---

## Features :

- W65C02 microcontroller with Nick Gammon G-Pascal ROM ;
- 32 KiB EPROM for G-Pascal ;
- 28 KiB RAM ;
- Integrated VIA 6522 ;
- ORIC-1 compatible expansion connector;
- Address decoding with a GAL22V10;
- USB serial interface with FTDI232 module.
- Gerber file available


- The GAL JED file is generated using the utility [GALasm](https://github.com/daveho/GALasm) under linux.
- the programmer used is a [XGECU - pro](https://www.aliexpress.com/premium/XGecu.html)
- It is capable of programming AT89S52, E(E)PROMs, and Lattice GAL22V10.
---
## CPU straps :

For W65C02 microcontroller :
- J7  : open
- J11 : short
- J2  : open
- J3  : short

For MOS 6502 microcontroller (No compatibility with G-Pascal ROM):
- J7  : short
- J11 : open
- J2  : short
- J3  : open
---
## ROM Configutration :

In gpascal.asm HIGHEST_RAM is $6FFF
So gpascal_0x6fff.bin was generated for the 27c256 EPROM

```console
;
;  CONFIGURATION
;
CLOCK_RATE   = 1000000   ; 1 Mhz
START_OF_ROM = $8000     ; where the ROM chip starts
HIGHEST_RAM  = $6FFF    ; with GAL22V10
```
---
## Peripheral Address :

| Peripheral | start address | end address |
| ------ | ------ | ------ |
| RAM | #0000 | #6FFF |
| EPROM (27C256) | #8000 | #FFFF |
| EEPROM (28C64) | #8000 | #9FFF |
| VIA | #7FF0 | #7FFF |
| IO1 | #7FE0 | #7FEF |
| IO2 | #7FD0 | #7FDF |
| IO3 | #7FC0 | #7FCF |
| IO4 | #7FB0 | #7FBF |

---
## hardware

![board](images/proto.png "board")

# Original Schématics

![original](images/proto.png "board")

# Dedicated ports on the via 6522

![mappings](images/mappings.png "mappings")

---
# Schematics with Nick's modifications

![schematicscpu](schematics/CPU_VIA.png "schematics CPU")

![schematicsramrom](schematics/RAM_ROM.png "schematics RAM ROM")

---
## Few programs examples (autobaud, but test with 9600 bauds)

[interactive demo](demo/README.md)
---
## Usefull links

- Nickgammon [G-Pascal](https://github.com/nickgammon/G-Pascal/tree/master)

- Ben Eater [Build a 6502 computer](https://eater.net/)
---
```console
G-Pascal compiler, version 4.07.
Written by Nick Gammon.
Type H for help.
: h

Available actions:

Delete      line_number_range
Insert/LOad after_line
Find        line_number_range /target/flags
List/SAve   line_number_range
Replace     line_number_range /target/replacement/flags
RECover
---
Help
INFo
Memory      first_address last_address
Assemble
Compile/Syntax
DEBug/Trace
LIBrary
Poke/Jsr/JMp
RUn
RESume
(Actions may be abbreviated)
(Flags: 'I'gnore case, 'G'lobal, 'Q'uiet)
:
```



