module FSM(clk,rst,start,next_zero,LD_SUM,LD_NEXT,SUM_SEL,NEXT_SEL,A_SEL,done);//控制器有限状态机
    //输入输出
    input clk,rst,start,next_zero;
    output reg LD_SUM,LD_NEXT,SUM_SEL,NEXT_SEL,A_SEL,done;
    //状态标号
    localparam START = 0, COMPUTE_SUM = 1,GET_NEXT = 2, DONE = 3;
    //现态与次态记录
    reg [1:0] State, StateNext;//2位宽的State和StateNext记录现态和次态
    //时序逻辑实现状态转移规律和输出
    always@(State,start,next_zero) begin
        case(State)
            START: begin
                LD_SUM=0;LD_NEXT=0;SUM_SEL=0;NEXT_SEL=0;A_SEL=0;done=0;
                if (start==0) 
                    StateNext=START;
                else
                    StateNext=COMPUTE_SUM;
            end
            COMPUTE_SUM: begin
                LD_SUM=1;LD_NEXT=0;SUM_SEL=1;NEXT_SEL=1;A_SEL=1;done=0;
                StateNext=GET_NEXT;
            end
            GET_NEXT: begin
                LD_SUM=0;LD_NEXT=1;SUM_SEL=1;NEXT_SEL=1;A_SEL=0;done=0;
                if (next_zero==0)
                    StateNext=COMPUTE_SUM;
                else
                    StateNext=DONE;
            end
            DONE:  begin
                LD_SUM=0;LD_NEXT=0;SUM_SEL=0;NEXT_SEL=0;A_SEL=0;done=1;
                if (start==0)
                    StateNext=START;
                else
                    StateNext=DONE;
            end
        endcase
    end
    // 时序逻辑描述状态转移
    always @(posedge clk) begin
        if (rst == 1 ) //同步复位使状态初始化
			State <= START; //FSM的初始态
		else
			State <= StateNext; //状态转移
	end
endmodule