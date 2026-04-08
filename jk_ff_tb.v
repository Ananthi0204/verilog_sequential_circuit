module tb;
reg j, k, clk, rst;
wire q, qbar;
jk_ff uut(j, k, clk, rst, q, qbar);
always #5 clk = ~clk;
initial begin
    clk = 0;
    rst = 1;
    j = 0; k = 0;
    #10 rst = 0;
    #10 j=0; k=0;  
    #10 j=0; k=1;  
    #10 j=1; k=0;  
    #10 j=1; k=1;  
       #20 $finish;
end
initial begin
    $monitor("t=%0t j=%b k=%b q=%b", $time, j, k, q);
end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end   
endmodule