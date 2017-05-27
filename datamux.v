//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Adam Sanchez
// 
// Create Date: 05/25/2017 04:23:13 PM
// Design Name: 
// Module Name: datamux
// Project Name: proto_sort
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


module datamux(
	input [3:0] zero, one, two, three, four, five, six, seven,
	input [2:0] sel,
	output reg [3:0] out

    );

always@(*) begin
	case (sel)
		3'b000: out=zero;
		3'b001: out=one;
		3'b010: out=two;
		3'b011: out=three;
		3'b100: out=four;
		3'b101: out=five;
		3'b110: out=six;
		3'b111: out=seven;
	endcase
end

endmodule
