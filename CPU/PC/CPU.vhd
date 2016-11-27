----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:12:36 11/24/2016 
-- Design Name: 
-- Module Name:    CPU - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CPU is
    Port ( clk : in  STD_LOGIC;
			  PCout : out STD_LOGIC_VECTOR(15 downto 0);
			  PCin : in STD_LOGIC_VECTOR(15 downto 0);
           rst : in  STD_LOGIC);
end CPU;

architecture Behavioral of CPU is
	component PC
		Port ( clk : in  STD_LOGIC;
			  rst : in STD_LOGIC;
           break : in  STD_LOGIC;
           next_PC : in  STD_LOGIC_VECTOR (15 downto 0);
           PC_to_add : out  STD_LOGIC_VECTOR (15 downto 0);
           PC_IF : out  STD_LOGIC_VECTOR (15 downto 0);
           PC_EX : out  STD_LOGIC_VECTOR (15 downto 0));
	end component;
	component PC_ALU
		Port ( PC : in  STD_LOGIC_VECTOR (15 downto 0);
           PC_4 : out  STD_LOGIC_VECTOR (15 downto 0));
	end component;
	component PC_EX_MUX
		Port ( PC_ALU : in  STD_LOGIC_VECTOR (15 downto 0);
           EX_result : in  STD_LOGIC_VECTOR (15 downto 0);
           result : out  STD_LOGIC_VECTOR (15 downto 0);
           Control_EX : in  STD_LOGIC);
	end component;
	component Addr_MUX
		Port ( PC : in  STD_LOGIC_VECTOR (15 downto 0);
           MEM : in  STD_LOGIC_VECTOR (15 downto 0);
			  Addr : out	STD_LOGIC_VECTOR(15 downto 0);
           Control_MEM : in  STD_LOGIC);
	end component;
	component Memory
		Port ( clk	: in	STD_LOGIC;	--时钟信号，访问读写
			  rst: in std_logic;
			  Addr : in  STD_LOGIC_VECTOR (15 downto 0);	--二路选择器送来的地址
           Data : in  STD_LOGIC_VECTOR (15 downto 0);	--从RAM1那条线读出来的数据作为数据传给寄存器堆
           MEM_Ry : in  STD_LOGIC_VECTOR (15 downto 0);	--MEM阶段送来的Ry的值，可能写回MEM[Addr]
           instruction : in  STD_LOGIC_VECTOR (15 downto 0);	--从RAM2读出来的数据作为指令
			  outAddr : out  STD_LOGIC_VECTOR (15 downto 0);	--二路选择器送来的地址
           outData : out  STD_LOGIC_VECTOR (15 downto 0);	--从RAM1那条线读出来的数据作为数据传给寄存器堆
           outMEM_Ry : out  STD_LOGIC_VECTOR (15 downto 0);	--MEM阶段送来的Ry的值，可能写回MEM[Addr]
           outinstruction : out  STD_LOGIC_VECTOR (15 downto 0);	--从RAM2读出来的数据作为指令
           Control_MEM : in  STD_LOGIC_VECTOR (1 downto 0));	--控制访问IR/DR以及访问DR的读/写
	end component;
	component parseCtrl
		Port ( clk : in  STD_LOGIC;
			  rst : in  STD_LOGIC;
           instruction : in  STD_LOGIC_VECTOR (15 downto 0);
           PC : in  STD_LOGIC_VECTOR (15 downto 0);
           Break : in  STD_LOGIC;
           out_instruction : out  STD_LOGIC_VECTOR (15 downto 0);
			  Ctrl_xy : out  STD_LOGIC;
           Ctrl_immidiate : out  STD_LOGIC_VECTOR (2 downto 0);
           Ctrl_extend : out  STD_LOGIC;
           Ctrl_SP : out  STD_LOGIC_VECTOR (1 downto 0);
           Ctrl_imm_ry : out	STD_LOGIC;
           Ctrl_IH : out  STD_LOGIC_VECTOR (1 downto 0);
           Ctrl_r : out  STD_LOGIC_VECTOR (1 downto 0);
           Ctrl_WB : out  STD_LOGIC;
           Ctrl_op1 : out  STD_LOGIC;
           Ctrl_op2 : out  STD_LOGIC;
           Ctrl_op : out  STD_LOGIC_VECTOR (3 downto 0);
           Ctrl_addr : out  STD_LOGIC_VECTOR (1 downto 0);
           Ctrl_PCMEM : out  STD_LOGIC;
           Ctrl_DRRE : out  STD_LOGIC;
           Ctrl_judge : out  STD_LOGIC;
           Ctrl_b : out  STD_LOGIC;
           Ctrl_Jump : out  STD_LOGIC;
			  out_Rx1: out std_logic_vector(2 downto 0);
			  out_Ry1: out std_logic_vector(2 downto 0);
			  out_Rx2: out std_logic_vector(2 downto 0);
			  out_Ry2: out std_logic_vector(2 downto 0);
			  out_Rz: out std_logic_vector(2 downto 0);
			  out_imm: out std_logic_vector(10 downto 0);
			  out_PC: out std_logic_vector(15 downto 0));
	end component;
	component Rxyz_MUX
		Port ( Rx : in  STD_LOGIC_VECTOR (2 downto 0);
           Ry : in  STD_LOGIC_VECTOR (2 downto 0);
           Rz : in  STD_LOGIC_VECTOR (2 downto 0);
           ND : out  STD_LOGIC_VECTOR (2 downto 0);
           Control_r : in  STD_LOGIC_VECTOR (1 downto 0));
	end component;
	component immidiate_mux_extend
		Port ( imm : in  STD_LOGIC_VECTOR (10 downto 0);
           imm_to_Reg : out  STD_LOGIC_VECTOR (15 downto 0);
           Control_i : in  STD_LOGIC_VECTOR (2 downto 0);
           Control_e : in  STD_LOGIC);
	end component;
	component Main_Reg
		Port ( instruction : in  STD_LOGIC_VECTOR (15 downto 0);
			  rst: in STD_LOGIC;
           Rx : in  STD_LOGIC_VECTOR (2 downto 0);
           Ry : in  STD_LOGIC_VECTOR (2 downto 0);
           ND : in  STD_LOGIC_VECTOR (2 downto 0);
           NI : in  STD_LOGIC_VECTOR (15 downto 0);
           imm : in  STD_LOGIC_VECTOR (15 downto 0);
           Reg1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Reg2 : out  STD_LOGIC_VECTOR (15 downto 0);
           RegND : out  STD_LOGIC_VECTOR (3 downto 0);
           RegND_WB : in  STD_LOGIC_VECTOR (3 downto 0);
           Data_Ry : out  STD_LOGIC_VECTOR (15 downto 0);
           Result_EX : in  STD_LOGIC_VECTOR (15 downto 0);
           Result_MEM : in  STD_LOGIC_VECTOR (15 downto 0);
           Control_ctrl : in  STD_LOGIC_VECTOR (1 downto 0);
           Control_SP : in  STD_LOGIC_VECTOR (1 downto 0);
           Control_IH : in  STD_LOGIC_VECTOR (1 downto 0);
			  Control_imm_ry : in std_logic;			 
           Control_B : in  STD_LOGIC;
           Control_WB : in  STD_LOGIC;
			  Control_XY : in  STD_LOGIC;	--写回的数据是Rx还是Ry
           Control_BJ : out  STD_LOGIC);
	end component;
	component IDEX_Reg
		Port ( clk : in  STD_LOGIC;
			  rst: in std_logic;
           PC : in  STD_LOGIC_VECTOR (15 downto 0);
			  outPC : out  STD_LOGIC_VECTOR (15 downto 0);
           break : in  STD_LOGIC;
           Reg1 : in  STD_LOGIC_VECTOR (15 downto 0);
           Reg2 : in  STD_LOGIC_VECTOR (15 downto 0);
           RegND : in  STD_LOGIC_VECTOR (3 downto 0);
           Data_Ry : in  STD_LOGIC_VECTOR (15 downto 0);
           Control_WB : in  STD_LOGIC;
           Control_op1 : in  STD_LOGIC;
           Control_op2 : in  STD_LOGIC;
           Control_op : in  STD_LOGIC_VECTOR (3 downto 0);
           Control_addr : in  STD_LOGIC_VECTOR (1 downto 0);
           Control_PCMEM : in  STD_LOGIC;
           Control_DRRE : in  STD_LOGIC;
			  outReg1 : out  STD_LOGIC_VECTOR (15 downto 0);
           outReg2 : out  STD_LOGIC_VECTOR (15 downto 0);
           outRegND : out  STD_LOGIC_VECTOR (3 downto 0);
           outData_Ry : out  STD_LOGIC_VECTOR (15 downto 0);
           outControl_WB : out  STD_LOGIC;
           outControl_op1 : out  STD_LOGIC;
           outControl_op2 : out  STD_LOGIC;
           outControl_op : out  STD_LOGIC_VECTOR (3 downto 0);
           outControl_addr : out  STD_LOGIC_VECTOR (1 downto 0);
           outControl_PCMEM : out  STD_LOGIC;
           outControl_DRRE : out  STD_LOGIC;
           Control_BJ : in  STD_LOGIC;
           Control_Jump : in  STD_LOGIC;
			  Control_ctrl_JJ:out STD_LOGIC;
           Control_JJ : out  STD_LOGIC);
	end component;
	component ALU1_MUX
		Port ( PC : in  STD_LOGIC_VECTOR (15 downto 0);
           Reg1 : in  STD_LOGIC_VECTOR (15 downto 0);
           ALU1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Control_op1 : in  STD_LOGIC);
	end component;
	component ALU2_MUX
		Port ( Reg2 : in  STD_LOGIC_VECTOR (15 downto 0);
           ALU2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Control_op2 : in  STD_LOGIC);
	end component;
	component ALU
		Port ( ALU1 : in  STD_LOGIC_VECTOR (15 downto 0);
           ALU2 : in  STD_LOGIC_VECTOR (15 downto 0);
           result : out  STD_LOGIC_VECTOR (15 downto 0);
			  result_to_PC : out STD_LOGIC_VECTOR(15 downto 0);
			  result_to_Reg : out STD_LOGIC_VECTOR(15 downto 0);
           Control_op : in  STD_LOGIC_VECTOR (3 downto 0));
	end component;
	component EX_MEM
		Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           Break : in  STD_LOGIC;
           WDATA : in  STD_LOGIC_VECTOR (15 downto 0); -- 写入内存的数据
           Result : in  STD_LOGIC_VECTOR (15 downto 0);
           Ctrl_WB : in  STD_LOGIC;
           Ctrl_addr : in  STD_LOGIC_VECTOR (1 downto 0);
           Ctrl_PCMEM : in  STD_LOGIC;
           Ctrl_DRRE : in  STD_LOGIC;
			  RegND : in  STD_LOGIC_VECTOR (3 DOWNTO 0);
			  out_WDATA : out  STD_LOGIC_VECTOR (15 downto 0); -- 写入内存的数据
           out_Result : out  STD_LOGIC_VECTOR (15 downto 0);
           out_Ctrl_WB : out  STD_LOGIC;
           out_Ctrl_addr : out  STD_LOGIC_VECTOR (1 downto 0);
           out_Ctrl_PCMEM : out  STD_LOGIC;
           out_Ctrl_DRRE : out  STD_LOGIC;
			  out_RegND : out  STD_LOGIC_VECTOR (3 DOWNTO 0);
			  out_Result_Reg : out STD_LOGIC_VECTOR(15 downto 0)
			);
	end component;
	component MEM_WB
		Port ( clk : in  STD_LOGIC;
           Break : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  Result : in  STD_LOGIC_VECTOR (15 DOWNTO 0); -- ALU计算结果
           Ctrl_WB : in  STD_LOGIC;
           Ctrl_DRRE : in  STD_LOGIC;
			  RegND : in  STD_LOGIC_VECTOR (3 DOWNTO 0);
           out_Ctrl_WB : out  STD_LOGIC;
           out_Ctrl_DRRE : out  STD_LOGIC;
           Data_Reg : out  STD_LOGIC_VECTOR (15 downto 0); -- 输出给寄存器堆
			  out_RegND : out  STD_LOGIC_VECTOR (3 DOWNTO 0)
			);
	end component;
	component WB_Reg_MUX
		Port ( Data_DR : in  STD_LOGIC_VECTOR (15 downto 0);
           Data_WB : in  STD_LOGIC_VECTOR (15 downto 0);
           Data_NI : out  STD_LOGIC_VECTOR (15 downto 0);
           Control_WB : in  STD_LOGIC);
	end component;
	component ctrl
		Port ( clk : in  STD_LOGIC;
			  rst : in  STD_LOGIC;
           instruction : in  STD_LOGIC_VECTOR (15 downto 0);
           Control_ctrl_JJ : in  STD_LOGIC;
           Control_PC : out  STD_LOGIC;
           Control_IF : out  STD_LOGIC;
           Control_ID : out  STD_LOGIC;
           Control_EX : out  STD_LOGIC;
           Control_MEM : out  STD_LOGIC;
           Control_Reg : out  STD_LOGIC_VECTOR (1 downto 0));
	end component;
	signal p1, p2, p3: std_logic_vector(15 downto 0);	--PC的PC_to_add/PC_IF/PC_EX
	signal p4: std_logic_vector(15 downto 0);	--PC_ALU的PC_4
	signal p5: std_logic_vector(15 downto 0);	--PC_EX_MUX的result
	signal p6: std_logic_vector(15 downto 0);	--Addr_MUX的Addr
	signal p7, p8, p9, p10: std_logic_vector(15 downto 0);	--Memory的outAddr/outData/outMEM_Ry/outinstruction
	signal p11, p35: std_logic_vector(15 downto 0);	--parseCtrl的out_instruction/out_PC
	signal p12, p14, p16, p19, p20, p21, p24, p25, p26, p27, p28: std_logic;	--Ctrl_xy/Ctrl_extend/Ctrl_imm_ry/Ctrl_WB/Ctrl_op1/Ctrl_op2/Ctrl_PCMEM/Ctrl_DRRE/Ctrl_judge/Ctrl_b/Ctrl_Jump
	signal p13, p29, p30, p31, p32, p33: std_logic_vector(2 downto 0);	--Ctrl_immidiate/out_Rx1/out_Ry1/out_Rx2/out_Ry2/out_Rz
	signal p15, p17, p18, p23: std_logic_vector(1 downto 0);	--Ctrl_SP/Ctrl_IH/Crtl_r/Ctrl_addr
	signal p22: std_logic_vector(3 downto 0);	--Ctrl_op
	signal p34: std_logic_vector(10 downto 0);	--out_imm
	signal q1: std_logic_vector(2 downto 0);	--Rxyz_MUX的ND
	signal q2: std_logic_vector(15 downto 0);	--immidiate_mux_extend的imm_to_Reg
	signal q3, q4, q6: std_logic_vector(15 downto 0);	--Main_Reg的Reg1/Reg2/Data_Ry
	signal q5: std_logic_vector(3 downto 0);	--RegND
	signal q7: std_logic;	--Control_BJ
	signal w1, w2, w3, w5: std_logic_vector(15 downto 0);	--IDEX_Reg的outPC/outReg1/outReg2/outData_Ry
	signal w4, w9: std_logic_vector(3 downto 0);	--outRegND/outControl_op/
	signal w6, w7, w8, w11, w12, w13, w14: std_logic;	--outControl_WB/outControl_op1/outControl_op2/outControl_PCMEM/outControl_DRRE/Control_ctrl_JJ/Control_JJ
	signal w10: std_logic_vector(1 downto 0);	--outControl_addr
	signal e1: std_logic_vector(15 downto 0);	--ALU1_MUX的ALU1
	signal e2: std_logic_vector(15 downto 0);	--ALU2_MUX的ALU2
	signal e3, e4, e5: std_logic_vector(15 downto 0);	--ALU的result/result_to_PC/result_to_Reg
	signal t1, t2, t8: std_logic_vector(15 downto 0);	--EX_MEM的out_WDATA/out_Result/out_Result_Reg
	signal t3, t5, t6: std_logic;	--out_Ctrl_WB/out_Ctrl_PCMEM/out_Ctrl_DRRE
	signal t4: std_logic_vector(1 downto 0);	--out_Ctrl_addr
	signal t7: std_logic_vector(3 downto 0);	--out_RegND
	signal y1, y2: std_logic;	--MEM_WB的out_Ctrl_WB/out_Ctrl_DRRE
	signal y3: std_logic_vector(15 downto 0);	--Data_Reg
	signal y4: std_logic_vector(3 downto 0);	--out_RegND
	signal z1: std_logic_vector(15 downto 0);	--WB_Reg_MUX的Data_NI
	signal x1, x2, x3, x4, x5: std_logic;	--ctrl的control_PC/control_IF/control_ID/control_EX/control_MEM
	signal x6: std_logic_vector(1 downto 0);	--Control_Reg
