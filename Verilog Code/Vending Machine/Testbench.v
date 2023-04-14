module tb_vending_mcn;
  wire t_out;
  reg t_clk, t_rst;
  reg [1:0] state;
  reg [3:0]data;
  
  vending_mcn m(t_clk, t_rst, data, t_out, state);

  always #10 t_clk= ~t_clk;
  
  initial begin
    $dumpfile("tb_vending_mcn.vcd");
    $dumpvars(1,tb_vending_mcn);
    $monitor("  Time= %0d, data=%b, out = %b", $time,data,t_out);
    t_clk=0;
    t_rst =0;
  
    #2 t_rst = 1;
    #9 data = 5;
    #19 data = 5;
    #31 data = 5;
    #150 $finish;
  end
endmodule
