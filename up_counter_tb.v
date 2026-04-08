module test;
  reg clk,rst;
  wire [3:0]count;
  counter dut(.*);
  always #5 clk=~clk;
  initial begin
    clk=0;
    rst=0;
    rst=1; #15;
    rst=0; #30
    rst=1; #50
    #200 $finish;
  end
    initial begin
      $monitor("rst=%0h count=%0h",rst,count);
    end
    initial begin
      $dumpfile("dump.vcd");
      $dumpvars(0,test);
    end
endmodule