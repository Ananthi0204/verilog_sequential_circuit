module tb;
reg clk, rst, din;
wire dout;
siso dut(clk, rst, din, dout);
always #5 clk = ~clk;
initial begin
    clk = 0;
    rst = 0;
    din = 0;
    #10 rst = 1;   
    #10 din = 1;
    #10 din = 0;
    #10 din = 1;
    #10 din = 1;
    #10 din = 0;

    #50 $finish;
end
initial begin
    $monitor("time=%0t rst=%b din=%b dout=%b", $time, rst, din, dout);
end
initial begin
    $dumpfile("dump.vcd");
  $dumpvars(1);
end

endmodule