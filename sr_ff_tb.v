module tb;

reg s, r, clk, rst;
wire q, qbar;
sr_ff uut(s, r, clk, rst, q, qbar);
always #5 clk = ~clk;
initial begin
    clk = 0;
    rst = 1;
    s = 0; r = 0;
    #10 rst = 0;
    #10 s=0; r=0; 
    #10 s=0; r=1;  
    #10 s=1; r=0; 
    #10 s=1; r=1;  
    #20 $finish;
end

initial begin
    $monitor("t=%0t s=%b r=%b q=%b", $time, s, r, q);
end
initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1);
end
endmodule