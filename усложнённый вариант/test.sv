`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.05.2025 13:31:48
// Design Name: 
// Module Name: test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module test();

logic clk_i;
logic srst_i;
logic signed [17:0] data_a_i_i;
logic signed [17:0] data_a_q_i;
logic signed [17:0] data_b_i_i;
logic signed [17:0] data_b_q_i;
logic signed [17:0] data_i_o;
logic signed [17:0] data_q_o;

localparam int clk_PERIOD = 10;

initial begin
    clk_i = 1;
    srst_i = 0;
    #120 
    srst_i = 1;
    #20 
    srst_i = 0;
end

always #(clk_PERIOD) clk_i = ~clk_i;

always_ff @(posedge clk_i) begin
    data_a_i_i = $random;
    data_a_q_i = $random;
    data_b_i_i = $random;
    data_b_q_i = $random;
end

main main(
    .clk_i(clk_i),
    .srst_i(srst_i),
    .data_a_i_i(data_a_i_i),
    .data_a_q_i(data_a_q_i),
    .data_b_i_i(data_b_i_i),
    .data_b_q_i(data_b_q_i),
    .data_i_o(data_i_o),
    .data_q_o(data_q_o)
);

endmodule
