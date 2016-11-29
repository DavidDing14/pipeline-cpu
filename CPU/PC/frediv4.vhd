----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:00:05 11/27/2016 
-- Design Name: 
-- Module Name:    frediv4 - Behavioral 
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

entity frediv4 is
    Port ( clk_in : in  STD_LOGIC;
           clk_out : out  STD_LOGIC);
end frediv4;

architecture Behavioral of frediv4 is
signal status: integer range 0 to 2 := 0;
signal q: std_logic;
begin
	process (clk_in)
	begin
		if (clk_in'event and clk_in='1') then
			if (status = 0) then
				status<=1;
				q<=clk_in;
			elsif (status = 2) then
				q <= not q;
				status <= 1;
			else
				status <= status+1;
			end if;
		end if;
	end process;
	clk_out <= q;
end Behavioral;

