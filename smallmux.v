//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Adam Sanchez
// 
// Create Date: 05/25/2017 04:23:13 PM
// Design Name: 
// Module Name: smallmux
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


module smallmux(
	input [3:0] zero, one, two, three,
	input [1:0] sel,
	output reg [3:0] out

    );

always@(*) begin
	case (sel)
		2'b00: out=zero;
		2'b01: out=one;
		2'b10: out=two;
		2'b11: out=three;
	endcase
end

endmodule
