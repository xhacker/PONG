`timescale 1ns / 1ps
module timer_1ms(
    input wire clk,
    output reg clk_1ms
);

    reg [15:0] cnt;

    initial begin
        cnt [15:0] <= 0;
        clk_1ms <= 0;
    end

    always @(posedge clk) begin
        if (cnt >= 25000) begin
            cnt <= 0;
            clk_1ms <= ~clk_1ms;
        end else begin
            cnt <= cnt + 1'b1;
        end
    end

endmodule
