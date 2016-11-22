----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:04:59 11/22/2016 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

entity ALU is
    Port ( ALU1 : in  STD_LOGIC_VECTOR (15 downto 0);
           ALU2 : in  STD_LOGIC_VECTOR (15 downto 0);
           result : out  STD_LOGIC_VECTOR (15 downto 0);
           Control_op : in  STD_LOGIC_VECTOR (3 downto 0));
end ALU;

architecture Behavioral of ALU is

begin
	process(ALU1, ALU2, Control_op)
	variable outre: std_logic_vector(15 downto 0):="0000000000000000";
	begin
		case Control_op is
			when "0000"=>	-- +
				outre:=ALU1+ALU2;
			when "0001"=>	-- &
				outre:=ALU1 and ALU2;
			when "0010"=>	-- =reg1
				outre:=ALU1;
			when "0011"=>	-- =reg2
				outre:=ALU2;
			when "0100"=>	-- ~
				outre:=not ALU2;
			when "0101"=>	-- |
				outre:=ALU1 or ALU2;
			when "0110"=>	-- <<logic
				if(conv_integer(ALU2)>15)then
					outre:="0000000000000000";
				else
					outre:="0000000000000000";
					outre(15 downto conv_integer(ALU2))<=ALU1((15-conv_integer(ALU2)) downto 0);
				end if;
			when "0111"=>	-- >>math
				if(ALU1(15)='0')then
					if(conv_integer(ALU2)>15)then
						outre:="0000000000000000";
					else
						outre:="0000000000000000";
						outre(15-conv_integer(ALU2) downto 0)<=ALU1(15 downto conv_integer(ALU2));
					end if;
				else
					if(conv_integer(ALU2)>15)then
						outre:=not "0000000000000000";
					else
						outre:=not "0000000000000000";
						outre(15-conv_integer(ALU2) downto 0)<=ALU1(15 downto conv_integer(ALU2));
					end if;
				end if;
			when "1000"=>	-- >>logic
				if(conv_integer(ALU2)>15)then
						outre:="0000000000000000";
				else
					outre:="0000000000000000";
					outre(15-conv_integer(ALU2) downto 0)<=ALU1(15 downto conv_integer(ALU2));
				end if;
			when "1001"=>	-- -
				outre:=ALU1-ALU2;
			when others=>
				null;
		end case;
		result<=outre;
	end process;

end Behavioral;

