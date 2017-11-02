`timescale 1ns/1ps

module top_all(clk, miso, mosi, sck, cs, rstn);
input clk, mosi, sck, cs, rstn; 
output miso;

wire [13:0] buffer_2, buffer_3, reff, dn;   
wire [31:0] test;
wire [13:0] test1;
assign test1 = test[13:0];
s2p s2p_0 (.mosi(mosi),
           .sck(sck),
           .cs(cs),
           .rstn(rstn),
           .clk(clk),
           .buffer_2(buffer_2),
           .buffer_3(buffer_3),
           .reff(reff),
           .head_flag(head_flag)        
);   

p2s p2s_0 (.sck(sck),
           .head_flag(head_flag),           
	   .cs(cs),
           .rstn(rstn),
           .clk(clk),  
	   .in_p2s(test1),    
	   .miso(miso)
);   


alog_top alog_top (.rstn(rstn),
		   .clk(clk),
		   .buffer_2(buffer_2),
		   .buffer_3(buffer_3),
                   .reff(reff),
                   .head_flag(head_flag),
		   .dout(dn),
		   .weight_2_in_0(test)
);
       
endmodule
