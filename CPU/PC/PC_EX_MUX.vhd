----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:52:45 11/15/2016 
-- Design Name: 
-- Module Name:    PC_EX_MUX - Behavioral 
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

entity PC_EX_MUX is
    Port ( PC_ALU : in  STD_LOGIC_VECTOR (15 downto 0);
           EX_result : in  STD_LOGIC_VECTOR (15 downto 0);
           result : out  STD_LOGIC_VECTOR (15 downto 0);
           Control_EX : in  STD_LOGIC);
end PC_EX_MUX;

architecture Behavioral of PC_EX_MUX is

begin
	process(PC_ALU, EX_result, Control_EX)
	begin
		if(Control_EX='0')then
			result<=PC_ALU;
		else
			result<=EX_result;
		end if;
	end process;

end Behavioral;

