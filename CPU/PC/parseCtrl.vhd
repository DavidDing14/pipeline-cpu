----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:19:02 11/22/2016 
-- Design Name: 
-- Module Name:    parseCtrl - Behavioral 
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

entity parseCtrl is
    Port ( clk : in  STD_LOGIC;
			  rst : in  STD_LOGIC;
           instruction : in  STD_LOGIC_VECTOR (15 downto 0);
           PC : in  STD_LOGIC_VECTOR (15 downto 0);
           Break : in  STD_LOGIC;
           out_instruction : out  STD_LOGIC_VECTOR (15 downto 0);
			  Ctrl_xy : out  STD_LOGIC;
           Ctrl_immidiate : out  STD_LOGIC_VECTOR (2 downto 0);
           Ctrl_extend : out  STD_LOGIC;
           Ctrl_SP : out  STD_LOGIC_VECTOR (1 downto 0);
           Ctrl_CMP : out  STD_LOGIC_VECTOR (1 downto 0);
           Ctrl_IH : out  STD_LOGIC_VECTOR (1 downto 0);
           Ctrl_r : out  STD_LOGIC_VECTOR (1 downto 0);
           Ctrl_WB : out  STD_LOGIC;
           Ctrl_op1 : out  STD_LOGIC;
           Ctrl_op2 : out  STD_LOGIC;
           Ctrl_op : out  STD_LOGIC_VECTOR (3 downto 0);
           Ctrl_addr : out  STD_LOGIC_VECTOR (1 downto 0);
           Ctrl_PCMEM : out  STD_LOGIC;
           Ctrl_DRRE : out  STD_LOGIC;
           Ctrl_judge : out  STD_LOGIC;
           Ctrl_b : out  STD_LOGIC;
           Ctrl_Jump : out  STD_LOGIC);
end parseCtrl;