begin
	u1:PC PORT MAP(clk, rst, x1, p5, p1, p2, p3);
	u2:PC_ALU PORT MAP(p1, p4);
	u3:PC_EX_MUX PORT MAP(p4, e4, p5, w14);
	u4:Addr_MUX PORT MAP(p2, t1, p6, t5);	--p2=PC,t1=MEM不需要选择，直接给Memory，去掉这个选择器
	u5:Memory PORT MAP(clk, rst, p6, "0000000000000000", "0000000000000000", "0000000000000000", p7, p8, p9, p10, t4);	--Data/MEM_Ry/instruction
	u6:parseCtrl PORT MAP(clk, rst, p10, p3, x2, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24, p25, p26, p27, p28, p29, p30, p31, p32, p33, p34, p35);
	u7:Rxyz_MUX PORT MAP(p31, p32, p33, q1, p18);
	u8:immidiate_mux_extend PORT MAP(p34, q2, p13, p14);
	u9:Main_Reg PORT MAP(p11, rst, p29, p30, q1, z1, q2, q3, q4, q5, y4, q6, e5, t8, x6, p15, p17, p16, p27, y1, p12, q7);
	u10:IDEX_Reg PORT MAP(clk, rst, p35, w1, x3, q3, q4, q5, q6, p19, p20, p21, p22, p23, p24, p25, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, q7, p28, w13, w14);
	u11:ALU1_MUX PORT MAP(w1, w2, e1, w7);
	u12:ALU2_MUX PORT MAP(w3, e2, w8);
	u13:ALU PORT MAP(e1, e2, e3, e4, e5, w9);
	u14:EX_MEM PORT MAP(clk, rst, x4, w5, e3, w6, w10, w11, w12, w4, t1, t2, t3, t4, t5, t6, t7, t8);
	u15:MEM_WB PORT MAP(clk, x5, rst, t2, t3, t6, t7, y1, y2, y3, y4);
	u16:WB_Reg_MUX PORT MAP(p8, y3, z1, y2);
	u17:ctrl PORT MAP(clk, rst, p11, w13, x1, x2, x3, x4, x5, x6);
	PCout<=p10;
end Behavioral;

