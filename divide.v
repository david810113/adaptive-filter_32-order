`timescale 1ns/1ps
module divdiv ( dividend, divisor,div_state, clk, rstn, enable, result);

input	[31:0] dividend;
input	[31:0] divisor;
input	clk;
input	rstn;
input	enable;
output reg div_state;
output	reg[13:0]result;

/////////////////////////////////////////////////////////
// result = dividend / divisor
//
// If input bus width is 32 bits, clk needs 32 cycles
// inputing data while enable = 0
// Calculating while enable = 1
// Keeping result while enable = 0 
// This source code is proveded by kuiliang 2017/10/17
///////////////////////////////////////////////////////

reg [31:0]temp, counter;
reg [13:0]result_pre;
always@(posedge clk or negedge rstn)
begin
	if (!rstn) 
		temp <=  32'd0;
	else if (enable && (temp > divisor) )
		temp <=  temp - divisor;
	else if (enable)
		temp <=  temp;
	else
		temp <=  dividend;
end

always@(posedge clk or negedge rstn)
begin
	if (!rstn) 
		counter <=  32'd0;
	else if (enable && (temp > divisor) )
		counter <=  counter + 32'd1;
	else if (enable)
		counter <=  counter;
	else
		counter <=  32'd0;
end

always@(posedge clk or negedge rstn)
begin
	if (!rstn) 
		result_pre <=  14'd0;
	else if ( enable )
		result_pre <=  counter;
	else 
		result_pre <=  result_pre;
end

always@(posedge clk or negedge rstn)
begin
	if (!rstn) 
		div_state <=  1'b0;
	else if (temp <divisor)
		div_state <=  1'b1;
	else 
		div_state <=  1'b0;
end

always@(posedge clk or negedge rstn)
begin
	if (!rstn) 
		result <=  14'b0;
	else if (div_state==1)
		result <=  result_pre;
	else 
		result <=  result;
end


//assign result =(div_state==1)?result_pre:result;
//assign div_state = (temp <divisor)? 1'b1:1'b0;
endmodule
