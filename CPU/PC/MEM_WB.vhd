----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:28:16 11/23/2016 
-- Design Name: 
-- Module Name:    MEM_WB - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MEM_WB is
    Port ( clk : in  STD_LOGIC;
           Break : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  Result : in  STD_LOGIC_VECTOR (15 DOWNTO 0); -- ALU计算结果
           Ctrl_WB : in  STD_LOGIC;
           Ctrl_DRRE : in  STD_LOGIC;
           out_Ctrl_WB : out  STD_LOGIC;
           out_Ctrl_DRRE : out  STD_LOGIC;
           Data_Reg : out  STD_LOGIC_VECTOR (15 downto 0) -- 输出给寄存器堆
			);
end MEM_WB;

architecture Behavioral of MEM_WB is

begin
	process (clk,rst, Break)
	begin
		if (rst'event and rst='1') then
			out_Ctrl_WB <= '0';
			out_Ctrl_DRRE <= '0';
			Data_Reg <= "0000000000000000";
		else
			out_Ctrl_WB <= Ctrl_WB;
			out_Ctrl_DRRE <= Ctrl_DRRE;
			Data_Reg <= Result;
		end if;
	end process;

end Behavioral;

