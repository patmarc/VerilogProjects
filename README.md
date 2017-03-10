<h1>Verilog - Projects</h1>
This repository contains some small projects writing in Verilog, like parity generator,
frequency divider and receiver and transmitter rs232.

<h2>Parity Generator</h2>
How it works? 

The project was my task at my studies. This is the first exercise to be more familiar with Verilog. 
I had to design system generating parity bit from 8- bit word. The 8 - bit word was generating by switches 
set at FPGA Digilent Spartan-3. If there was parity word (for example: 2 from 8 switches are having active 
high state) at display we can see "E" like even otherwise we can see "O". The one of segments at display 
is activated by low state also like one of displays.
 
How do you launch it ?  

This project can have any number of bits that you need for your word,but you have to remember about 
changes in testbench. The testbench helps you with verification correct working.You can fit this system
to your needs changing parameters : N_SW , N_LED and N_LED_AN. 
To test this project at the FPGA board you need to create implementation constraints file (ucf). 

<h2>Frequency Divider</h2>
How it works? 

A frequency divider is a system that takes a frequency as input signal and generates also frequency, but
N times less. For example if you want to generate 1 kHz frequency signal from 50 kHz you need change 
N value to 50. 

How do you launch it?

Just as parity generator if you want to test this on FPGA board and see effects you have to create
an implementation constraints file and bring signal clk_out under one of LEDs at board.

<h2>RS - 232</h2>
How it works? 

RS-232 is a standard for serial communication transmission of data. This module comprise of
receiver and transmitter. After reading all bits by receiver the transmiter is activated. The data
is modified before transmition by adding 20h(If you wrote small letter you should receive the same 
bit letter). In the next step word goes to output and transmitting is synchronized with clock signal.
Transmition in standard RS-232 features :
- 1 start bit equal 0,
- 8 bits of data,
- 1 stop bit equal 1,
- no parity bit.

In this project there are simple basic input and output signals, only RXD, TXD and CLK of course.

<h2>Examplary code for Implementation Constraints file</h2>

NET "clk_in"   LOC = "T9" ;  # 50 MHz clock

NET "rxd_in"   LOC = "T13" ; # RS 232 RXD

NET "txd_out"  LOC = "R13" ; # RS 232 TXD








 
