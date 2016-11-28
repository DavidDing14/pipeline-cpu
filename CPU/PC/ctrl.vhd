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
           Control_Reg : out  STD_LOGIC_VECTOR (1 downto 0));
end ctrl;

architecture Behavioral of ctrl is
shared variable ins1, ins2, ins3, ins4: std_logic_vector(15 downto 0):="0000000000000000";		--4个指令，按顺序1~4依次为ID/EX/MEM/WB阶段的指令
signal ins5: integer;
begin
	process(clk, rst)
	variable c1, c2, c3, c4, c5: std_logic:='0';
	variable c6: std_logic_vector(1 downto 0):="00";
	variable num: integer:=0;
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
			num:=0;
		elsif(clk'event and clk='1')then
			ins4:=ins3;
			ins4:=ins2;
			ins2:=ins1;
			ins1:=instruction;
			if(Control_ctrl_JJ='1')then	--跳转指令清空ID
				c3:='1';
			else
				c3:='0';
			end if;
		end if;
		Control_PC<=c1;
		Control_IF<=c2;
		Control_ID<=c3;
		Control_EX<=c4;
		Control_MEM<=c5;
		Control_Reg<=c6;
		ins5<=num;
	end process;

end Behavioral;

