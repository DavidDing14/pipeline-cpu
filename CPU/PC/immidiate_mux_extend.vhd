----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:35:55 11/21/2016 
-- Design Name: 
-- Module Name:    immidiate_mux_extend - Behavioral 
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

entity immidiate_mux_extend is
    Port ( imm : in  STD_LOGIC_VECTOR (10 downto 0);
           imm_to_Reg : out  STD_LOGIC_VECTOR (15 downto 0);
           Control_i : in  STD_LOGIC_VECTOR (2 downto 0);
           Control_e : in  STD_LOGIC);
end immidiate_mux_extend;

architecture Behavioral of immidiate_mux_extend is

begin
	process(imm, Control_i, Control_e)
	variable real_imm: std_logic_vector(15 downto 0):="0000000000000000";
	begin
		case Control_i is
			when "001"=>		--选择7~0作为imm
				real_imm(7 downto 0):=imm(7 downto 0);
				case Control_e is
					when '1'=>		--sign_extend
						case imm(7) is
							when '0'=>
								real_imm(15 downto 8):="00000000";
							when '1'=>
								real_imm(15 downto 8):="11111111";
							when others=>
								null;
						end case;
					when '0'=>		--zero_extend
						real_imm(15 downto 8):="00000000";
					when others=>
						null;
				end case;
			when "010"=>		--选择3~0作为imm
				real_imm(3 downto 0):=imm(3 downto 0);
				case Control_e is
					when '1'=>		--sign_extend
						case imm(3) is
							when '0'=>
								real_imm(15 downto 4):="000000000000";
							when '1'=>
								real_imm(15 downto 4):="111111111111";
							when others=>
								null;
						end case;
					when '0'=>		--zero_extend
						real_imm(15 downto 4):="000000000000";
					when others=>
						null;
				end case;
			when "011"=>		--选择10~0作为imm
				real_imm(10 downto 0):=imm(10 downto 0);
				case Control_e is
					when '1'=>		--sign_extend
						case imm(10) is
							when '0'=>
								real_imm(15 downto 11):="00000";
							when '1'=>
								real_imm(15 downto 11):="11111";
							when others=>
								null;
						end case;
					when '0'=>		--zero_extend
						real_imm(15 downto 11):="00000";
					when others=>
						null;
				end case;
			when "100"=>		--选择4~0作为imm
				real_imm(4 downto 0):=imm(4 downto 0);
				case Control_e is
					when '1'=>		--sign_extend
						case imm(4) is
							when '0'=>
								real_imm(15 downto 5):="00000000000";
							when '1'=>
								real_imm(15 downto 5):="11111111111";
							when others=>
								null;
						end case;
					when '0'=>		--zero_extend
						real_imm(15 downto 5):="00000000000";
					when others=>
						null;
				end case;
			when "101"=>		--选择4~2作为imm
				real_imm(2 downto 0):=imm(4 downto 2);
				case Control_e is
					when '1'=>		--sign_extend
						case imm(4) is
							when '0'=>
								real_imm(15 downto 3):="0000000000000";
							when '1'=>
								real_imm(15 downto 3):="1111111111111";
							when others=>
								null;
						end case;
					when '0'=>		--zero_extend
						real_imm(15 downto 3):="0000000000000";
					when others=>
						null;
				end case;
			when others=>
				null;
		end case;
		imm_to_Reg<=real_imm;
	end process;
end Behavioral;

