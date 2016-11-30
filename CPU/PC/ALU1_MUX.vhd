----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:57:53 11/22/2016 
-- Design Name: 
-- Module Name:    ALU1_MUX - Behavioral 
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

entity ALU1_MUX is
    Port ( PC : in  STD_LOGIC_VECTOR (15 downto 0);
           Reg1 : in  STD_LOGIC_VECTOR (15 downto 0);
           ALU1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Control_op1 : in  STD_LOGIC);
end ALU1_MUX;

architecture Behavioral of ALU1_MUX is
shared variable out1: std_logic_vector(15 downto 0);
begin
	process(Control_op1, PC, Reg1)
	begin
		if(Control_op1='0')then
			out1:=Reg1;
		else
			out1:=PC;
		end if;
		ALU1<=out1;
	end process;

end Behavioral;

