`timescale 1ns / 1ps

module graphic(
    input wire  clk,
    input wire  [10:0] x, y,
    output wire [7:0] rgb
);

    // colors
    localparam RED   = 8'b00000111;
    localparam GREEN = 8'b00111000;
    localparam BLUE  = 8'b11000000;
    localparam WHITE = 8'b11111111;
    localparam BLACK = 8'b00000000;
    
    reg [7:0] rgb_now;
    always @* begin
    if (x < 640 && y < 480)
        rgb_now <= (x % 512) / 2;
    else
        rgb_now <= BLACK;
    end
    
    assign rgb = rgb_now;
    
endmodule
