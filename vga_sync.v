module vga_sync
(
    input wire clk,
    output wire hsync, vsync
);

    reg  [10:0] cnt_x;
    reg  [9:0]  cnt_y;
    reg  in_hs, in_vs;
    wire clk_25mhz;

    // HS: pixel clks
    localparam H_PW   = 96; // pulse width
    localparam H_BP   = 48; // back porch
    localparam H_DISP = 640;
    localparam H_FP   = 16; // front porch
    localparam H_S    = H_PW + H_BP + H_DISP + H_FP; // sync pulse
    
    // VS: lines
    localparam V_PW   = 2; // pulse width
    localparam V_BP   = 29; // back porch
    localparam V_DISP = 480;
    localparam V_FP   = 10; // front porch
    localparam V_S    = V_PW + V_BP + V_DISP + V_FP; // sync pulse

    clk_25mhz clk_pixel(clk, clk_25mhz);
    
    wire cnt_x_maxed = (cnt_x == H_S);
    wire cnt_y_maxed = (cnt_y == V_S);

    initial begin
        cnt_x <= 0;
        cnt_y <= 0;
    end

    always @(posedge clk_25mhz) begin
        if (cnt_x_maxed) begin
            cnt_x <= 0;
            cnt_y <= cnt_y + 1;
            if (cnt_y_maxed)
                cnt_y <= 0;
        end
        else
            cnt_x <= cnt_x + 1;
    end

    // check whether is a sync signal
    always @(posedge clk_25mhz) begin
        in_hs = (cnt_x < H_PW);
        in_vs = (cnt_y < V_PW);
    end

    // vga sync needs a low pulse
    assign hsync = ~in_hs;
    assign vsync = ~in_vs;

endmodule
