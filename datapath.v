`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2017 05:29:16 PM
// Design Name: 
// Module Name: datapath
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


 module datapath(
	input mem_en, high_en, low_en, temp_en, stat_en, clk, rst,
	input [1:0] writemux,
	input [3:0] IN,
	output gte, counted, sorted,
	output [3:0] lowest, low, low_med, med, med_high, high, higher, highest 

    );
wire a, b, c, d, e, f, g, h;
wire [2:0] A, B;
wire [3:0] AA, AB, AC, AD, AE, AF, AG, AH, BA, BB, CA, DA;//Connections starting with A are for the lower mux
//connections starting with B are from the muxes to the comparator/datamux
//connections starting with C are from the temp register to the dataload mux
//connections starting with D are from the smallmux to the memory module

counter low_pointer(.clk(clk),.en(low_en),.rst(rst),.lc(A)); //the low counter
hcounter high_pointer(.clk(clk),.en(high_en),.rst(rst),.hc(B),.c(counted)); // the high counter
smallmux dataload(.zero(IN),.one(CA),.two(BB),.three(4'b000),.sel(writemux),.out(DA)); //mux which is before memory module
datamux LOW(.zero(AA),.one(AB),.two(AC),.three(AD),.four(AE),.five(AF),.six(AG),.seven(AH),.sel(A),.out(BA));
datamux HIGH(.zero(AA),.one(AB),.two(AC),.three(AD),.four(AE),.five(AF),.six(AG),.seven(AH),.sel(B),.out(BB));
comparator GTE(.low(BA),.high(BB),.gte(gte));
fourdreg temporary(.clk(clk),.en(temp_en),.rst(rst),.hold(BA),.out(CA));
drom DATA(.clk(clk),.we(mem_en),.wa(A),.wd(DA),.zero(AA),.one(AB),.two(AC),.three(AD),.four(AE),.five(AF),.six(AG),.seven(AH));
statreg STATUS(.clk(clk),.we(stat_en),.wa(B),.wd(gte),.zero(a),.one(b),.two(c),.three(d),.four(e),.five(f),.six(g),.seven(h));
sand LargeAND(.A(a),.B(b),.C(c),.D(d),.E(e),.F(f),.G(g),.H(h),.out(sorted));

assign lowest=AA;
assign low=AB;
assign low_med=AC;
assign med=AD;
assign med_high=AE;
assign high=AF;
assign higher=AG;
assign highest=AH;
endmodule
