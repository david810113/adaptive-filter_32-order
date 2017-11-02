`timescale 1ns/1ps
module ram_data (shift_data_state, rstn, clk, in, head_flag, ram_tmp_0, ram_tmp_1, ram_tmp_2, ram_tmp_3, ram_tmp_4, ram_tmp_5, ram_tmp_6, ram_tmp_7, ram_tmp_8, ram_tmp_9, ram_tmp_10, ram_tmp_11, ram_tmp_12, ram_tmp_13, ram_tmp_14, ram_tmp_15,ram_tmp_16,ram_tmp_17,ram_tmp_18,ram_tmp_19,ram_tmp_20,ram_tmp_21,ram_tmp_22,ram_tmp_23,ram_tmp_24,ram_tmp_25,ram_tmp_26,ram_tmp_27,ram_tmp_28,ram_tmp_29,ram_tmp_30,ram_tmp_31,ram_tmp_32);

input rstn, clk, head_flag, shift_data_state;
input [13:0] in;

output reg [13:0] ram_tmp_0;
output reg [13:0] ram_tmp_1;
output reg [13:0] ram_tmp_2;
output reg [13:0] ram_tmp_3;
output reg [13:0] ram_tmp_4;
output reg [13:0] ram_tmp_5;
output reg [13:0] ram_tmp_6;
output reg [13:0] ram_tmp_7;
output reg [13:0] ram_tmp_8;
output reg [13:0] ram_tmp_9;
output reg [13:0] ram_tmp_10;
output reg [13:0] ram_tmp_11;
output reg [13:0] ram_tmp_12;
output reg [13:0] ram_tmp_13;
output reg [13:0] ram_tmp_14;
output reg [13:0] ram_tmp_15;
output reg [13:0] ram_tmp_16;
output reg [13:0] ram_tmp_17;
output reg [13:0] ram_tmp_18;
output reg [13:0] ram_tmp_19;
output reg [13:0] ram_tmp_20;
output reg [13:0] ram_tmp_21;
output reg [13:0] ram_tmp_22;
output reg [13:0] ram_tmp_23;
output reg [13:0] ram_tmp_24;
output reg [13:0] ram_tmp_25;
output reg [13:0] ram_tmp_26;
output reg [13:0] ram_tmp_27;
output reg [13:0] ram_tmp_28;
output reg [13:0] ram_tmp_29;
output reg [13:0] ram_tmp_30;
output reg [13:0] ram_tmp_31;
output reg [13:0] ram_tmp_32;

//********************** Shift Register Storage ***********************//
    always@(posedge clk or negedge rstn)
    begin
    if (rstn == 1'b0)
        ram_tmp_0 <=   14'd0;
    else if (shift_data_state == 1'b1)
        ram_tmp_0 <=   in;
    else
	ram_tmp_0 <=   ram_tmp_0;
    end  


    always@(posedge clk or negedge rstn)
    begin
    if (rstn == 1'b0)
        ram_tmp_1 <=   14'd0;
    else if (shift_data_state == 1'b1)
        ram_tmp_1 <=   ram_tmp_0;
    else
	ram_tmp_1 <=   ram_tmp_1;
    end    

    always@(posedge clk or negedge rstn)
    begin
    if (rstn == 1'b0)
        ram_tmp_2 <=   14'd0;
    else if (shift_data_state == 1'b1)
        ram_tmp_2 <=   ram_tmp_1;
    else
	ram_tmp_2 <=   ram_tmp_2;
    end    

    always@(posedge clk or negedge rstn)
    begin
    if (rstn == 1'b0)
        ram_tmp_3 <=   14'd0;
    else if (shift_data_state == 1'b1)
        ram_tmp_3 <=   ram_tmp_2;
    else
	ram_tmp_3 <=   ram_tmp_3;
    end    

    always@(posedge clk or negedge rstn)
    begin
    if (rstn == 1'b0)
        ram_tmp_4 <=   14'd0;
    else if (shift_data_state == 1'b1)
        ram_tmp_4 <=   ram_tmp_3;
    else
	ram_tmp_4 <=   ram_tmp_4;
    end    

    always@(posedge clk or negedge rstn)
    begin
    if (rstn == 1'b0)
        ram_tmp_5 <=   14'd0;
    else if (shift_data_state == 1'b1)
        ram_tmp_5 <=   ram_tmp_4;
    else
	ram_tmp_5 <=   ram_tmp_5;
    end    

    always@(posedge clk or negedge rstn)
    begin
    if (rstn == 1'b0)
        ram_tmp_6 <=   14'd0;
    else if (shift_data_state == 1'b1)
        ram_tmp_6 <=   ram_tmp_5;
    else
	ram_tmp_6 <=   ram_tmp_6;
    end    

    always@(posedge clk or negedge rstn)
    begin
    if (rstn == 1'b0)
        ram_tmp_7 <=   14'd0;
    else if (shift_data_state == 1'b1)
        ram_tmp_7 <=   ram_tmp_6;
    else
	ram_tmp_7 <=   ram_tmp_7;
    end    

    always@(posedge clk or negedge rstn)
    begin
    if (rstn == 1'b0)
        ram_tmp_8 <=   14'd0;
    else if (shift_data_state == 1'b1)
        ram_tmp_8 <=   ram_tmp_7;
    else
	ram_tmp_8 <=   ram_tmp_8;
    end    

    always@(posedge clk or negedge rstn)
    begin
    if (rstn == 1'b0)
        ram_tmp_9 <=   14'd0;
    else if (shift_data_state == 1'b1)
        ram_tmp_9 <=   ram_tmp_8;
    else
	ram_tmp_9 <=   ram_tmp_9;
    end    

    always@(posedge clk or negedge rstn)
    begin
    if (rstn == 1'b0)
        ram_tmp_10 <=   14'd0;
    else if (shift_data_state == 1'b1)
        ram_tmp_10 <=   ram_tmp_9;
    else
	ram_tmp_10 <=   ram_tmp_10;
    end    

    always@(posedge clk or negedge rstn)
    begin
    if (rstn == 1'b0)
        ram_tmp_11 <=   14'd0;
    else if (shift_data_state == 1'b1)
        ram_tmp_11 <=   ram_tmp_10;
    else
	ram_tmp_11 <=   ram_tmp_11;
    end    

    always@(posedge clk or negedge rstn)
    begin
    if (rstn == 1'b0)
        ram_tmp_12 <=   14'd0;
    else if (shift_data_state == 1'b1)
        ram_tmp_12 <=   ram_tmp_11;
    else
	ram_tmp_12 <=   ram_tmp_12;
    end    

    always@(posedge clk or negedge rstn)
    begin
    if (rstn == 1'b0)
        ram_tmp_13 <=   14'd0;
    else if (shift_data_state == 1'b1)
        ram_tmp_13 <=   ram_tmp_12;
    else
	ram_tmp_13 <=   ram_tmp_13;
    end    

    always@(posedge clk or negedge rstn)
    begin
    if (rstn == 1'b0)
        ram_tmp_14 <=   14'd0;
    else if (shift_data_state == 1'b1)
        ram_tmp_14 <=   ram_tmp_13;
    else
	ram_tmp_14 <=   ram_tmp_14;
    end    

    always@(posedge clk or negedge rstn)
    begin
    if (rstn == 1'b0)
        ram_tmp_15 <=   14'd0;
    else if (shift_data_state == 1'b1)
        ram_tmp_15 <=   ram_tmp_14;
    else
	ram_tmp_15 <=   ram_tmp_15;
    end
	
	always@(posedge clk or negedge rstn)
    begin
    if (rstn == 1'b0)
        ram_tmp_16 <=   14'd0;
    else if (shift_data_state == 1'b1)
        ram_tmp_16 <=   ram_tmp_15;
    else
	ram_tmp_16 <=   ram_tmp_16;
    end
	
	always@(posedge clk or negedge rstn)
    begin
    if (rstn == 1'b0)
        ram_tmp_17 <=   14'd0;
    else if (shift_data_state == 1'b1)
        ram_tmp_17 <=   ram_tmp_16;
    else
	ram_tmp_17 <=   ram_tmp_17;
    end  


    always@(posedge clk or negedge rstn)
    begin
    if (rstn == 1'b0)
        ram_tmp_18 <=   14'd0;
    else if (shift_data_state == 1'b1)
        ram_tmp_18 <=   ram_tmp_17;
    else
	ram_tmp_18 <=   ram_tmp_18;
    end    

    always@(posedge clk or negedge rstn)
    begin
    if (rstn == 1'b0)
        ram_tmp_19 <=   14'd0;
    else if (shift_data_state == 1'b1)
        ram_tmp_19 <=   ram_tmp_18;
    else
	ram_tmp_19 <=   ram_tmp_19;
    end    

    always@(posedge clk or negedge rstn)
    begin
    if (rstn == 1'b0)
        ram_tmp_20 <=   14'd0;
    else if (shift_data_state == 1'b1)
        ram_tmp_20 <=   ram_tmp_19;
    else
	ram_tmp_20 <=   ram_tmp_20;
    end    

    always@(posedge clk or negedge rstn)
    begin
    if (rstn == 1'b0)
        ram_tmp_21 <=   14'd0;
    else if (shift_data_state == 1'b1)
        ram_tmp_21 <=   ram_tmp_20;
    else
	ram_tmp_21 <=   ram_tmp_21;
    end    

    always@(posedge clk or negedge rstn)
    begin
    if (rstn == 1'b0)
        ram_tmp_22 <=   14'd0;
    else if (shift_data_state == 1'b1)
        ram_tmp_22 <=   ram_tmp_21;
    else
	ram_tmp_22 <=   ram_tmp_22;
    end    

    always@(posedge clk or negedge rstn)
    begin
    if (rstn == 1'b0)
        ram_tmp_23 <=   14'd0;
    else if (shift_data_state == 1'b1)
        ram_tmp_23 <=   ram_tmp_22;
    else
	ram_tmp_23 <=   ram_tmp_23;
    end    

    always@(posedge clk or negedge rstn)
    begin
    if (rstn == 1'b0)
        ram_tmp_24 <=   14'd0;
    else if (shift_data_state == 1'b1)
        ram_tmp_24 <=   ram_tmp_23;
    else
	ram_tmp_24 <=   ram_tmp_24;
    end    

    always@(posedge clk or negedge rstn)
    begin
    if (rstn == 1'b0)
        ram_tmp_25 <=   14'd0;
    else if (shift_data_state == 1'b1)
        ram_tmp_25 <=   ram_tmp_24;
    else
	ram_tmp_25 <=   ram_tmp_25;
    end    

    always@(posedge clk or negedge rstn)
    begin
    if (rstn == 1'b0)
        ram_tmp_26 <=   14'd0;
    else if (shift_data_state == 1'b1)
        ram_tmp_26 <=   ram_tmp_25;
    else
	ram_tmp_26 <=   ram_tmp_26;
    end    

    always@(posedge clk or negedge rstn)
    begin
    if (rstn == 1'b0)
        ram_tmp_27 <=   14'd0;
    else if (shift_data_state == 1'b1)
        ram_tmp_27 <=   ram_tmp_26;
    else
	ram_tmp_27 <=   ram_tmp_27;
    end    

    always@(posedge clk or negedge rstn)
    begin
    if (rstn == 1'b0)
        ram_tmp_28 <=   14'd0;
    else if (shift_data_state == 1'b1)
        ram_tmp_28 <=   ram_tmp_27;
    else
	ram_tmp_28 <=   ram_tmp_28;
    end    

    always@(posedge clk or negedge rstn)
    begin
    if (rstn == 1'b0)
        ram_tmp_29 <=   14'd0;
    else if (shift_data_state == 1'b1)
        ram_tmp_29 <=   ram_tmp_28;
    else
	ram_tmp_29 <=   ram_tmp_29;
    end    

    always@(posedge clk or negedge rstn)
    begin
    if (rstn == 1'b0)
        ram_tmp_30 <=   14'd0;
    else if (shift_data_state == 1'b1)
        ram_tmp_30 <=   ram_tmp_29;
    else
	ram_tmp_30 <=   ram_tmp_30;
    end    

    always@(posedge clk or negedge rstn)
    begin
    if (rstn == 1'b0)
        ram_tmp_31 <=   14'd0;
    else if (shift_data_state == 1'b1)
        ram_tmp_31 <=   ram_tmp_30;
    else
	ram_tmp_31 <=   ram_tmp_31;
    end    

    always@(posedge clk or negedge rstn)
    begin
    if (rstn == 1'b0)
        ram_tmp_32 <=   14'd0;
    else if (shift_data_state == 1'b1)
        ram_tmp_32 <=   ram_tmp_31;
    else
	ram_tmp_32 <=   ram_tmp_32;
    end
	


endmodule
