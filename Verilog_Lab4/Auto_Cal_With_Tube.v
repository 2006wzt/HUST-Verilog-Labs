module Auto_Cal_With_Tube(CLK,RST,START,DONE,SEG,AN);
    //�������
    input CLK,RST,START;//ʱ���źţ���λ�źţ������ź�
    output DONE;//������ɱ�־
    output [7:0]SEG;//������������
    output [7:0]AN;//Ƭѡ�ź�
    //��·
    wire NEXT_ZERO,LD_SUM,LD_NEXT,SUM_SEL,NEXT_SEL,A_SEL,CLK_1Hz;
    wire [31:0]SUM_OUT;
    //ʵ����
    divider  #(50000000) D1(CLK,CLK_1Hz);//����1Hzʱ���ź�
    FSM Controller(CLK_1Hz,RST,START,NEXT_ZERO,LD_SUM,LD_NEXT,SUM_SEL,NEXT_SEL,A_SEL,DONE);
    Datapath #(32,4) Cal(CLK_1Hz,RST,LD_SUM,LD_NEXT,SUM_SEL,NEXT_SEL,A_SEL,NEXT_ZERO,SUM_OUT);
    Dig_Tube_Display#(32) Dig_Tube(SUM_OUT,CLK,SEG,AN);//�˴�����ԭ����ʱ���ź�?
endmodule