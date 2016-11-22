----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:50:32 11/21/2016 
-- Design Name: 
-- Module Name:    IDEX_Reg - Behavioral 
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
use IEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IDEX_Reg is
    Port ( clk : in  STD_LOGIC;
			  rst: in std_logic;
           PC : inout  STD_LOGIC_VECTOR (15 downto 0);
           break : in  STD_LOGIC;
           Reg1 : inout  STD_LOGIC_VECTOR (15 downto 0);
           Reg2 : inout  STD_LOGIC_VECTOR (15 downto 0);
           RegND : inout  STD_LOGIC_VECTOR (3 downto 0);
           Data_Ry : inout  STD_LOGIC_VECTOR (15 downto 0);
           Control_WB : inout  STD_LOGIC;
           Control_op1 : inout  STD_LOGIC;
           Control_op2 : inout  STD_LOGIC_VECTOR (1 downto 0);
           Control_op : inout  STD_LOGIC_VECTOR (3 downto 0);
           Control_addr : inout  STD_LOGIC_VECTOR (1 downto 0);
           Control_PCMEM : inout  STD_LOGIC;
           Control_DRRE : inout  STD_LOGIC;
           Control_BJ : in  STD_LOGIC;
           Control_Jump : in  STD_LOGIC;
			  Control_ctrl_JJ:out STD_LOGIC;
           Control_JJ : out  STD_LOGIC);
end IDEX_Reg;

architecture Behavioral of IDEX_Reg is

begin
	process(clk, rst)
	variable r1, r2, ry, rpc: std_logic_vector(15 downto 0);	--reg1, reg2, data_ry
	variable rnd: std_logic_vector(3 downto 0);	--RegND
	variable c0, c1, c5, c6: std_logic;	--Control_WB, Control_op1, Control_PCMEM, Control_DRRE
	variable c2, c4: std_logic_vector(1 downto 0);	--Control_op2, Control_addr
	variable c3: std_logic_vector(3 downto 0);	--Control_op
	variable c7, c8: std_logic;	--Control_JJ, Control_ctrl_JJ
	begin
		if(rst='0')then
			r1:="0000000000000000";
			r2:="0000000000000000";
			ry:="0000000000000000";
			rpc:="0000000000000000";
			rnd:="1111";
			c0:='0';
			c1:='0';
			c2:="00";
			c3:="0000";
			c4:="00";
			c5:='0';
			c6:='0';
			c7:='0';
			c8:='0';
		elsif(clk'event and clk='1')then
			if(break='1')then	--暂停信号为1，清空数据
				r1:="0000000000000000";
				r2:="0000000000000000";
				ry:="0000000000000000";
				rpc:="0000000000000000";
				rnd:="1111";
				c0:='0';
				c1:='0';
				c2:="00";
				c3:="0000";
				c4:="00";
				c5:='0';
				c6:='0';
				c7:='0';
				c8:='0';
			else
				r1:=Reg1;
				r2:=Reg2;
				ry:=Data_Ry;
				rpc:=PC;
				rnd:=RegND;
				c0:=Control_WB;
				c1:=Control_op1;
				c2:=Control_op2;
				c3:=Control_op;
				c4:=Control_addr;
				c5:=Control_PCMEM;
				c6:=Control_DRRE;
--根据Control_BJ和Control_Jump来判断Control_JJ和Control_ctrl_JJ
				if(Control_BJ='1' or Control_Jump='1')then
					c7:='1';
					c8:='1';
				else
					c7:='0';
					c8:='0';
				end if;
			end if;
		end if;
		Reg1<=r1;
		Reg2<=r2;
		Data_Ry<=ry;
		PC<=rpc;
		RegND<=rnd;
		Control_WB<=c0;
		Control_op1<=c1;
		Control_op2<=c2;
		Control_op<=c3;
		Control_addr<=c4;
		Control_PCMEM<=c5;
		Control_DRRE<=c6;
		Control_JJ<=c7;
		Control_ctrl_JJ<=c8;
	end process;

end Behavioral;

