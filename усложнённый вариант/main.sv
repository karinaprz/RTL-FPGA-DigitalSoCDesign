`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.05.2025 13:30:56
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
    output logic signed [17:0] data_i_o,
    output logic signed [17:0] data_q_o
    );
    
logic signed [36:0] mult_i; 
logic signed [36:0] mult_q;

always_ff @(posedge clk_i) begin
    if (srst_i) begin
        data_i_o <= '0;
        data_q_o <= '0;
    end else begin
        mult_i <= data_a_i_i*data_b_i_i - data_a_q_i*data_b_q_i;
        mult_q <= data_a_i_i*data_b_q_i + data_a_q_i*data_b_i_i;
        if (mult_i[36]) begin 
            if (mult_i[18:0] == 19'b1) begin 
                if (mult_i[36] == mult_i[35]) 
                    data_i_o <= {mult_i[36], mult_i[34:18]};
                else 
                    data_i_o <= {mult_i[36:19]};
            end
            else begin 
                if (mult_i[36] == mult_i[35]) 
                    data_i_o <= {mult_i[36], mult_i[34:18] - 1'b1};
                else 
                    data_i_o <= {mult_i[36:19] - 1'b1};
            end
        end else begin 
            if (mult_i[18:0] == 19'b0) begin 
                if (mult_i[36] == mult_i[35])
                    data_i_o <= {mult_i[36], mult_i[34:18]};
                else 
                    data_i_o <= {mult_i[36:19]};
            end else begin
                if (mult_i[36] == mult_i[35])
                    data_i_o <= {mult_i[36], mult_i[34:18] + 1'b1};
                else 
                    data_i_o <= {mult_i[36:19] + 1'b1};
            end
        end 
        
         if (mult_q[36]) begin
            if (mult_q[18:0] == 19'b1) begin
                if (mult_q[36] == mult_q[35])
                    data_q_o <= {mult_q[36], mult_q[34:18]};
                else 
                    data_q_o <= {mult_q[36:19]};
            end
            else begin
                if (mult_q[36] == mult_q[35])
                    data_q_o <= {mult_q[36], mult_q[34:18] - 1'b1};
                else 
                    data_q_o <= {mult_q[36:19] - 1'b1};
            end
        end else begin
            if (mult_q[18:0] == 19'b0) begin
                if (mult_q[36] == mult_q[35])
                    data_q_o <= {mult_q[36], mult_q[34:18]};
                else 
                    data_q_o <= {mult_q[36:19]};
            end else begin
                if (mult_q[36] == mult_q[35])
                    data_q_o <= {mult_q[36], mult_q[34:18] + 1'b1};
                else 
                    data_q_o <= {mult_q[36:19] + 1'b1};
            end
        end 
    end
end

endmodule
