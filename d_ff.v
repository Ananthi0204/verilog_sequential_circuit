module d_ff(input d, clk, rst,
    output reg q,
    output qbar);
assign qbar = ~q;
always @(posedge clk or posedge rst) begin
    if (rst)
        q <= 0;
    else
        q <= d;
end
endmodule