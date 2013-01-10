`timescale 1ns / 1ps

module clk_25mhz(
    input wire clk,
    output reg clk_25mhz
);

    reg cnt;

    initial begin
        cnt <= 0;
        clk_25mhz <= 0;
    end

    always @(posedge clk)
    begin
        if (cnt == 1)
            begin
                cnt <= 0;
                clk_25mhz <= ~clk_25mhz;
            end
        else
            cnt <= 1;
    end

endmodule
