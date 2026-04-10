module tb;
  reg clk,rst;
  wire [3:0] count;
  mod10_counter dut(.*);
  always #4 clk=~clk;
  initial begin
    clk=0;
    rst=0; #10
    rst=1; #100
    #30 $finish;
  end
  initial begin
    $monitor("time=%0t rst=%b count=%b",$time,rst,count);
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
endmodule