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
           Ctrl_CMP : out  STD_LOGIC_VECTOR (1 downto 0);
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
			  out_imm: out std_logic_vector(10 downto 0));
	end component;
	signal p1, p2, p3: std_logic_vector(15 downto 0);	--PC的PC_to_add/PC_IF/PC_EX
	signal p4: std_logic_vector(15 downto 0);	--PC_ALU的PC_4
	signal p5: std_logic_vector(15 downto 0);	--PC_EX_MUX的result
	signal p6: std_logic_vector(15 downto 0);	--Addr_MUX的Addr
	signal p7, p8, p9, p10: std_logic_vector(15 downto 0);	--Memory的outAddr/outData/outMEM_Ry/outinstruction
	signal p11: std_logic_vector(15 downto 0);	--out_instruction
	signal p12, p14, p19, p20, p21, p24, p25, p26, p27, p28: std_logic;	--Ctrl_xy/Ctrl_extend/Ctrl_WB/Ctrl_op1/Ctrl_op2/Ctrl_PCMEM/Ctrl_DRRE/Ctrl_judge/Ctrl_b/Ctrl_Jump
	signal p13, p29, p30, p31, p32, p33: std_logic_vector(2 downto 0);	--Ctrl_immidiate/out_Rx1/out_Ry1/out_Rx2/out_Ry2/out_Rz
	signal p15, p16, p17, p18, p23: std_logic_vector(1 downto 0);	--Ctrl_SP/Ctrl_CMP/Ctrl_IH/Crtl_r/Ctrl_addr
	signal p22: std_logic_vector(3 downto 0);	--Ctrl_op
	signal p34: std_logic_vector(10 downto 0);	--out_imm
begin
	u1:PC PORT MAP(clk, rst, '0', p5, p1, p2, p3);	--break
	u2:PC_ALU PORT MAP(p1, p4);
	u3:PC_EX_MUX PORT MAP(p4, "0000000000000000", p5, '0');	--EX_result/Control_EX
	u4:Addr_MUX PORT MAP(p2, "0000000000000000", p6, '0');	--MEM/Control_MEM
	u5:Memory PORT MAP(clk, rst, p6, "0000000000000000", "0000000000000000", "0000000000000000", p7, p8, p9, p10, "00");	--Data/MEM_Ry/instruction
	u6:parseCtrl PORT MAP(clk, rst, p10, p3, '0', p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24, p25, p26, p27, p28, p29, p30, p31, p32, p33, p34);	--break
	PCout<=p10;
end Behavioral;

