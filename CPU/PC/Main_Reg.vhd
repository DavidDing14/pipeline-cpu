----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:05:49 11/21/2016 
-- Design Name: 
-- Module Name:    Main_Reg - Behavioral 
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

entity Main_Reg is
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
			  Control_imm_ry:in std_logic;			 
           Control_B : in  STD_LOGIC;
           Control_WB : in  STD_LOGIC;
           Control_BJ : out  STD_LOGIC);
end Main_Reg;

architecture Behavioral of Main_Reg is
signal R0, R1, R2, R3, R4, R5, R6, R7: std_logic_vector(15 downto 0):="0000000000000000";
signal T: std_logic:='0';
signal SP: std_logic_vector(15 downto 0):="0000000000000000";
signal IH: std_logic_vector(15 downto 0):="0000000000000000";
begin
--ID阶段
	process(rst, instruction, Rx, Ry, ND, imm, Result_EX, Result_MEM, Control_ctrl, Control_SP, Control_IH, Control_B)
	variable g1, g2: std_logic_vector(15 downto 0):="0000000000000000";	--reg1, reg2
	variable g3: std_logic_vector(3 downto 0):="0000";	--regnd
	variable g4, g5: std_logic_vector(15 downto 0):="0000000000000000";	--ry, rx
	variable c1, c3: std_logic:='0';	--Control_BJ, T
	begin
		if(rst='0')then
			g1:="0000000000000000";
			g2:="0000000000000000";
			g3:="0000";
			g4:="0000000000000000";
			g5:="0000000000000000";
			c1:='0';
			c3:='0';
			R0<="0000000000000000";
			R1<="0000000000000000";
			R2<="0000000000000000";
			R3<="0000000000000000";
			R4<="0000000000000000";
			R5<="0000000000000000";
			R6<="0000000000000000";
			R7<="0000000000000000";
			T<='0';
			SP<="0000000000000000";
			IH<="0000000000000000";
		else
			--	--SP在LW_SP和SW_SP中用作Rx,在ADDSP中用作Rx和RegND，在MTSP中用作RegND
--	--IH在MFIH中用作Rx，在MTIH中用作RegND
--	--T在BTEQZ中用作判断，在CMP、SLTI和CMPI中被赋值（在寄存器组完成）
		if(Control_ctrl="00")then	--ctrl模块没有冲突
			if(Control_SP="00" and Control_IH="00")then	--没有用到SP和IH
				case Rx is
					when "000"=>
						g1:=R0;
					when "001"=>
						g1:=R1;
					when "010"=>
						g1:=R2;
					when "011"=>
						g1:=R3;
					when "100"=>
						g1:=R4;
					when "101"=>
						g1:=R5;
					when "110"=>
						g1:=R6;
					when "111"=>
						g1:=R7;
					when others=>
						null;
				end case;
			elsif(Control_SP="01")then	--SP用作Rx
				g1:=SP;
			elsif(Control_SP="11")then	--SP用作Rx和RegND
				g1:=SP;
			elsif(Control_IH="01")then	--IH用作Rx
				g1:=IH;
			end if;
		elsif(Control_ctrl="01")then	--ctrl模块发现间隔1冲突
			g1:=Result_EX;
		elsif(Control_ctrl="10")then	--ctrl模块发现间隔2冲突
			g2:=Result_MEM;
		end if;
-- --extend(imm)在许多指令中用作Ry
		if(Control_imm_ry='0')then
			case Ry is
				when "000"=>
					g2:=R0;
				when "001"=>
					g2:=R1;
				when "010"=>
					g2:=R2;
				when "011"=>
					g2:=R3;
				when "100"=>
					g2:=R4;
				when "101"=>
					g2:=R5;
				when "110"=>
					g2:=R6;
				when "111"=>
					g2:=R7;
				when others=>
					null;
			end case;
		else
			g2:=imm;
		end if;
-- --RegND
		if(Control_SP="00" and Control_IH="00")then
			g3:='0'&ND;
		elsif(Control_SP="10")then		--SP用作RegND
			g3:="1000";	--SP的编号
		elsif(Control_SP="11")then		--SP用作Rx和RegND
			g3:="1000";
		elsif(Control_IH="10")then		--IH用作RegND
			g3:="1001";	--IH的编号
		end if;
--Data_ry
		case Ry is
			when "000"=>
				g4:=R0;
			when "001"=>
				g4:=R1;
			when "010"=>
				g4:=R2;
			when "011"=>
				g4:=R3;
			when "100"=>
				g4:=R4;
			when "101"=>
				g4:=R5;
			when "110"=>
				g4:=R6;
			when "111"=>
				g4:=R7;
			when others=>
				null;
		end case;
--Rx
		case Rx is
			when "000"=>
				g5:=R0;
			when "001"=>
				g5:=R1;
			when "010"=>
				g5:=R2;
			when "011"=>
				g5:=R3;
			when "100"=>
				g5:=R4;
			when "101"=>
				g5:=R5;
			when "110"=>
				g5:=R6;
			when "111"=>
				g5:=R7;
			when others=>
				null;
		end case;
--判断
		if(Control_B='1')then	--需要判断
			case instruction(15 downto 11) is	--判断是什么指令
				when "00100"=>	--BEQZ
					if(g5="0000000000000000")then
						c1:='1';
					else
						c1:='0';
					end if;
				when "00101"=>	--BNEZ
					if(g5="0000000000000000")then
						c1:='0';
					else
						c1:='1';
					end if;
				when "01100"=>	--BTEQZ
					if(T='0')then
						c1:='1';
					else
						c1:='0';
					end if;
				when "11101"=>	--CMP
					if(g5=g4)then
						c3:='0';
					else
						c3:='1';
					end if;
				when "01110"=>	--CMPI
					if(g5=imm)then
						c3:='0';
					else
						c3:='1';
					end if;
--				when "00110"=>	--S系列
--					case instruction(1 downto 0) is
--						when "00"=>	--SLL
--						when "11"=>	--SRA
--						when "10"=>	--SRL
--						when others=>
--							null;
--					end case;
				when "01010"=>	--SLTI
					if(g5<imm)then
						c3:='1';
					else
						c3:='0';
					end if;
				when others=>
					null;
			end case;
		end if;
		end if;
		Reg1<=g1;
		Reg2<=g2;
		RegND<=g3;
		Control_BJ<=c1;
		Data_Ry<=g4;
		T<=c3;
	end process;

	process(NI, RegND_WB, Control_WB)
	begin
		if(Control_WB='1')then	--写回
			case RegND_WB is
				when "0000"=>
					R0<=NI;
				when "0001"=>
					R1<=NI;
				when "0010"=>
					R2<=NI;
				when "0011"=>
					R3<=NI;
				when "0100"=>
					R4<=NI;
				when "0101"=>
					R5<=NI;
				when "0110"=>
					R6<=NI;
				when "0111"=>
					R7<=NI;
				when "1000"=>
					SP<=NI;
				when "1001"=>
					IH<=NI;
				when others=>
					null;
			end case;
		end if;
	end process;
end Behavioral;

