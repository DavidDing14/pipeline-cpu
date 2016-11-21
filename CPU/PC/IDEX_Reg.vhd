----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:50:32 11/21/2016 
-- Design Name: 
-- Module Name:    IDEX_Reg - Behavioral 
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
use IEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IDEX_Reg is
    Port ( clk : in  STD_LOGIC;
           PC : in  STD_LOGIC_VECTOR (15 downto 0);
           break : in  STD_LOGIC;
           Reg1 : in  STD_LOGIC_VECTOR (15 downto 0);
           Reg2 : in  STD_LOGIC_VECTOR (15 downto 0);
           RegND : in  STD_LOGIC_VECTOR (3 downto 0);
           Data_Ry : in  STD_LOGIC_VECTOR (15 downto 0);
           Control_WB : inout  STD_LOGIC;
           Control_op1 : inout  STD_LOGIC;
           Control_op2 : inout  STD_LOGIC_VECTOR (1 downto 0);
           Control_op : inout  STD_LOGIC_VECTOR (3 downto 0);
           Control_addr : inout  STD_LOGIC_VECTOR (1 downto 0);
           Control_PCMEM : inout  STD_LOGIC;
           Control_DRRE : inout  STD_LOGIC;
           Control_BJ : in  STD_LOGIC;
           Control_Jump : in  STD_LOGIC;
           Control_JJ : out  STD_LOGIC);
end IDEX_Reg;

architecture Behavioral of IDEX_Reg is

begin


end Behavioral;

