----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:57:08 11/22/2016 
-- Design Name: 
-- Module Name:    ctrl - Behavioral 
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

entity ctrl is
    Port ( clk : in  STD_LOGIC;
			  rst : in  STD_LOGIC;
           instruction : in  STD_LOGIC_VECTOR (15 downto 0);
           Control_ctrl_JJ : in  STD_LOGIC;
           Control_PC : out  STD_LOGIC;
           Control_IF : out  STD_LOGIC;
           Control_ID : out  STD_LOGIC;
           Control_EX : out  STD_LOGIC;
           Control_MEM : out  STD_LOGIC;
           Control_Reg : out  STD_LOGIC_VECTOR (1 downto 0);
			  Control_Reg1 : out STD_LOGIC_VECTOR (1 downto 0);
			  Control_data : out STD_LOGIC_VECTOR (1 downto 0);	--控制写回内存的数据需不需要旁路
			  pause_pc : out STD_LOGIC;
			  pause_if : out STD_LOGIC;
			  pause_id : out STD_LOGIC;
			  pause_ex : out STD_LOGIC;
			  pause_mem : out STD_LOGIC);	
end ctrl;

architecture Behavioral of ctrl is
shared variable ins1, ins2, ins3, ins4: std_logic_vector(15 downto 0):="0000000000000000";		--4个指令，按顺序1~4依次为ID/EX/MEM/WB阶段的指令
shared variable c1, c2, c3, c4, c5: std_logic;
shared variable c6, c7, c8: std_logic_vector(1 downto 0);	--Control_Reg, Control_Reg1, Control_data
shared variable p1, p2, p3, p4, p5: std_logic;
shared variable i10, i11, i12, i13, i20, i21, i22, i23, i30, i31, i32, i33: std_logic_vector(3 downto 0);
shared variable flag1, flag2, flag3: integer;
shared variable num, num2, ctrl_ins: integer;
begin
	process(clk, rst, instruction)
	begin
		if(rst='0')then
			ins1:="0000000000000000";
			ins2:="0000000000000000";
			ins3:="0000000000000000";
			ins4:="0000000000000000";
			c1:='0';
			c2:='0';
			c3:='0';
			c4:='0';
			c5:='0';
			c6:="00";
			c7:="00";
			c8:="00";
			p1:='0';
			p2:='0';
			p3:='0';
			p4:='0';
			p5:='0';
			flag1:=0;
			flag2:=0;
			flag3:=0;
			num:=0;
			num2:=0;
			ctrl_ins:=0;
		elsif(clk'event and clk='0')then
			if(Control_ctrl_JJ='1')then	--下降沿跳转指令清空ID
				c2:='1';
				c3:='1';
			else
				c2:='0';
				c3:='0';
			--end if;
			if(ctrl_ins=0)then
				ins4:=ins3;
				ins3:=ins2;
				ins2:=ins1;
				ins1:=instruction;
			else
				ctrl_ins:=ctrl_ins-1;
			end if;
			--只有前三条指令处理数据冲突，即ins1(ID),ins2(EX),ins3(MEM)
			i10:=ins1(15 downto 12);
			i11:=ins1(11 downto 8);
			i12:=ins1(7 downto 4);
			i13:=ins1(3 downto 0);
			i20:=ins2(15 downto 12);
			i21:=ins2(11 downto 8);
			i22:=ins2(7 downto 4);
			i23:=ins2(3 downto 0);
			i30:=ins3(15 downto 12);
			i31:=ins3(11 downto 8);
			i32:=ins3(7 downto 4);
			i33:=ins3(3 downto 0);
			if(i10="1010" or i10="1011")then	--LW/judge
				if(i10="1010")then	--LW
					ins1:="1111111111111111";
					p1:='1';
					c2:='1';
					num:=3;
				elsif(i10="1011")then	--judge
					ins1:="1111111111111111";
					p1:='1';
					p2:='1';
					num2:=3;
					ctrl_ins:=4;
				end if;
			elsif(num>0 or num2>0)then
				if(num>0)then
					p1:='1';
					c2:='1';
					num:=num-1;
				elsif(num2>0)then
					p1:='1';
					p2:='1';
					c3:='1';
					num2:=num2-1;
				end if;
			else
				p1:='0';
				p2:='0';
				c2:='0';
				c3:='0';
				if(i23/="1111" or i33/="1111")then	
					if(i23/="1111" and i33/="1111")then
						if(i33=i11)then
							c6:="10";
							flag1:=1;
						end if;
						if(i33=i12)then
							c7:="10";
							flag2:=1;
						end if;
						if(i33=i10)then
							c8:="10";
							flag3:=1;
						end if;
						if(i23=i11)then
							c6:="01";
							flag1:=1;
						end if;
						if(i23=i12)then
							c7:="01";
							flag2:=1;
						end if;
						if(i23=i10)then
							c8:="01";
							flag3:=1;
						end if;
					elsif(i23/="1111" and i33="1111")then
						if(i23=i11)then
							c6:="01";
							flag1:=1;
						end if;
						if(i23=i12)then
							c7:="01";
							flag2:=1;
						end if;
						if(i23=i10)then
							c8:="01";
							flag3:=1;
						end if;
					elsif(i23="1111" and i33/="1111")then
						if(i33=i11)then
							c6:="10";
							flag1:=1;
						end if;
						if(i33=i12)then
							c7:="10";
							flag2:=1;
						end if;
						if(i33=i10)then
							c8:="10";
							flag3:=1;
						end if;
					end if;
				else
					c6:="00";
					c7:="00";
					c8:="00";
				end if;
				if(flag1=1)then
					flag1:=0;
				else
					c6:="00";
				end if;
				if(flag2=1)then
					flag2:=0;
				else
					c7:="00";
				end if;
				if(flag3=1)then
					flag3:=0;
				else
					c8:="00";
				end if;
			end if;
			end if;
		end if;
		Control_PC<=c1;
		Control_IF<=c2;
		Control_ID<=c3;
		Control_EX<=c4;
		Control_MEM<=c5;
		Control_Reg<=c6;
		Control_Reg1<=c7;
		Control_data<=c8;
		pause_pc<=p1;
		pause_if<=p2;
		pause_id<=p3;
		if(num2>0)then
			pause_ex<='1';
		else
			pause_ex<='0';
		end if;
		if(num>0)then
			pause_mem<='1';
		else
			pause_mem<='0';
		end if;
	end process;

end Behavioral;

