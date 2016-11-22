----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:30:36 11/22/2016 
-- Design Name: 
-- Module Name:    EXMEM_Reg - Behavioral 
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

entity EXMEM_Reg is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           break : in  STD_LOGIC;
           result : inout  STD_LOGIC_VECTOR (15 downto 0);
           Data_Ry : inout  STD_LOGIC_VECTOR (15 downto 0);
           Control_WB : inout  STD_LOGIC;
           Control_addr : inout  STD_LOGIC_VECTOR (1 downto 0);
           Control_PCMEM : inout  STD_LOGIC;
           Control_DRRE : inout  STD_LOGIC);
end EXMEM_Reg;

architecture Behavioral of EXMEM_Reg is

begin


end Behavioral;

