module temperature_monitor #(
    parameter LOW_LIMIT  = 20,
    parameter HIGH_LIMIT = 30
)(
    input  wire        clk,
    input  wire        reset,
    input  wire [7:0]  temperature,
    output reg         low_temp,
    output reg         normal_temp,
    output reg         high_temp
);

always @(posedge clk) begin
    if (reset) begin
        low_temp    <= 1'b0;
        normal_temp <= 1'b0;
        high_temp   <= 1'b0;
    end
    else begin
        if (temperature < LOW_LIMIT) begin
            low_temp    <= 1'b1;
            normal_temp <= 1'b0;
            high_temp   <= 1'b0;
        end
        else if (temperature > HIGH_LIMIT) begin
            low_temp    <= 1'b0;
            normal_temp <= 1'b0;
            high_temp   <= 1'b1;
        end
        else begin
            low_temp    <= 1'b0;
            normal_temp <= 1'b1;
            high_temp   <= 1'b0;
        end
    end
end

endmodule