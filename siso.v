module siso(
    input clk, rst, din,
    output reg dout
);

reg [3:0] temp;

always @(posedge clk or negedge rst) begin
    if(!rst) begin
        temp <= 4'b0000;
        dout <= 0;        
    end
    else begin
        temp <= {temp[2:0], din};
        dout <= temp[3];
    end
end

endmodule