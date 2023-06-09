module divider(clk, clk_N);
    parameter N = 50000000;      // 1Hzçæ¶é?,N=fclk/fclk_N
	input clk;                      // ç³»ç»æ¶é
	output reg clk_N;                   // åé¢åçæ¶é
	reg [31:0] counter;             /* è®¡æ°å¨åéï¼éè¿è®¡æ°å®ç°åé¢ãå½è®¡æ°å¨ä»0è®¡æ°å?(N/2-1)æ¶ï¼
									è¾åºæ¶éç¿»è½¬ï¼è®¡æ°å¨æ¸é¶ */
    always @(posedge clk)  begin    // æ¶éä¸åæ²?
   		counter <= counter+1'b1  ;                       // åè½å®ç°
        if(counter==N)
            begin
                clk_N<=~clk_N;
                counter<=0;
            end
	end                           
endmodule