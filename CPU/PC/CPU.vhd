----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:12:36 11/24/2016 
-- Design Name: 
-- Module Name:    CPU - Behavioral 
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

entity CPU is
    Port ( clk : in  STD_LOGIC;
			  PCout : out STD_LOGIC_VECTOR(15 downto 0);
			  PCin : in STD_LOGIC_VECTOR(15 downto 0);
           rst : in  STD_LOGIC);
end CPU;

architecture Behavioral of CPU is
	component PC
		Port ( clk : in  STD_LOGIC;
			  rst : in STD_LOGIC;
           break : in  STD_LOGIC;
           next_PC : in  STD_LOGIC_VECTOR (15 downto 0);
           PC_to_add : out  STD_LOGIC_VECTOR (15 downto 0);
           PC_IF : out  STD_LOGIC_VECTOR (15 downto 0);
           PC_EX : out  STD_LOGIC_VECTOR (15 downto 0));
	end component;
	component PC_ALU
		Port ( PC : in  STD_LOGIC_VECTOR (15 downto 0);
           PC_4 : out  STD_LOGIC_VECTOR (15 downto 0));
	end component;
	signal p1, p2, p3: std_logic_vector(15 downto 0);
begin
	u1:PC PORT MAP(clk, rst, '0', PCin, p1, p2, p3);
	u2:PC_ALU PORT MAP(p1, PCout);
end Behavioral;

