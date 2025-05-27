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
	input CLOCK
	input [3:0] SWITCHES,
	input RESET
	output [3:0] LEDS

);

reg [3:0] count;  //count leds
reg clk_out = 0;
reg [3:0] current; //save switch position



//led counter
always@(posedge clk_out)
	begin
		if (RESET == 1) //? 15?
			begin
				count <=0;
			end 
		else if (count == 4'b0001)
			begin
				count <= count +1;
			end
		
		else if (SWITCHES) //switch has been turned on
			begin
				current <= SWITCHES
				if ((count == SWITCHES) && SWITCHES != current))
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
			end
			

			
			
			


always @ (posedge CLOCK)
		begin	
			counter<= counter+1;
			if (counter==62500000) //half the value?
			begin
				counter<=0;
				clk_out = ~ clk_out; //reverse clock
			end
		end
		assign LEDS[3:0] = count[3:0];
	endmodule 
	
	
	
	
if(RESET) //reset LEDs
	begin
		count = 4'b1000;
	end
else if (count = 4'b0001)
	begin
		count = 4'b1000;
	end
	
	
	
	module jackpot(
	input CLOCK,
	input [3:0] SWITCHES,
	input RESET,
	output reg [3:0] LEDS
);

reg [3:0] count = 4'b0001; // LED position counter, starts with the first LED on
reg [31:0] clk_divider = 0; // Clock divider to slow down the LED transitions
reg clk_out = 0; // Slower clock for LED transitions
reg [3:0] last_switches = 4'b0000; // Track the previous state of switches

// Clock divider to generate a slower clock
always @ (posedge CLOCK) begin
	if (RESET) begin
		clk_divider <= 0;
		clk_out <= 0;
	else begin
		clk_divider <= clk_divider + 1;
		if (clk_divider == 62500000) begin
			clk_divider <= 0;
			clk_out <= ~clk_out; // Toggle the slow clock
		end
	end
end

// LED cycling and game logic
always @ (posedge clk_out) begin
	if (RESET) begin
		count <= 4'b0001; // Reset to the first LED
		LEDS <= 4'b0001;  // Reset LEDs to initial state
	else begin
		if (SWITCHES != last_switches) begin // Check if any switch is flipped
			last_switches <= SWITCHES; // Update last switches
			if (SWITCHES == count) begin // If the switch matches the glowing LED
				LEDS <= 4'b1111; // Win: Light up all LEDs
			end
		end else begin
			// Shift the LEDs in a circular one-hot manner
			count <= {count[2:0], count[3]};
			LEDS <= count;
		end
	end
end

endmodule