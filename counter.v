`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2017 04:31:39 PM
// Design Name: 
// Module Name: counter
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


module counter(
	input clk, en, rst, 
	output reg [2:0] lc
    );
initial begin
	lc=3'b000;
end
always@(posedge clk,posedge rst) begin
	if (rst) begin
		lc<=3'b000;
	end else 
	if (en) begin
		lc<=lc+3'b001;
	end else begin
		lc<=lc;
	end

end
endmodule
