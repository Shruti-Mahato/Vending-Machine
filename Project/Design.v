module vending_mcn(input clk,rst,input [3:0]in, output reg out, output [1:0]state);
  reg [1:0]st;
  parameter S0 = 2'b00 , S5= 2'b01 ,S10 = 2'b10, S15= 2'b11 ;
  
  always @(posedge clk) begin
    if(!rst)
      st <= S0;
  else
    case(st)
      S0 : if(in== 5) st= S5; else st = S10; 
      S5 : if(in == 5) st= S10; else if(in == 10) st = S15;
      S10 : if(in == 5) st= S15; else st = S15;
      S15 : if(in == 5) st= S5; else st = S10;
      default st = S0;
    endcase
  end
  assign out = (st== S15) ;
  assign state =st;
endmodule
