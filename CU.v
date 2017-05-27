`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2017 06:51:38 PM
// Design Name: 
// Module Name: CU
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


module CU(
	input clk, rst, enter, gte, counted, sorted,
	output done, mem_en, high_en, low_en, temp_en, stat_en,
	output [1:0] writemux
    );

reg [7:0] word;
reg [2:0] NS, CS;
parameter IDLE=3'b000, LOAD=3'b001, RUN=3'b010, COMP=3'b011, MOVE=3'b100, SWAP1=3'b101, SWAP2=3'b110, DONE=3'b111;
assign {mem_en, high_en, low_en, temp_en, stat_en, writemux, done} = word;

initial begin
	CS=IDLE;
	end

always@(rst, enter, gte, counted, sorted, clk) begin
	case(CS)
		IDLE: if(enter) NS=LOAD;
				else NS=IDLE;
		LOAD: if(counted) NS=RUN;
				else NS=LOAD;
		RUN: if (sorted) NS=DONE;
				else NS=COMP;
		COMP:if (gte) NS=MOVE;
				else NS=SWAP1;
		MOVE: if(counted) NS=RUN;
		        else NS=COMP;
		SWAP1: NS=SWAP2;
		SWAP2: if(counted) NS=RUN;
		        else NS=COMP;
		default:NS=IDLE;
	endcase
end

  always@(posedge clk, posedge rst) begin
    	if(rst) CS<=IDLE;
    	else CS<=NS;
    end

always@(CS) begin
case (CS)
	IDLE: word = 8'b11100_00_0;
	LOAD: word = 8'b11100_00_0;
	RUN:  word = 8'b00000_10_0;
	COMP: word = 8'b00001_10_0;
	MOVE: word = 8'b01101_10_0;
	SWAP1:word = 8'b11110_10_0;
	SWAP2:word = 8'b10001_01_0;
	DONE: word = 8'b00000_11_1;
endcase
end

endmodule
