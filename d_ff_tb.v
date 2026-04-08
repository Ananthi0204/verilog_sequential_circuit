module tb;
reg d, clk, rst;
wire q, qbar;
d_ff uut(d, clk, rst, q, qbar);
always #5 clk = ~clk;
initial begin
    clk = 0;
    rst = 1;
    d = 0;
    #10 rst = 0;
    #10 d = 0;
    #10 d = 1;
    #10 d = 0;
    #10 d = 1;
    #20 $finish;
end
initial begin
    $monitor("t=%0t d=%b q=%b", $time, d, q);
end
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
endmodule