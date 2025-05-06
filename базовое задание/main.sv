`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.05.2025 13:48:21
// Design Name: 
// Module Name: main
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


module main(
    input logic clk_i,
    input logic srst_i,
    input logic signed [17:0] data_a_i_i,
    input logic signed [17:0] data_a_q_i,
    input logic signed [17:0] data_b_i_i,
    input logic signed [17:0] data_b_q_i,
    output logic signed [36:0] data_i_o,
    output logic signed [36:0] data_q_o
    );
    
always_ff @(posedge clk_i) begin
    if (srst_i) begin
        data_i_o <= '0;
        data_q_o <= '0;
    end else begin
        data_i_o <= data_a_i_i * data_b_i_i - (data_a_q_i * data_b_q_i);
        data_q_o <= data_a_q_i * data_b_i_i + data_a_i_i * data_b_q_i;
    end
end

endmodule
