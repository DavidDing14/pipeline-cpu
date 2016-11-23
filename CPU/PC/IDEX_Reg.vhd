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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

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
           PC : in  STD_LOGIC_VECTOR (15 downto 0);
			  outPC : out  STD_LOGIC_VECTOR (15 downto 0);
           break : in  STD_LOGIC;
           Reg1 : in  STD_LOGIC_VECTOR (15 downto 0);
           Reg2 : in  STD_LOGIC_VECTOR (15 downto 0);
           RegND : in  STD_LOGIC_VECTOR (3 downto 0);
           Data_Ry : in  STD_LOGIC_VECTOR (15 downto 0);
           Control_WB : in  STD_LOGIC;
           Control_op1 : in  STD_LOGIC;
           Control_op2 : in  STD_LOGIC_VECTOR (1 downto 0);
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
           outControl_op2 : out  STD_LOGIC_VECTOR (1 downto 0);
           outControl_op : out  STD_LOGIC_VECTOR (3 downto 0);
           outControl_addr : out  STD_LOGIC_VECTOR (1 downto 0);
           outControl_PCMEM : out  STD_LOGIC;
           outControl_DRRE : out  STD_LOGIC;
           Control_BJ : in  STD_LOGIC;
           Control_Jump : in  STD_LOGIC;
			  Control_ctrl_JJ:out STD_LOGIC;
           Control_JJ : out  STD_LOGIC);
end IDEX_Reg;

architecture Behavioral of IDEX_Reg is
begin
	process(clk, rst)
	variable RegPC: std_logic_vector(15 downto 0):="0000000000000000";
	variable RegReg1 : STD_LOGIC_VECTOR (15 downto 0):="0000000000000000";
	variable RegReg2 : STD_LOGIC_VECTOR (15 downto 0):="0000000000000000";
	variable RegRegND : STD_LOGIC_VECTOR (3 downto 0):="1111";
	variable RegData_Ry : STD_LOGIC_VECTOR (15 downto 0):="0000000000000000";
	variable RegControl_WB : STD_LOGIC:='0';
	variable RegControl_op1 : STD_LOGIC:='0';
	variable RegControl_op2 : STD_LOGIC_VECTOR (1 downto 0):="00";
	variable RegControl_op : STD_LOGIC_VECTOR (3 downto 0):="0000";
	variable RegControl_addr : STD_LOGIC_VECTOR (1 downto 0):="00";
	variable RegControl_PCMEM : STD_LOGIC:='0';
	variable RegControl_DRRE : STD_LOGIC:='0';
	variable c7, c8:std_logic:='0';	--Control_JJ, Control_ctrl_JJ
	begin
		if(rst='0')then
			RegPC:="0000000000000000";
			RegReg1:="0000000000000000";
		   RegReg2:="0000000000000000";
			RegData_Ry:="0000000000000000";
			RegRegND:="1111";
			RegControl_WB:='0';
			RegControl_op1:='0';
			RegControl_op2:="00";
			RegControl_op:="0000";
			RegControl_addr:="00";
			RegControl_PCMEM:='0';
			RegControl_DRRE:='0';
			c7:='0';
			c8:='0';
		elsif(clk'event and clk='1')then
			if(break='1')then	--暂停信号为1，清空数据
				RegPC:="0000000000000000";
				RegReg1:="0000000000000000";
				RegReg2:="0000000000000000";
				RegData_Ry:="0000000000000000";
				RegRegND:="1111";
				RegControl_WB:='0';
				RegControl_op1:='0';
				RegControl_op2:="00";
				RegControl_op:="0000";
				RegControl_addr:="00";
				RegControl_PCMEM:='0';
				RegControl_DRRE:='0';
				c7:='0';
				c8:='0';
			else
				RegPC:=PC;
				RegReg1:=Reg1;
				RegReg2:=Reg2;
				RegData_Ry:=Data_Ry;
				RegRegND:=RegND;
				RegControl_WB:=Control_WB;
				RegControl_op1:=Control_op1;
				RegControl_op2:=Control_op2;
				RegControl_op:=Control_op;
				RegControl_addr:=Control_addr;
				RegControl_PCMEM:=Control_PCMEM;
				RegControl_DRRE:=Control_DRRE;
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
		outReg1<=RegReg1;
		outReg2<=RegReg2;
		outData_Ry<=RegData_Ry;
		outPC<=RegPC;
		outRegND<=RegRegND;
		outControl_WB<=RegControl_WB;
		outControl_op1<=RegControl_op1;
		outControl_op2<=RegControl_op2;
		outControl_op<=RegControl_op;
		outControl_addr<=RegControl_addr;
		outControl_PCMEM<=RegControl_PCMEM;
		outControl_DRRE<=RegControl_DRRE;
		Control_JJ<=c7;
		Control_ctrl_JJ<=c8;
	end process;

end Behavioral;

