----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:43:00 11/21/2016 
-- Design Name: 
-- Module Name:    WB_Reg_MUX - Behavioral 
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

entity WB_Reg_MUX is
    Port ( Data_DR : in  STD_LOGIC_VECTOR (15 downto 0);
           Data_WB : in  STD_LOGIC_VECTOR (15 downto 0);
           Data_NI : out  STD_LOGIC_VECTOR (15 downto 0);
           Control_WB : in  STD_LOGIC);
end WB_Reg_MUX;

architecture Behavioral of WB_Reg_MUX is

begin
	process(Data_DR, Data_WB, Control_WB)
	begin
		if(Control_WB='0')then
			Data_NI<=Data_DR;
		else
			Data_NI<=Data_WB;
		end if;
	end process;

end Behavioral;

