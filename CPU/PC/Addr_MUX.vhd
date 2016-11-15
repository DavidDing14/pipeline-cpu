----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:26:41 11/15/2016 
-- Design Name: 
-- Module Name:    Addr_MUX - Behavioral 
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

entity Addr_MUX is
    Port ( PC : in  STD_LOGIC_VECTOR (15 downto 0);
           MEM : in  STD_LOGIC_VECTOR (15 downto 0);
			  Addr : out	STD_LOGIC_VECTOR(15 downto 0);
           Control_MEM : in  STD_LOGIC);
end Addr_MUX;

architecture Behavioral of Addr_MUX is

begin
	process(PC, MEM, Control_MEM)
	begin
		if(Control_MEM='0')then
			Addr<=PC;
		else
			Addr<=MEM;
		end if;
	end process;
end Behavioral;

