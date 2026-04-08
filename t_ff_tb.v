module tb;
reg t, clk, rst;
wire q, qbar;
t_ff uut(t, clk, rst, q, qbar);
always #5 clk = ~clk;
initial begin
    clk = 0;
    rst = 1;
    t = 0;
    #10 rst = 0;
    #10 t = 0;
    #10 t = 1;  
    #10 t = 1;  
    #10 t = 0;  
    #20 $finish;
end
initial begin
    $monitor("t=%0t t=%b q=%b", $time, t, q);
end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
endmodule