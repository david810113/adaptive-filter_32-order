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
else if (counter == 6'd34)
	counter <=   counter;
else
	counter <=   counter + 1'd1;
end

wire div_state;
wire flag_15;
wire flag_n;
reg flag_16;
assign flag_15 = (counter == 6'd33) ? 1'd1 : 1'd0;
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

/*	
reg [31:0]counter_dly;	
	always@(posedge clk or negedge rstn)
	begin
	if (rstn == 0)
		counter+dly <=    6'd0;
	else if (adap_filter_state == 1'b0)
		counter_dly <= 32'd0;	
	else
		counter_dly <= {counter_dly[30:0],adap_filter_state};
	end

	
wire [31:0]pipeline_sel;
	assgin pipeline_sel[0] = counter_dly[0] & ~counter_dly[1];
	assgin pipeline_sel[1] = counter_dly[1] & ~counter_dly[2];
	assgin pipeline_sel[2] = counter_dly[2] & ~counter_dly[3];
	assgin pipeline_sel[3] = counter_dly[3] & ~counter_dly[4];
	assgin pipeline_sel[4] = counter_dly[4] & ~counter_dly[5];
	assgin pipeline_sel[5] = counter_dly[5] & ~counter_dly[6];
	assgin pipeline_sel[6] = counter_dly[6] & ~counter_dly[7];
	assgin pipeline_sel[7] = counter_dly[7] & ~counter_dly[8];	
	assgin pipeline_sel[8] = counter_dly[8] & ~counter_dly[9];
	assgin pipeline_sel[9] = counter_dly[9] & ~counter_dly[10];
	assgin pipeline_sel[10] = counter_dly[10] & ~counter_dly[11];
	assgin pipeline_sel[11] = counter_dly[11] & ~counter_dly[12];
	assgin pipeline_sel[12] = counter_dly[12] & ~counter_dly[13];
	assgin pipeline_sel[13] = counter_dly[13] & ~counter_dly[14];
	assgin pipeline_sel[14] = counter_dly[14] & ~counter_dly[15];
	assgin pipeline_sel[15] = counter_dly[15] & ~counter_dly[16];		
	assgin pipeline_sel[16] = counter_dly[16] & ~counter_dly[17];
	assgin pipeline_sel[17] = counter_dly[17] & ~counter_dly[18];
	assgin pipeline_sel[18] = counter_dly[18] & ~counter_dly[19];
	assgin pipeline_sel[19] = counter_dly[19] & ~counter_dly[20];
	assgin pipeline_sel[20] = counter_dly[20] & ~counter_dly[21];
	assgin pipeline_sel[21] = counter_dly[21] & ~counter_dly[22];
	assgin pipeline_sel[22] = counter_dly[22] & ~counter_dly[23];
	assgin pipeline_sel[23] = counter_dly[23] & ~counter_dly[24];	
	assgin pipeline_sel[24] = counter_dly[24] & ~counter_dly[25];
	assgin pipeline_sel[25] = counter_dly[25] & ~counter_dly[26];
	assgin pipeline_sel[26] = counter_dly[26] & ~counter_dly[27];
	assgin pipeline_sel[27] = counter_dly[27] & ~counter_dly[28];
	assgin pipeline_sel[28] = counter_dly[28] & ~counter_dly[29];
	assgin pipeline_sel[29] = counter_dly[29] & ~counter_dly[30];
	assgin pipeline_sel[30] = counter_dly[30] & ~counter_dly[31];
	assgin pipeline_sel[31] = counter_dly[31] & ~counter_dly[32];	


assign reff =   (14{pipeline_sel[0]}) & buffer_in_32 |
		(14{pipeline_sel[1]}) & buffer_in_31 |
		(14{pipeline_sel[2]}) & buffer_in_30 |		
		(14{pipeline_sel[3]}) & buffer_in_29 |
		(14{pipeline_sel[4]}) & buffer_in_28 |
		(14{pipeline_sel[5]}) & buffer_in_27 |		
		(14{pipeline_sel[6]}) & buffer_in_26 |	
		(14{pipeline_sel[7]}) & buffer_in_25 |
		(14{pipeline_sel[8]}) & buffer_in_24 |		
		(14{pipeline_sel[9]}) & buffer_in_23 |
		(14{pipeline_sel[10]}) & buffer_in_22 |
		(14{pipeline_sel[11]}) & buffer_in_21 |		
		(14{pipeline_sel[12]}) & buffer_in_20 |			
		(14{pipeline_sel[13]}) & buffer_in_19 |
		(14{pipeline_sel[14]}) & buffer_in_18 |
		(14{pipeline_sel[15]}) & buffer_in_17 |
		(14{pipeline_sel[16]}) & buffer_in_16 |
		(14{pipeline_sel[17]}) & buffer_in_15 |		
		(14{pipeline_sel[18]}) & buffer_in_14 |
		(14{pipeline_sel[19]}) & buffer_in_13 |
		(14{pipeline_sel[20]}) & buffer_in_12 |		
		(14{pipeline_sel[21]}) & buffer_in_11 |	
		(14{pipeline_sel[22]}) & buffer_in_10 |
		(14{pipeline_sel[23]}) & buffer_in_9 |		
		(14{pipeline_sel[24]}) & buffer_in_8 |
		(14{pipeline_sel[25]}) & buffer_in_7 |
		(14{pipeline_sel[26]}) & buffer_in_6 |		
		(14{pipeline_sel[27]}) & buffer_in_5 |			
		(14{pipeline_sel[28]}) & buffer_in_4 |
		(14{pipeline_sel[29]}) & buffer_in_3 |
		(14{pipeline_sel[30]}) & buffer_in_2 |
		(14{pipeline_sel[31]}) & buffer_in_1;
		
assign weight_in =(32{pipeline_sel[0]}) & weight_in_31 |
			(32{pipeline_sel[1]}) & weight_in_30 |
			(32{pipeline_sel[2]}) & weight_in_29 |		
			(32{pipeline_sel[3]}) & weight_in_28 |
			(32{pipeline_sel[4]}) & weight_in_27 |
			(32{pipeline_sel[5]}) & weight_in_26 |		
			(32{pipeline_sel[6]}) & weight_in_25 |	
			(32{pipeline_sel[7]}) & weight_in_24 |
			(32{pipeline_sel[8]}) & weight_in_23 |		
			(32{pipeline_sel[9]}) & weight_in_22 |
			(32{pipeline_sel[10]}) & weight_in_21 |
			(32{pipeline_sel[11]}) & weight_in_20 |		
			(32{pipeline_sel[12]}) & weight_in_19 |			
			(32{pipeline_sel[13]}) & weight_in_18 |
			(32{pipeline_sel[14]}) & weight_in_17 |		
			(32{pipeline_sel[15]}) & weight_in_16 |
			(32{pipeline_sel[16]}) & weight_in_15 |
			(32{pipeline_sel[17]}) & weight_in_14 |		
			(32{pipeline_sel[18]}) & weight_in_13 |
			(32{pipeline_sel[19]}) & weight_in_12 |
			(32{pipeline_sel[20]}) & weight_in_11 |		
			(32{pipeline_sel[21]}) & weight_in_10 |	
			(32{pipeline_sel[22]}) & weight_in_9 |
			(32{pipeline_sel[23]}) & weight_in_8 |		
			(32{pipeline_sel[24]}) & weight_in_7 |
			(32{pipeline_sel[25]}) & weight_in_6 |
			(32{pipeline_sel[26]}) & weight_in_5 |		
			(32{pipeline_sel[27]}) & weight_in_4 |			
			(32{pipeline_sel[28]}) & weight_in_3 |
			(32{pipeline_sel[29]}) & weight_in_2 |		
			(32{pipeline_sel[30]}) & weight_in_1 |
			(32{pipeline_sel[31]}) & weight_in_0;		
*/			
	
reg [13:0] reff;
	always@(posedge clk or negedge rstn)
	begin
	if (rstn == 0)
		reff <=    14'd1;
	else	
		case (counter)//synopsys full case parallel case
		6'd0      :	reff <=  buffer_in_32;
		6'd1      :	reff <=  buffer_in_31;
		6'd2      :	reff <=  buffer_in_30;
		6'd3      :	reff <=  buffer_in_29;
		6'd4      :	reff <=  buffer_in_28;
		6'd5      :	reff <=  buffer_in_27;
		6'd6      :	reff <=  buffer_in_26;
		6'd7      :	reff <=  buffer_in_25;
		6'd8      :	reff <=  buffer_in_24;
		6'd9      :	reff <=  buffer_in_23;
		6'd10      :	reff <=  buffer_in_22;
		6'd11      :	reff <=  buffer_in_21;
		6'd12      :	reff <=  buffer_in_20;
		6'd13      :	reff <=  buffer_in_19;
		6'd14      :	reff <=  buffer_in_18;
		6'd15      :	reff <=  buffer_in_17;
		6'd16      :	reff <=  buffer_in_16;
		6'd17      :	reff <=  buffer_in_15;
		6'd18      :	reff <=  buffer_in_14;
		6'd19      :	reff <=  buffer_in_13;
		6'd20      :	reff <=  buffer_in_12;
		6'd21      :	reff <=  buffer_in_11;
		6'd22      :	reff <=  buffer_in_10;
		6'd23      :	reff <=  buffer_in_9;
		6'd24      :	reff <=  buffer_in_8;
		6'd25      :	reff <=  buffer_in_7;
		6'd26      :	reff <=  buffer_in_6;
		6'd27      :	reff <=  buffer_in_5;
		6'd28      :	reff <=  buffer_in_4;
		6'd29      :	reff <=  buffer_in_3;
		6'd30      :	reff <=  buffer_in_2;
		6'd31      :	reff <=  buffer_in_1;
		default	   :	reff <=  14'd1;
	end	
			
reg [31:0] weight_in;	
	always@(posedge clk or negedge rstn)
	begin
	if (rstn == 0)
		weight_in <=    32'd1;
	else	
		case (counter)//synopsys full case parallel case
		6'd0      :	weight_in <= weight_in_31;
		6'd1      :	weight_in <= weight_in_30;
		6'd2      :	weight_in <= weight_in_29;
		6'd3      :	weight_in <= weight_in_28;
		6'd4      :	weight_in <= weight_in_27;
		6'd5      :	weight_in <= weight_in_26;
		6'd6      :	weight_in <= weight_in_25;
		6'd7      :	weight_in <= weight_in_24;
		6'd8      :	weight_in <= weight_in_23;
		6'd9      :	weight_in <= weight_in_22;
		6'd10      :	weight_in <= weight_in_21;
		6'd11      :	weight_in <= weight_in_20;
		6'd12      :	weight_in <= weight_in_19;
		6'd13      :	weight_in <= weight_in_18;
		6'd14      :	weight_in <= weight_in_17;
		6'd15      :	weight_in <= weight_in_16;
		6'd16      :	weight_in <= weight_in_15;
		6'd17      :	weight_in <= weight_in_14;
		6'd18      :	weight_in <= weight_in_13;
		6'd19      :	weight_in <= weight_in_12;
		6'd20      :	weight_in <= weight_in_11;
		6'd21      :	weight_in <= weight_in_10;
		6'd22      :	weight_in <= weight_in_9;
		6'd23      :	weight_in <= weight_in_8;
		6'd24      :	weight_in <= weight_in_7;
		6'd25      :	weight_in <= weight_in_6;
		6'd26      :	weight_in <= weight_in_5;
		6'd27      :	weight_in <= weight_in_4;
		6'd28      :	weight_in <= weight_in_3;
		6'd29      :	weight_in <= weight_in_2;
		6'd30      :	weight_in <= weight_in_1;
		6'd31      :	weight_in <= weight_in_0;
		default	   :	weight_in <=  32'd1;
	end		

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

reg adap_filter_state_dly;			
	always@(posedge clk or negedge rstn)
	begin
	if (rstn == 0)
		adap_filter_state_dly <=   45'd0;
	else
		adap_filter_state_dly <=    adap_filter_state;
	end			

always@(posedge clk or negedge rstn)
begin
if (rstn == 0)
	multiple <=   45'd0;
else if (adap_filter_state_dly == 1'b0)
	multiple <=   45'd0;
else if (counter<6'd34)
	multiple <=    weight_in * {17'd0, reff};
else
	multiple <=    multiple;
end


always@(posedge clk or negedge rstn)
begin
if (rstn == 0)
	dreg <=   32'd0;
else if (adap_filter_state_dly == 1'b1 && counter<6'd34)
	dreg <=   dreg + multiple[45:5];
else if (adap_filter_state_dly == 1'b0)
	dreg <=   32'd0;
else
	dreg <=   dreg;
end


always@(posedge clk or negedge rstn)
begin
if (rstn == 0)
	nref <=   32'd0;
else if (adap_filter_state_dly == 1'b0)
	nref <=   32'd0;
else if (counter<6'd34)
	nref <=  {17'd0, reff} * {17'd0, reff};
else
	nref <=   nref;
end


always@(posedge clk or negedge rstn)
begin
if (rstn == 0)
	rreg <=   32'd0;
else if (adap_filter_state_dly == 1'b0)
	rreg <=   32'd0;
else if (adap_filter_state_dly == 1'b1 && counter<6'd34)
	rreg <=   rreg + nref ;
else
	rreg <=   rreg;
end


always@(posedge clk or negedge rstn)
begin
if(rstn==0)
	n <= 14'd0;	
else if (counter == 6'd33&&flag_15==1&&flag_n==1)
	n <=   rreg + nref;
else
	n <=  n;
end

always@(posedge clk or negedge rstn)
begin
if(rstn==0)
	d_sum <= 14'd0;	
else if (counter == 6'd33&&flag_15==1&&flag_n==1)
	d_sum <=   dreg + multiple[45:5];
else
	d_sum <=  d_sum;
end

always@(posedge clk or negedge rstn)
begin
if (rstn == 0)
	e <=   14'd0;
else if (div_state == 1'b1 && adap_filter_state_dly == 1'b1 && counter == 6'd34 && d[13] == 0)
	e <=   reff_31 - d;	
else if (div_state == 1'b1 && adap_filter_state_dly == 1'b1 && counter == 6'd34 && d[13] == 1)
	e <=   reff_31 + d;	
else
	e <=   e;

end


divdiv divdiv_1(.dividend(d_sum), .divisor(n),.div_state(div_state) ,.clk(clk), .rstn(rstn), .enable(~flag_16&flag_n), .result(d));

    
endmodule

