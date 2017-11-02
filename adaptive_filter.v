`timescale 1ns/1ps
module adaptive_filter(adap_filter_state, rstn, clk, reff_0, reff_1, reff_2, reff_3, reff_4, reff_5, reff_6, reff_7, reff_8, reff_9, reff_10, reff_11, reff_12, reff_13, reff_14, reff_15, reff_16, reff_17, reff_18, reff_19, reff_20, reff_21, reff_22, reff_23, reff_24, reff_25, reff_26, reff_27, reff_28, reff_29, reff_30, reff_31, reff_32, buffer_in_0, buffer_in_1, buffer_in_2, buffer_in_3, buffer_in_4, buffer_in_5, buffer_in_6, buffer_in_7, buffer_in_8, buffer_in_9, buffer_in_10, buffer_in_11, buffer_in_12, buffer_in_13, buffer_in_14, buffer_in_15, buffer_in_16, buffer_in_17, buffer_in_18, buffer_in_19, buffer_in_20, buffer_in_21, buffer_in_22, buffer_in_23, buffer_in_24, buffer_in_25, buffer_in_26, buffer_in_27, buffer_in_28, buffer_in_29, buffer_in_30, buffer_in_31, buffer_in_32, weight_in_0, weight_in_1, weight_in_2, weight_in_3, weight_in_4, weight_in_5, weight_in_6, weight_in_7, weight_in_8, weight_in_9, weight_in_10, weight_in_11, weight_in_12, weight_in_13, weight_in_14, weight_in_15, weight_in_16, weight_in_17, weight_in_18, weight_in_19, weight_in_20, weight_in_21, weight_in_22, weight_in_23, weight_in_24, weight_in_25, weight_in_26, weight_in_27, weight_in_28, weight_in_29, weight_in_30, weight_in_31, d, e);
input rstn, clk, adap_filter_state;

input [13:0] reff_0;
input [13:0] reff_1;
input [13:0] reff_2;
input [13:0] reff_3;
input [13:0] reff_4;
input [13:0] reff_5;
input [13:0] reff_6;
input [13:0] reff_7;
input [13:0] reff_8;
input [13:0] reff_9;
input [13:0] reff_10;
input [13:0] reff_11;
input [13:0] reff_12;
input [13:0] reff_13;
input [13:0] reff_14;
input [13:0] reff_15;
input [13:0] reff_16;
input [13:0] reff_17;
input [13:0] reff_18;
input [13:0] reff_19;
input [13:0] reff_20;
input [13:0] reff_21;
input [13:0] reff_22;
input [13:0] reff_23;
input [13:0] reff_24;
input [13:0] reff_25;
input [13:0] reff_26;
input [13:0] reff_27;
input [13:0] reff_28;
input [13:0] reff_29;
input [13:0] reff_30;
input [13:0] reff_31;
input [13:0] reff_32;

input [13:0] buffer_in_0;
input [13:0] buffer_in_1;
input [13:0] buffer_in_2;
input [13:0] buffer_in_3;
input [13:0] buffer_in_4;
input [13:0] buffer_in_5;
input [13:0] buffer_in_6;
input [13:0] buffer_in_7;
input [13:0] buffer_in_8;
input [13:0] buffer_in_9;
input [13:0] buffer_in_10;
input [13:0] buffer_in_11;
input [13:0] buffer_in_12;
input [13:0] buffer_in_13;
input [13:0] buffer_in_14;
input [13:0] buffer_in_15;
input [13:0] buffer_in_16;
input [13:0] buffer_in_17;
input [13:0] buffer_in_18;
input [13:0] buffer_in_19;
input [13:0] buffer_in_20;
input [13:0] buffer_in_21;
input [13:0] buffer_in_22;
input [13:0] buffer_in_23;
input [13:0] buffer_in_24;
input [13:0] buffer_in_25;
input [13:0] buffer_in_26;
input [13:0] buffer_in_27;
input [13:0] buffer_in_28;
input [13:0] buffer_in_29;
input [13:0] buffer_in_30;
input [13:0] buffer_in_31;
input [13:0] buffer_in_32;

input [31:0] weight_in_0;
input [31:0] weight_in_1;
input [31:0] weight_in_2;
input [31:0] weight_in_3;
input [31:0] weight_in_4;
input [31:0] weight_in_5;
input [31:0] weight_in_6;
input [31:0] weight_in_7;
input [31:0] weight_in_8;
input [31:0] weight_in_9;
input [31:0] weight_in_10;
input [31:0] weight_in_11;
input [31:0] weight_in_12;
input [31:0] weight_in_13;
input [31:0] weight_in_14;
input [31:0] weight_in_15;
input [31:0] weight_in_16;
input [31:0] weight_in_17;
input [31:0] weight_in_18;
input [31:0] weight_in_19;
input [31:0] weight_in_20;
input [31:0] weight_in_21;
input [31:0] weight_in_22;
input [31:0] weight_in_23;
input [31:0] weight_in_24;
input [31:0] weight_in_25;
input [31:0] weight_in_26;
input [31:0] weight_in_27;
input [31:0] weight_in_28;
input [31:0] weight_in_29;
input [31:0] weight_in_30;
input [31:0] weight_in_31;


output reg [13:0] e;   
output [13:0] d ;   
wire [13:0] d;
reg [31:0] dreg;
reg [31:0] rreg;
reg [5:0]counter;


//********************** Counter ***********************//

always@(posedge clk or negedge rstn)
begin
if (rstn == 0)
	counter <=    6'd0;
else if (adap_filter_state == 1'b0)
	counter <=    6'd0;	
else if (counter == 6'd33)
	counter <=   counter;
else
	counter <=   counter + 1'd1;
end

wire div_state;
wire flag_15;
wire flag_n;
reg flag_16;
assign flag_15 = (counter == 6'd32) ? 1'd1 : 1'd0;
assign flag_n =|buffer_in_32;

always@(posedge clk or negedge rstn)
begin
if (rstn == 0)
	flag_16 <=   1'd0;
	
else
	flag_16 <=   flag_15;
end


//wire flag_15;
//assign flag_15 = (counter == 5'd15) ? 1'd1 : 1'd0;

//********************** MUX ***********************//	
wire [13:0] reff;
wire [31:0] weight_in;
/*
always@(posedge clk or negedge rstn)
if (rstn == 0)
	reff = 14'b0;
else if (counter == 5'd0)
	reff = buffer_in_32;
else if (counter == 5'd1)
	reff = buffer_in_31;
else if (counter == 5'd2)
	reff = buffer_in_30;
else if (counter == 5'd3)
	reff = buffer_in_29;
else if (counter == 5'd4)
	reff = buffer_in_28;
else if (counter == 5'd5)
	reff = buffer_in_27;
else if (counter == 5'd6)
	reff = buffer_in_26;
else if (counter == 5'd7)
	reff = buffer_in_25;
else if (counter == 5'd8)
	reff = buffer_in_24;
else if (counter == 5'd9)
	reff = buffer_in_23;
else if (counter == 5'd10)
	reff = buffer_in_22;
else if (counter == 5'd11)
	reff = buffer_in_21;
else if (counter == 5'd12)
	reff = buffer_in_20;
else if (counter == 5'd13)
	reff = buffer_in_19;
else if (counter == 5'd14)
	reff = buffer_in_18;
else if (counter == 5'd15)
	reff = buffer_in_17;
else if (counter == 5'd16)
	reff = buffer_in_16;
else if (counter == 5'd17)
	reff = buffer_in_15;
else if (counter == 5'd18)
	reff = buffer_in_14;
else if (counter == 5'd19)
	reff = buffer_in_13;
else if (counter == 5'd20)
	reff = buffer_in_12;
else if (counter == 5'd21)
	reff = buffer_in_11;
else if (counter == 5'd22)
	reff = buffer_in_10;
else if (counter == 5'd23)
	reff = buffer_in_9;
else if (counter == 5'd24)
	reff = buffer_in_8;
else if (counter == 5'd25)
	reff = buffer_in_7;
else if (counter == 5'd26)
	reff = buffer_in_6;
else if (counter == 5'd27)
	reff = buffer_in_5;
else if (counter == 5'd28)
	reff = buffer_in_4;
else if (counter == 5'd29)
	reff = buffer_in_3;
else if (counter == 5'd30)
	reff = buffer_in_2;
else if (counter == 5'd31)
	reff = buffer_in_1;
else
	reff = reff;
end
*/
	
assign reff =   {14{(counter == 5'd0)}} & buffer_in_32 |
		{14{(counter == 5'd1)}} & buffer_in_31 |
		{14{(counter == 5'd2)}} & buffer_in_30 |		
		{14{(counter == 5'd3)}} & buffer_in_29 |
		{14{(counter == 5'd4)}} & buffer_in_28 |
		{14{(counter == 5'd5)}} & buffer_in_27 |		
		{14{(counter == 5'd6)}} & buffer_in_26 |	
		{14{(counter == 5'd7)}} & buffer_in_25 |
		{14{(counter == 5'd8)}} & buffer_in_24 |		
		{14{(counter == 5'd9)}} & buffer_in_23 |
		{14{(counter == 5'd10)}} & buffer_in_22 |
		{14{(counter == 5'd11)}} & buffer_in_21 |		
		{14{(counter == 5'd12)}} & buffer_in_20 |			
		{14{(counter == 5'd13)}} & buffer_in_19 |
		{14{(counter == 5'd14)}} & buffer_in_18 |
		{14{(counter == 5'd15)}} & buffer_in_17 |
		{14{(counter == 5'd16)}} & buffer_in_16 |
		{14{(counter == 5'd17)}} & buffer_in_15 |		
		{14{(counter == 5'd18)}} & buffer_in_14 |
		{14{(counter == 5'd19)}} & buffer_in_13 |
		{14{(counter == 5'd20)}} & buffer_in_12 |		
		{14{(counter == 5'd21)}} & buffer_in_11 |	
		{14{(counter == 5'd22)}} & buffer_in_10 |
		{14{(counter == 5'd23)}} & buffer_in_9 |		
		{14{(counter == 5'd24)}} & buffer_in_8 |
		{14{(counter == 5'd25)}} & buffer_in_7 |
		{14{(counter == 5'd26)}} & buffer_in_6 |		
		{14{(counter == 5'd27)}} & buffer_in_5 |			
		{14{(counter == 5'd28)}} & buffer_in_4 |
		{14{(counter == 5'd29)}} & buffer_in_3 |
		{14{(counter == 5'd30)}} & buffer_in_2 |
		{14{(counter == 5'd31)}} & buffer_in_1;
		
assign weight_in ={32{(counter == 5'd0)}} & weight_in_31 |
			{32{(counter == 5'd1)}} & weight_in_30 |
			{32{(counter == 5'd2)}} & weight_in_29 |		
			{32{(counter == 5'd3)}} & weight_in_28 |
			{32{(counter == 5'd4)}} & weight_in_27 |
			{32{(counter == 5'd5)}} & weight_in_26 |		
			{32{(counter == 5'd6)}} & weight_in_25 |	
			{32{(counter == 5'd7)}} & weight_in_24 |
			{32{(counter == 5'd8)}} & weight_in_23 |		
			{32{(counter == 5'd9)}} & weight_in_22 |
			{32{(counter == 5'd10)}} & weight_in_21 |
			{32{(counter == 5'd11)}} & weight_in_20 |		
			{32{(counter == 5'd12)}} & weight_in_19 |			
			{32{(counter == 5'd13)}} & weight_in_18 |
			{32{(counter == 5'd14)}} & weight_in_17 |		
			{32{(counter == 5'd15)}} & weight_in_16 |
			{32{(counter == 5'd16)}} & weight_in_15 |
			{32{(counter == 5'd17)}} & weight_in_14 |		
			{32{(counter == 5'd18)}} & weight_in_13 |
			{32{(counter == 5'd19)}} & weight_in_12 |
			{32{(counter == 5'd20)}} & weight_in_11 |		
			{32{(counter == 5'd21)}} & weight_in_10 |	
			{32{(counter == 5'd22)}} & weight_in_9 |
			{32{(counter == 5'd23)}} & weight_in_8 |		
			{32{(counter == 5'd24)}} & weight_in_7 |
			{32{(counter == 5'd25)}} & weight_in_6 |
			{32{(counter == 5'd26)}} & weight_in_5 |		
			{32{(counter == 5'd27)}} & weight_in_4 |			
			{32{(counter == 5'd28)}} & weight_in_3 |
			{32{(counter == 5'd29)}} & weight_in_2 |		
			{32{(counter == 5'd30)}} & weight_in_1 |
			{32{(counter == 5'd31)}} & weight_in_0;		
			

//********************** DSP ***********************//
reg [45:0] multiple;
reg [31:0] nref;
reg [31:0] n;
reg [31:0] d_sum;
wire counter_flag;
/*
assign multiple = weight_in * {18'd0, reff};
assign dsp_result = dreg + multiple[39:27];

*/
//assign counter_flag = ~(&counter);//0~14


always@(posedge clk or negedge rstn)
begin
if (rstn == 0)
	multiple <=   45'd0;
else if (adap_filter_state == 1'b0)
	multiple <=   45'd0;
else if (counter<6'd32)
	multiple <=   weight_in * {17'd0, reff};
else
	multiple <=   multiple;
end


always@(posedge clk or negedge rstn)
begin
if (rstn == 0)
	dreg <=   32'd0;
else if (adap_filter_state == 1'b1 && counter<6'd33)
	dreg <=   dreg + multiple[45:5];
else if (adap_filter_state == 1'b0)
	dreg <=   32'd0;
else
	dreg <=   dreg;
end


always@(posedge clk or negedge rstn)
begin
if (rstn == 0)
	nref <=   32'd0;
else if (adap_filter_state == 1'b0)
	nref <=   32'd0;
else if (counter<6'd32)
	nref <=  {17'd0, reff} * {17'd0, reff};
else
	nref <=   nref;
end


always@(posedge clk or negedge rstn)
begin
if (rstn == 0)
	rreg <=   32'd0;
else if (adap_filter_state == 1'b0)
	rreg <=   32'd0;
else if (adap_filter_state == 1'b1 && counter<6'd33)
	rreg <=   rreg + nref ;
else
	rreg <=   rreg;
end


always@(posedge clk or negedge rstn)
begin
if(rstn==0)
	n <= 14'd0;	
else if (counter == 6'd32&&flag_15==1&&flag_n==1)
	n <=   rreg + nref;
else
	n <=  n;
end

always@(posedge clk or negedge rstn)
begin
if(rstn==0)
	d_sum <= 14'd0;	
else if (counter == 6'd32&&flag_15==1&&flag_n==1)
	d_sum <=   dreg + multiple[45:5];
else
	d_sum <=  d_sum;
end

always@(posedge clk or negedge rstn)
begin
if (rstn == 0)
	e <=   14'd0;
else if (div_state == 1'b1 && adap_filter_state == 1'b1 && counter == 6'd33 && d[13] == 0)
	e <=   reff_31 - d;	
else if (div_state == 1'b1 && adap_filter_state == 1'b1 && counter == 6'd33 && d[13] == 1)
	e <=   reff_31 + d;	
else
	e <=   e;

end


divdiv divdiv_1(.dividend(d_sum), .divisor(n),.div_state(div_state) ,.clk(clk), .rstn(rstn), .enable(~flag_16&flag_n), .result(d));

    
endmodule

