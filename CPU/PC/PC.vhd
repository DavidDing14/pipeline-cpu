----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:41:47 11/15/2016 
-- Design Name: 
-- Module Name:    PC - Behavioral 
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

entity PC is
    Port ( clk : in  STD_LOGIC;
           break : in  STD_LOGIC;
           next_PC : in  STD_LOGIC_VECTOR (15 downto 0);
           PC_to_add : out  STD_LOGIC_VECTOR (15 downto 0);
           PC_IF : out  STD_LOGIC_VECTOR (15 downto 0);
           PC_EX : out  STD_LOGIC_VECTOR (15 downto 0));
end PC;

architecture Behavioral of PC is

begin
	process(clk)
		variable var_PC:std_logic_vector(15 downto 0):="0000000000000000";
	begin
		if(clk'event and clk='1')then	--时钟上升沿触发下一条指令地址的读入
			if(break='1')then	--中断信号为1则中断操作一次
				null;	--break变0由控制模块主导
			else
				var_PC:=next_PC;	--将PC的值输入
			end if;
		end if;
		PC_to_add<=var_PC;
		PC_IF<=var_PC;
		PC_EX<=var_PC;
	end process;
end Behavioral;

