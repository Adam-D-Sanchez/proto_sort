`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2017 04:57:45 PM
// Design Name: 
// Module Name: hcounter
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


module hcounter(
input clk, en, rst, 
	output reg [2:0] hc,
	output reg c
    );
initial begin
	hc=3'b001;
end
always@(posedge clk,posedge rst) begin
	if (rst) begin
		hc<=3'b001;
	end else 
	if (en) begin
		hc<=hc+3'b001;
	end else begin
		hc<=hc;
	end
end

always@(hc) begin
	if (hc==3'b000) begin
		c=1'b1;
	end else c=1'b0;
end


endmodule
