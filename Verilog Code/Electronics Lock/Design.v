// Code your design here
module electronic_lock(input clk,rst,b0,b1,output unlock,reg [2:0]state);
  reg [2:0]st;
  parameter SRST = 3'd0 ,S0 = 3'd1 , S01= 3'd2 ,S010 = 3'd3, S0101= 3'd4 , S01011 = 3'd5 ;
  always @(posedge clk) begin
    if(rst)
      st <= SRST;
  else
    case(st)
      /*SRST : st=b0 ? S0 : b1 ?SRST : st;
      S0 : st=b0 ? S0 : b1? S01 : st;
      S01 : st=b0 ? S010 :b1 ?SRST : st;
      S010 :  st= b0 ? S0 :b1? S0101 :st;
      S0101 :st= b0 ? S010 : b1 ? S01011 : st;
      S01011 : st= b0 ? S0 : b1 ? SRST : st;
      default st = SRST;*/
      SRST : if(b0) st= S0; else if(b1) st = SRST;
      S0 : if(b0) st= S0; else if(b1) st = S01;
      S01 : if(b0) st= S010; else if(b1) st = SRST;
      S010 : if(b0) st= S0; else if(b1) st = S0101;
      S0101 : if(b0) st= S010; else if(b1) st = S01011;
      S01011 : if(b0) st= S0; else if(b1) st = SRST;
      default st = SRST;
    endcase
  end
  assign unlock = (st== S01011) ;
  assign state = st;
endmodule
