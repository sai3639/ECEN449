`default_nettype none
`timescale 1ns / 1ns

module combination_lock_fsm_3bit(
    output reg [1:0] state,
    output wire [3:0] Lock,
    input wire Key1,
    input wire Key2,
    input wire [3:0] Password,
    input wire Reset,
    input wire Clk
);

    parameter S0=2'b00, S1=2'b01, S2=2'b10, S3=2'b11;

    reg [1:0] current, next;

    assign Lock = (state == S3) ? 4'b1111 : 4'b0000; //last state LED output

    always @(posedge Reset) //Loops if Reset is pressed
        begin
            if (Reset)
            state = S0; //resets state to S0
        end

    always @(Key1 or Key2 or Password) //loops if Key1, Key2, or Password changes
        begin
            state = current; //set state as current 
            case (state)
                S0: begin
                        if (Key1 == 1'b1 && Password == 4'b1101) //Key 1 must be pressed and password = 13
                            next = S1;
                        else
                            next = S0;
                        end

                S1: begin
                        if (Key2 == 1'b1 && Password != 4'b0111) //key 2 must be pressed and password = 7
                            next = S0;
                        else
                            next = S1;
                    end

                S2: begin
                        if (Key1 == 1'b1 && Password != 4'b1001) //key 1 must be pressed and passwod = 9
                            next = S0;
                        else
                            next = S2;
                    end

                S3: begin
                        if (Reset) //calls reset if case = reset
                            next = S0;
                        else
                            next = S3;
                    end

            endcase

    end

endmodule

module combination_lock_fsm_4bit(
    output reg [1:0] state,
    output wire [3:0] Lock,
    input wire Key1,
    input wire Key2,
    input wire [3:0] Password,
    input wire Reset,
    input wire Clk
);

    parameter S0=3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S4 = 3'b100;

    reg [1:0] current, next;

    assign Lock = (state == S4) ? 4'b1111 : 4'b0000; //last state LED output

    always @(posedge Reset) //Loops if Reset is pressed
        begin
            if (Reset)
            state = S0; //resets state to S0
        end

    always @(Key1 or Key2 or Password) //loops if Key1, Key2, or Password changes
        begin
            state = current; //set state as current 
            case (state)
                S0: begin
                        if (Key1 == 1'b1 && Password == 4'b1101) //Key 1 must be pressed and password = 13
                            next = S1;
                        else
                            next = S0;
                        end

                S1: begin
                        if (Key2 == 1'b1 && Password != 4'b0111) //key 2 must be pressed and password = 7
                            next = S0;
                        else
                            next = S1;
                    end

                S2: begin
                        if (Key1 == 1'b1 && Password != 4'b1001) //key 1 must be pressed and passwod = 9
                            next = S0;
                        else
                            next = S2;
                    end

                S3: begin
                        if (Key2 == 1'b1 && Password != 4'b0001) //Key 2 must be pressed and password = 1
                            next = S0;
                        else
                            next = S4;
                    end
                S4: begin
                        if (reset)
                            next = S0;
                        else
                            next = S4;
                    end

            endcase

    end

endmodule
