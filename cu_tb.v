`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2017 09:09:40 PM
// Design Name: 
// Module Name: cu_tb
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


module cu_tb(
    );

	reg tb_clk, tb_rst, tb_enter, tb_gte, tb_counted, tb_sorted;
	wire tb_done, tb_mem_en, tb_high_en, tb_low_en, tb_temp_en, tb_stat_en;
	wire [1:0] tb_writemux;

CU DUT(.clk(tb_clk),.rst(tb_rst),.enter(tb_enter),.gte(tb_gte),.counted(tb_counted),.sorted(tb_sorted),.mem_en(tb_mem_en),.high_en(tb_high_en),.low_en(tb_low_en),.temp_en(tb_temp_en),.stat_en(tb_stat_en),.done(tb_done),.writemux(tb_writemux));


task tick_tock;
	begin 
	#5;
	tb_clk=1;
	#5;
	tb_clk=0;
	end
	endtask


	initial begin
		tb_clk=0;
		tb_rst=10;
		tb_enter=1;
		tick_tock;//1
		tick_tock;//2
		tick_tock;//3
		tick_tock;//4
		tick_tock;//5
		tb_counted=0;
		tick_tock;//6
		tb_sorted=0;
		tb_gte=1;
		tick_tock;//7
		tb_counted=1;
		tick_tock;//8
		//Memory is now loaded.

		tb_counted=0;
		tick_tock;
		tick_tock;
		tick_tock;

		tb_gte=0;
		tick_tock;
		tick_tock;
		tick_tock;
		tick_tock;

		tb_counted=1;
		tb_sorted=1;
		tick_tock;
		tick_tock;


	end

endmodule