architecture Behavioral of parseCtrl is
begin
	process(clk, rst, Break)
	begin
		if (rst='0') then
			Ctrl_xy<='0';
			Ctrl_immidiate<="000";
			Ctrl_extend<='0';
			Ctrl_SP<="00";
			Ctrl_CMP<="00";
			Ctrl_IH<="00";
			Ctrl_r<="00";
			Ctrl_WB<='0';
			Ctrl_op1<='0';
			Ctrl_op2<='0';
			Ctrl_op<="0000";
			Ctrl_addr<="00";
			Ctrl_PCMEM<='0';
			Ctrl_DRRE<='0';
			Ctrl_judge<='0';
			Ctrl_b<='0';
			Ctrl_Jump<='0';
			out_instruction<="0000000000000000";
		elsif (clk'event and clk='1') then
			if(Break = '0') then
				out_instruction<=instruction;
				case instruction(15 downto 11) is
					when "00001" => -- NOP
						Ctrl_xy<='0';
						Ctrl_immidiate<="000";
						Ctrl_extend<='0';
						Ctrl_SP<="00";
						Ctrl_CMP<="00";
						Ctrl_IH<="00";
						Ctrl_r<="11";
						Ctrl_WB<='0';
						Ctrl_op1<='0';
						Ctrl_op2<='0';
						Ctrl_op<="0000";
						Ctrl_addr<="00";
						Ctrl_PCMEM<='0';
						Ctrl_DRRE<='0';
						Ctrl_judge<='0';
						Ctrl_b<='0';
						Ctrl_Jump<='0';
					when "00010" => -- B
						Ctrl_xy<='0';
						Ctrl_immidiate<="011";
						Ctrl_extend<='1';
						Ctrl_SP<="00";
						Ctrl_CMP<="00";
						Ctrl_IH<="00";
						Ctrl_r<="11";
						Ctrl_WB<='0';
						Ctrl_op1<='1';
						Ctrl_op2<='0';
						Ctrl_op<="0000";
						Ctrl_addr<="00";
						Ctrl_PCMEM<='0';
						Ctrl_DRRE<='0';
						Ctrl_judge<='0';
						Ctrl_b<='1';
						Ctrl_Jump<='0';
					when "00100" => -- BEQZ
						Ctrl_xy<='0';
						Ctrl_immidiate<="001";
						Ctrl_extend<='1';
						Ctrl_SP<="00";
						Ctrl_CMP<="00";
						Ctrl_IH<="00";
						Ctrl_r<="11";
						Ctrl_WB<='0';
						Ctrl_op1<='1';
						Ctrl_op2<='0';
						Ctrl_op<="0000";
						Ctrl_addr<="00";
						Ctrl_PCMEM<='0';
						Ctrl_DRRE<='0';
						Ctrl_judge<='1';
						Ctrl_b<='1';
						Ctrl_Jump<='0';
					when "00101" => -- BNEZ
						Ctrl_xy<='0';
						Ctrl_immidiate<="001";
						Ctrl_extend<='1';
						Ctrl_SP<="00";
						Ctrl_CMP<="00";
						Ctrl_IH<="00";
						Ctrl_r<="11";
						Ctrl_WB<='0';
						Ctrl_op1<='1';
						Ctrl_op2<='0';
						Ctrl_op<="0000";
						Ctrl_addr<="00";
						Ctrl_PCMEM<='0';
						Ctrl_DRRE<='0';
						Ctrl_judge<='1';
						Ctrl_b<='1';
						Ctrl_Jump<='0';
					when "00110" =>
						case instruction(1 downto 0) is
							when "00" => -- SLL
								Ctrl_xy<='0';
								Ctrl_immidiate<="101";
								Ctrl_extend<='0';
								Ctrl_SP<="00";
								Ctrl_CMP<="00";
								Ctrl_IH<="00";
								Ctrl_r<="10";
								Ctrl_WB<='1';
								Ctrl_op1<='0';
								Ctrl_op2<='1';
								Ctrl_op<="0110";
								Ctrl_addr<="00";
								Ctrl_PCMEM<='0';
								Ctrl_DRRE<='0';
								Ctrl_judge<='1';
								Ctrl_b<='0';
								Ctrl_Jump<='0';
							when "11" => -- SRA
								Ctrl_xy<='0';
								Ctrl_immidiate<="101";
								Ctrl_extend<='0';
								Ctrl_SP<="00";
								Ctrl_CMP<="00";
								Ctrl_IH<="00";
								Ctrl_r<="10";
								Ctrl_WB<='1';
								Ctrl_op1<='0';
								Ctrl_op2<='1';
								Ctrl_op<="0111";
								Ctrl_addr<="00";
								Ctrl_PCMEM<='0';
								Ctrl_DRRE<='0';
								Ctrl_judge<='1';
								Ctrl_b<='0';
								Ctrl_Jump<='0';	
							when "10" => -- SRL
								Ctrl_xy<='0';
								Ctrl_immidiate<="101";
								Ctrl_extend<='0';
								Ctrl_SP<="00";
								Ctrl_CMP<="00";
								Ctrl_IH<="00";
								Ctrl_r<="10";
								Ctrl_WB<='1';
								Ctrl_op1<='0';
								Ctrl_op2<='1';
								Ctrl_op<="1000";
								Ctrl_addr<="00";
								Ctrl_PCMEM<='0';
								Ctrl_DRRE<='0';
								Ctrl_judge<='1';
								Ctrl_b<='0';
								Ctrl_Jump<='0';							
							when others =>
								
						end case;
					when "01000" => -- ADDIU3
						Ctrl_xy<='0';
						Ctrl_immidiate<="010";
						Ctrl_extend<='1';
						Ctrl_SP<="00";
						Ctrl_CMP<="00";
						Ctrl_IH<="00";
						Ctrl_r<="01";
						Ctrl_WB<='1';
						Ctrl_op1<='0';
						Ctrl_op2<='0';
						Ctrl_op<="0000";
						Ctrl_addr<="00";
						Ctrl_PCMEM<='0';
						Ctrl_DRRE<='0';
						Ctrl_judge<='0';
						Ctrl_b<='0';
						Ctrl_Jump<='0';
					when "01001" => -- ADDIU
						Ctrl_xy<='0';
						Ctrl_immidiate<="001";
						Ctrl_extend<='1';
						Ctrl_SP<="00";
						Ctrl_CMP<="00";
						Ctrl_IH<="00";
						Ctrl_r<="10";
						Ctrl_WB<='1';
						Ctrl_op1<='0';
						Ctrl_op2<='0';
						Ctrl_op<="0000";
						Ctrl_addr<="00";
						Ctrl_PCMEM<='0';
						Ctrl_DRRE<='0';
						Ctrl_judge<='0';
						Ctrl_b<='0';
						Ctrl_Jump<='0';
					when "01010" => -- SLTI
						Ctrl_xy<='0';
						Ctrl_immidiate<="001";
						Ctrl_extend<='1';
						Ctrl_SP<="00";
						Ctrl_CMP<="10";
						Ctrl_IH<="00";
						Ctrl_r<="11";
						Ctrl_WB<='0';
						Ctrl_op1<='0';
						Ctrl_op2<='0';
						Ctrl_op<="0000";
						Ctrl_addr<="00";
						Ctrl_PCMEM<='0';
						Ctrl_DRRE<='0';
						Ctrl_judge<='1';
						Ctrl_b<='0';
						Ctrl_Jump<='0';
					when "01100" =>
						case instruction(10 downto 9) is
							when "01" => -- ADDSP
								Ctrl_xy<='0';
								Ctrl_immidiate<="001";
								Ctrl_extend<='1';
								Ctrl_SP<="11";
								Ctrl_CMP<="00";
								Ctrl_IH<="00";
								Ctrl_r<="11";
								Ctrl_WB<='1';
								Ctrl_op1<='0';
								Ctrl_op2<='0';
								Ctrl_op<="0000";
								Ctrl_addr<="00";
								Ctrl_PCMEM<='0';
								Ctrl_DRRE<='0';
								Ctrl_judge<='0';
								Ctrl_b<='0';
								Ctrl_Jump<='0';                               
							when "00" => -- BTEQZ
								Ctrl_xy<='0';
								Ctrl_immidiate<="001";
								Ctrl_extend<='1';
								Ctrl_SP<="00";
								Ctrl_CMP<="00";
								Ctrl_IH<="00";
								Ctrl_r<="11";
								Ctrl_WB<='0';
								Ctrl_op1<='1';
								Ctrl_op2<='0';
								Ctrl_op<="0000";
								Ctrl_addr<="00";
								Ctrl_PCMEM<='0';
								Ctrl_DRRE<='0';
								Ctrl_judge<='1';
								Ctrl_b<='1';
								Ctrl_Jump<='0';
							when "10" => -- MTSP
								Ctrl_xy<='0';
								Ctrl_immidiate<="000";
								Ctrl_extend<='0';
								Ctrl_SP<="01";
								Ctrl_CMP<="00";
								Ctrl_IH<="00";
								Ctrl_r<="11";
								Ctrl_WB<='1';
								Ctrl_op1<='0';
								Ctrl_op2<='0';
								Ctrl_op<="0010";
								Ctrl_addr<="00";
								Ctrl_PCMEM<='0';
								Ctrl_DRRE<='0';
								Ctrl_judge<='0';
								Ctrl_b<='0';
								Ctrl_Jump<='0';
							when others =>
						end case;
					when "01101" => -- LI
						Ctrl_xy<='0';
						Ctrl_immidiate<="001";
						Ctrl_extend<='0';
						Ctrl_SP<="00";
						Ctrl_CMP<="00";
						Ctrl_IH<="00";
						Ctrl_r<="10";
						Ctrl_WB<='1';
						Ctrl_op1<='0';
						Ctrl_op2<='0';
						Ctrl_op<="0011";
						Ctrl_addr<="00";
						Ctrl_PCMEM<='0';
						Ctrl_DRRE<='0';
						Ctrl_judge<='0';
						Ctrl_b<='0';
						Ctrl_Jump<='0';
					when "01110" => -- CMPI
						Ctrl_xy<='0';
						Ctrl_immidiate<="001";
						Ctrl_extend<='1';
						Ctrl_SP<="00";
						Ctrl_CMP<="10";
						Ctrl_IH<="00";
						Ctrl_r<="11";
						Ctrl_WB<='0';
						Ctrl_op1<='0';
						Ctrl_op2<='0';
						Ctrl_op<="0000";
						Ctrl_addr<="00";
						Ctrl_PCMEM<='0';
						Ctrl_DRRE<='0';
						Ctrl_judge<='1';
						Ctrl_b<='0';
						Ctrl_Jump<='0';
					when "10010" => -- LW_SP
						Ctrl_xy<='0';
						Ctrl_immidiate<="001";
						Ctrl_extend<='1';
						Ctrl_SP<="10";
						Ctrl_CMP<="00";
						Ctrl_IH<="00";
						Ctrl_r<="10";
						Ctrl_WB<='1';
						Ctrl_op1<='0';
						Ctrl_op2<='0';
						Ctrl_op<="0000";
						Ctrl_addr<="01";
						Ctrl_PCMEM<='1';
						Ctrl_DRRE<='1';
						Ctrl_judge<='0';
						Ctrl_b<='0';
						Ctrl_Jump<='0';
					when "10011" => --LW
						Ctrl_xy<='0';
						Ctrl_immidiate<="100";
						Ctrl_extend<='1';
						Ctrl_SP<="00";
						Ctrl_CMP<="00";
						Ctrl_IH<="00";
						Ctrl_r<="01";
						Ctrl_WB<='1';
						Ctrl_op1<='0';
						Ctrl_op2<='0';
						Ctrl_op<="0000";
						Ctrl_addr<="01";
						Ctrl_PCMEM<='1';
						Ctrl_DRRE<='1';
						Ctrl_judge<='0';
						Ctrl_b<='0';
						Ctrl_Jump<='0';
					when "11010" => --SW_SP
						Ctrl_xy<='1';
						Ctrl_immidiate<="001";
						Ctrl_extend<='1';
						Ctrl_SP<="10";
						Ctrl_CMP<="00";
						Ctrl_IH<="00";
						Ctrl_r<="11";
						Ctrl_WB<='0';
						Ctrl_op1<='0';
						Ctrl_op2<='0';
						Ctrl_op<="0000";
						Ctrl_addr<="11";
						Ctrl_PCMEM<='1';
						Ctrl_DRRE<='0';
						Ctrl_judge<='0';
						Ctrl_b<='0';
						Ctrl_Jump<='0';
					when "11011" => -- SW
						Ctrl_xy<='0';
						Ctrl_immidiate<="100";
						Ctrl_extend<='1';
						Ctrl_SP<="00";
						Ctrl_CMP<="00";
						Ctrl_IH<="00";
						Ctrl_r<="11";
						Ctrl_WB<='0';
						Ctrl_op1<='0';
						Ctrl_op2<='0';
						Ctrl_op<="0000";
						Ctrl_addr<="11";
						Ctrl_PCMEM<='1';
						Ctrl_DRRE<='0';
						Ctrl_judge<='0';
						Ctrl_b<='0';
						Ctrl_Jump<='0';
					when "11100" =>
						case instruction(1) is
							when '0' => -- ADDU
								Ctrl_xy<='0';
								Ctrl_immidiate<="000";
								Ctrl_extend<='0';
								Ctrl_SP<="00";
								Ctrl_CMP<="00";
								Ctrl_IH<="00";
								Ctrl_r<="00";
								Ctrl_WB<='1';
								Ctrl_op1<='0';
								Ctrl_op2<='0';
								Ctrl_op<="0000";
								Ctrl_addr<="00";
								Ctrl_PCMEM<='0';
								Ctrl_DRRE<='0';
								Ctrl_judge<='0';
								Ctrl_b<='0';
								Ctrl_Jump<='0';
							when others => -- SUBU
								Ctrl_xy<='0';
								Ctrl_immidiate<="000";
								Ctrl_extend<='0';
								Ctrl_SP<="00";
								Ctrl_CMP<="00";
								Ctrl_IH<="00";
								Ctrl_r<="00";
								Ctrl_WB<='1';
								Ctrl_op1<='0';
								Ctrl_op2<='0';
								Ctrl_op<="1001";
								Ctrl_addr<="00";
								Ctrl_PCMEM<='0';
								Ctrl_DRRE<='0';
								Ctrl_judge<='0';
								Ctrl_b<='0';
								Ctrl_Jump<='0';
						end case;
					when "11101" =>
						case instruction(3 downto 0) is
							when "0000" =>
								case instruction(6) is
									when '0' => -- JR
										Ctrl_xy<='0';
										Ctrl_immidiate<="000";
										Ctrl_extend<='0';
										Ctrl_SP<="00";
										Ctrl_CMP<="00";
										Ctrl_IH<="00";
										Ctrl_r<="11";
										Ctrl_WB<='0';
										Ctrl_op1<='0';
										Ctrl_op2<='0';
										Ctrl_op<="0010";
										Ctrl_addr<="00";
										Ctrl_PCMEM<='0';
										Ctrl_DRRE<='0';
										Ctrl_judge<='0';
										Ctrl_b<='0';
										Ctrl_Jump<='1';
									when others => -- MFPC
										Ctrl_xy<='0';
										Ctrl_immidiate<="000";
										Ctrl_extend<='0';
										Ctrl_SP<="00";
										Ctrl_CMP<="00";
										Ctrl_IH<="00";
										Ctrl_r<="10";
										Ctrl_WB<='1';
										Ctrl_op1<='0';
										Ctrl_op2<='0';
										Ctrl_op<="0010";
										Ctrl_addr<="00";
										Ctrl_PCMEM<='0';
										Ctrl_DRRE<='0';
										Ctrl_judge<='0';
										Ctrl_b<='0';
										Ctrl_Jump<='0';									
								end case;
							when "1100" => -- AND
								Ctrl_xy<='0';
								Ctrl_immidiate<="000";
								Ctrl_extend<='0';
								Ctrl_SP<="00";
								Ctrl_CMP<="00";
								Ctrl_IH<="00";
								Ctrl_r<="10";
								Ctrl_WB<='1';
								Ctrl_op1<='0';
								Ctrl_op2<='0';
								Ctrl_op<="0001";
								Ctrl_addr<="00";
								Ctrl_PCMEM<='0';
								Ctrl_DRRE<='0';
								Ctrl_judge<='0';
								Ctrl_b<='0';
								Ctrl_Jump<='0';
							when "1010" => -- CMP
								Ctrl_xy<='0';
								Ctrl_immidiate<="000";
								Ctrl_extend<='0';
								Ctrl_SP<="00";
								Ctrl_CMP<="10";
								Ctrl_IH<="00";
								Ctrl_r<="11";
								Ctrl_WB<='0';
								Ctrl_op1<='0';
								Ctrl_op2<='0';
								Ctrl_op<="0000";
								Ctrl_addr<="00";
								Ctrl_PCMEM<='0';
								Ctrl_DRRE<='0';
								Ctrl_judge<='1';
								Ctrl_b<='0';
								Ctrl_Jump<='0';
							when "1111" => -- NOT
								Ctrl_xy<='0';
								Ctrl_immidiate<="000";
								Ctrl_extend<='0';
								Ctrl_SP<="00";
								Ctrl_CMP<="00";
								Ctrl_IH<="00";
								Ctrl_r<="10";
								Ctrl_WB<='1';
								Ctrl_op1<='0';
								Ctrl_op2<='0';
								Ctrl_op<="0100";
								Ctrl_addr<="00";
								Ctrl_PCMEM<='0';
								Ctrl_DRRE<='0';
								Ctrl_judge<='0';
								Ctrl_b<='0';
								Ctrl_Jump<='0';
							when "1101" => -- OR
								Ctrl_xy<='0';
								Ctrl_immidiate<="000";
								Ctrl_extend<='0';
								Ctrl_SP<="00";
								Ctrl_CMP<="00";
								Ctrl_IH<="00";
								Ctrl_r<="10";
								Ctrl_WB<='1';
								Ctrl_op1<='0';
								Ctrl_op2<='0';
								Ctrl_op<="0101";
								Ctrl_addr<="00";
								Ctrl_PCMEM<='0';
								Ctrl_DRRE<='0';
								Ctrl_judge<='0';
								Ctrl_b<='0';
								Ctrl_Jump<='0';
							when "0111" => -- SRAV
								Ctrl_xy<='0';
								Ctrl_immidiate<="000";
								Ctrl_extend<='0';
								Ctrl_SP<="00";
								Ctrl_CMP<="00";
								Ctrl_IH<="00";
								Ctrl_r<="01";
								Ctrl_WB<='1';
								Ctrl_op1<='0';
								Ctrl_op2<='0';
								Ctrl_op<="0111";
								Ctrl_addr<="00";
								Ctrl_PCMEM<='0';
								Ctrl_DRRE<='0';
								Ctrl_judge<='0';
								Ctrl_b<='0';
								Ctrl_Jump<='0';
							when others =>
						end case;
					when "11110" =>
						case instruction(0) is
							when '0' => -- MFIH
								Ctrl_xy<='0';
								Ctrl_immidiate<="000";
								Ctrl_extend<='0';
								Ctrl_SP<="00";
								Ctrl_CMP<="00";
								Ctrl_IH<="10";
								Ctrl_r<="10";
								Ctrl_WB<='1';
								Ctrl_op1<='0';
								Ctrl_op2<='0';
								Ctrl_op<="0010";
								Ctrl_addr<="00";
								Ctrl_PCMEM<='0';
								Ctrl_DRRE<='0';
								Ctrl_judge<='0';
								Ctrl_b<='0';
								Ctrl_Jump<='0';
							when '1' => -- MTIH
								Ctrl_xy<='0';
								Ctrl_immidiate<="000";
								Ctrl_extend<='0';
								Ctrl_SP<="00";
								Ctrl_CMP<="00";
								Ctrl_IH<="01";
								Ctrl_r<="11";
								Ctrl_WB<='1';
								Ctrl_op1<='0';
								Ctrl_op2<='0';
								Ctrl_op<="0010";
								Ctrl_addr<="00";
								Ctrl_PCMEM<='0';
								Ctrl_DRRE<='0';
								Ctrl_judge<='0';
								Ctrl_b<='0';
								Ctrl_Jump<='0';
							when others =>
						end case;
					when others =>						
				end case;
			else
				Ctrl_xy<='0';
				Ctrl_immidiate<="000";
				Ctrl_extend<='0';
				Ctrl_SP<="00";
				Ctrl_CMP<="00";
				Ctrl_IH<="00";
				Ctrl_r<="00";
				Ctrl_WB<='0';
				Ctrl_op1<='0';
				Ctrl_op2<='0';
				Ctrl_op<="0000";
				Ctrl_addr<="00";
				Ctrl_PCMEM<='0';
				Ctrl_DRRE<='0';
				Ctrl_judge<='0';
				Ctrl_b<='0';
				Ctrl_Jump<='0';
				out_instruction<="0000000000000000";			
			end if;
		end if;
	end process;

end Behavioral;

