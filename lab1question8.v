//4-bit counter using LEDs
//value updates approx every sec 
//BTN0 - count up 
//BTN1 - count down


//LEDs display count value
//need to slown down clock using clock divider 
//check state of BTN0 and BTN1 to determine count up, down, or hold

//nonblocking assignment '<=' evaluates RHS expression and updates LHS


module counter(
	input CLOCK, // Declare input port for clock
	input  RESET, //Declare input port for reset 
	input BTN0, 
	input BTN1, 
	output [3:0] LEDS
	
);

reg[3:0] COUNT; //4 bit count value displayed on LEDS

//2^27 = 134,217,728 ~ 125,000,000
//intial counter value = 0
reg [27:0] counter = 0; //counter value

//divided clock
reg clk_out;




always@(posedge clk_out)
	begin
		if(RESET == 1) //reset count to 0
			begin
				COUNT<=0;
			end
		else if (BTN0 == 1) //button 0 = true
			begin
				COUNT <= COUNT + 1; //count increases 
			end
		else if (BTN1 == 1) //button 1 = pressed
			begin
				COUNT <= COUNT - 1; //count decreases 
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
		assign LEDS[3:0] = COUNT[3:0];
	endmodule 
	


			




