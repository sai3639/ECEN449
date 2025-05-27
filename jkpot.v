`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 09/03/2024 12:42:59 PM
// Design Name:
// Module Name: jackpot
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


//Jackpot
//LEDs are turned on one at a time - sequential
//fast as possible
//DIP switch for each LEDs
//flip switch - corresponding to lit LED - you win and LEDs light up
//else LEDs switch alternately


//counter to track which LED is currently on
//clock divider to slow down transitions
///check dip switches to determine if correct switch has been flipped


//internal variables
//need counter for slow clock
//intializing clock to zero
//led counter


module jackpot(
    input CLOCK,
    input [3:0] SWITCHES,
    input RESET,
    output [3:0] LEDS
   
);

reg [3:0] count;  //count leds
reg clk_out = 0;
reg [3:0] current; //save switch position
reg [27:0] counter = 0; //counter value



//led counter
always@(posedge clk_out)
    begin
        if (RESET == 1) //? 15?
            begin
                count <=4'b1000;
            end
        else if (count == 4'b0001)
            begin
                count <= 4'b1000;
            end
           
       
        //switch has been turned on
        else if (SWITCHES)
            begin
                current <= SWITCHES; //current = switch
               
                //if right switch has been turned on
                if ((SWITCHES[3:0])==count[3:0])
                    begin
                        count = 4'b1111; //light up all leds
                    end
                   
                //wrong switch has been turned on - should continue like nothing happened
                else
                    begin
                        count <= {count[0], count[3:1]};
                        //count <= {count[2:0], count[3]};
                   
                    end
             
            end
       
        //else keep leds lighting up
        else //if (count == 4'b0001)
             begin
                count <= {count[0], count[3:1]};
                //count <= {count[2:0], count[3]};
             end
             
       
/*
        else if (SWITCHES) //switch has been turned on
            begin
                current <= SWITCHES;
                if ((count == SWITCHES) && (SWITCHES != current))
                    begin
                        count = 4'b1111; //win - light up all leds
                    end
                else
                    begin
                        //lower three bits concatenates with MSB
                        //ex. 4'b1000 becomes 4'b0001
                        count <= {count[2:0], count[3]}; // Shift the LED to the next position
                    end
            end
            */
end





//clock logic

always @ (posedge CLOCK)
    begin
        counter<= counter+1;
        if (counter==62500000) //half the value?
            begin
                counter<=0;
                clk_out = ~clk_out; //reverse clock
            end
    end
    assign LEDS[3:0] = count[3:0];
endmodule

