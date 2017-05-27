`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2017 09:22:45 PM
// Design Name: 
// Module Name: sorter
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


module sorter(
	input clk, rst, enter,
    input [3:0] IN,
	output done, 
	output [3:0] LT, LO, LM, ME, MH, HI, HR, HT
    );

wire A,B,C; //gte, counted, sorted, done respectively
wire V,W,X,Y,Z; // mem_en, high_en, low_en, temp_en, stat_en respectively
wire [1:0] AA; //writemux

CU Controller(.clk(clk),.rst(rst),.enter(enter),.gte(A),.counted(B),.sorted(C),.mem_en(V),.high_en(W),.low_en(X),.temp_en(Y),.stat_en(Z),.done(done),.writemux(AA));
datapath Datapath(.clk(clk),.rst(rst),.gte(A),.counted(B),.sorted(C),.mem_en(V),.high_en(W),.low_en(X),.temp_en(Y),.stat_en(Z),.writemux(AA),.IN(IN),.lowest(LT), .low(LO), .low_med(LM), .med(ME), .med_high(MH), .high(HI), .higher(HR), .highest(HT));
endmodule
