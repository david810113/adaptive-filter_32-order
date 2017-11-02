`timescale 1ns/1ps
module p2s (sck, cs, rstn, clk,in_p2s, head_flag,miso);
input sck, cs, rstn, clk,head_flag;
input[13:0] in_p2s;
output  miso;
reg [13:0]reff_temp;







always@(negedge sck or negedge rstn)
	begin
	
		if(rstn==1'b0)
		reff_temp <=  14'd0;
		else if(head_flag==1'b0)
		reff_temp[13:0] <=  in_p2s[13:0];
		else
		reff_temp[13:0] <=  {reff_temp[12:0],1'd0};
	end
assign miso = (head_flag==1'b1)?reff_temp[13]:1'b0;

endmodule	
		
		
