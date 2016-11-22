----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:00:58 11/22/2016 
-- Design Name: 
-- Module Name:    ALU2_MUX - Behavioral 
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

entity ALU2_MUX is
    Port ( Reg2 : in  STD_LOGIC_VECTOR (15 downto 0);
           ALU2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Control_op2 : in  STD_LOGIC_VECTOR (1 downto 0));
end ALU2_MUX;

architecture Behavioral of ALU2_MUX is

begin
	process(Reg2, Control_op2)
	variable out2: std_logic_vector(15 downto 0):="0000000000000000";
	begin
		if(Control_op2="00")then
			out2:=Reg2;
		elsif(Control_op2="01")then
			out2:="0000000000001000";
		else	--第二个操作数为0
			out2:="0000000000000000";
		end if;
		ALU2<=out2;
	end process;

end Behavioral;

