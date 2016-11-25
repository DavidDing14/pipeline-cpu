----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:15:56 11/21/2016 
-- Design Name: 
-- Module Name:    Rxyz_MUX - Behavioral 
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

entity Rxyz_MUX is
    Port ( Rx : in  STD_LOGIC_VECTOR (2 downto 0);
           Ry : in  STD_LOGIC_VECTOR (2 downto 0);
           Rz : in  STD_LOGIC_VECTOR (2 downto 0);
           ND : out  STD_LOGIC_VECTOR (2 downto 0);
           Control_r : in  STD_LOGIC_VECTOR (1 downto 0));
end Rxyz_MUX;

architecture Behavioral of Rxyz_MUX is

begin
	process(Rx, Ry, Rz, Control_r)
	begin
		case Control_r is
			when "00"=>
				ND<=Rz;
			when "01"=>
				ND<=Ry;
			when "10"=>
				ND<=Rx;
			when others=>
				null;
		end case;
	end process;

end Behavioral;

