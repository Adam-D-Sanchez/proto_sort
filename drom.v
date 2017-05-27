`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2017 05:00:49 PM
// Design Name: 
// Module Name: drom
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


module drom(
	input clk, we, 
	input [2:0] wa,
	input [3:0] wd,
	output [3:0] zero, one, two, three, four, five, six, seven

    );

reg [3:0] data[7:0];

always@(posedge clk) begin
	if (we) begin
		data[wa]<=wd;
	end
end

assign zero  = data[3'b000] ;
assign one   = data[3'b001] ;
assign two   = data[3'b010] ;
assign three = data[3'b011] ;
assign four  = data[3'b100] ;
assign five  = data[3'b101] ;
assign six   = data[3'b110] ;
assign seven = data[3'b111] ;
endmodule
