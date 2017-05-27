`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2017 09:40:09 PM
// Design Name: 
// Module Name: testbench
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


module testbench(

    );

reg tb_clk, tb_rst, tb_enter;
reg [3:0] tb_IN;
wire tb_done;
wire [3:0] tb_LT, tb_LO, tb_LM, tb_ME, tb_MH, tb_HI, tb_HR, tb_HT;
integer A, B, C, D, E, F, G, H;


sorter DUT(.clk(tb_clk),.rst(tb_rst),.enter(tb_enter),.IN(tb_IN),.done(tb_done),.LT(tb_LT),.LO(tb_LO),.LM(tb_LM),.ME(tb_ME),.MH(tb_MH),.HI(tb_HI),.HR(tb_HR),.HT(tb_HT));

task tick_tock;
	begin 
	#5;
	tb_clk=1;
	#5;
	tb_clk=0;
	end
	endtask

initial begin
		tb_enter=1;
		tb_IN=4'b0111;
	tick_tock;
		tb_IN=4'b0001;
		tb_enter=0;
	tick_tock;
		tb_IN=4'b0000;
	tick_tock;
		tb_IN=4'b1111;
	tick_tock;
		tb_IN=4'b0101;
	tick_tock;
		tb_IN=4'b1010;
	tick_tock;
		tb_IN=4'b1110;
	tick_tock;
		tb_IN=4'b0110;
	while(!tb_done) begin
		tick_tock;
	end
	A=tb_LT;
	B=tb_LO;
	C=tb_LM;
	D=tb_ME;
	E=tb_MH;
	F=tb_HI;
	G=tb_HR;
	H=tb_HT;

	$display("The sorted numbers are %d, %d, %d, %d, %d, %d, %d, and %d.", A, B, C, D, E, F, G, H);
	$finish;

end



endmodule
