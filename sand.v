`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2017 05:27:38 PM
// Design Name: 
// Module Name: sand
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


module sand(
input A, B, C, D, E, F, G, H,
output reg out

    );

always@(*) begin
out=(A&B&C&D&E&F&G&H);
end
endmodule
