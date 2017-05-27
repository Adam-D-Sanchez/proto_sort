`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2017 04:33:01 PM
// Design Name: 
// Module Name: fourdreg
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


module fourdreg(
	input clk, en, rst,
	input [3:0] hold,
	output reg [3:0] out

    );

always@(posedge clk, posedge rst) begin
	if(rst) begin
		out<=4'b0000;
	end else
	if(en) begin
		out<=hold;
	end else 
	out<=out;
end
endmodule
