`timescale 1ns/1ps

module temperature_monitor_tb;

reg clk;
reg reset;
reg [7:0] temperature;

wire low_temp;
wire normal_temp;
wire high_temp;

temperature_monitor #(
    .LOW_LIMIT(20),
    .HIGH_LIMIT(30)
) uut (
    .clk(clk),
    .reset(reset),
    .temperature(temperature),
    .low_temp(low_temp),
    .normal_temp(normal_temp),
    .high_temp(high_temp)
);

// Clock generation
always #5 clk = ~clk;

initial begin

    $monitor("Time=%0t | Temperature=%0d C | LOW=%b NORMAL=%b HIGH=%b",
             $time, temperature, low_temp, normal_temp, high_temp);

    clk = 0;
    reset = 1;
    temperature = 0;

    #10;
    reset = 0;

    // Low temperature
    temperature = 15;
    #10;

    // Normal temperature
    temperature = 25;
    #10;

    // High temperature
    temperature = 35;
    #10;

    // Boundary test
    temperature = 20;
    #10;

    temperature = 30;
    #10;

    $finish;
end

endmodule