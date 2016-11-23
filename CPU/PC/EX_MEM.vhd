----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:12:29 11/23/2016 
-- Design Name: 
-- Module Name:    EX_MEM - Behavioral 
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

entity EX_MEM is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           Break : in  STD_LOGIC;
           WDATA : in  STD_LOGIC_VECTOR (15 downto 0); -- 写入内存的数据
           Result : in  STD_LOGIC_VECTOR (15 downto 0);
           Ctrl_WB : in  STD_LOGIC;
           Ctrl_addr : in  STD_LOGIC_VECTOR (1 downto 0);
           Ctrl_PCMEM : in  STD_LOGIC;
           Ctrl_DRRE : in  STD_LOGIC;
			  out_WDATA : out  STD_LOGIC_VECTOR (15 downto 0); -- 写入内存的数据
           out_Result : out  STD_LOGIC_VECTOR (15 downto 0);
           out_Ctrl_WB : out  STD_LOGIC;
           out_Ctrl_addr : out  STD_LOGIC_VECTOR (1 downto 0);
           out_Ctrl_PCMEM : out  STD_LOGIC;
           out_Ctrl_DRRE : out  STD_LOGIC
			);
end EX_MEM;

architecture Behavioral of EX_MEM is

begin
	process(clk, rst, Break)
	begin
		if (rst'event and rst='1') then
			out_Ctrl_WB<='0';
			out_Ctrl_addr<="00";
			out_Ctrl_PCMEM<='0';
			out_Ctrl_DRRE<='0';
			out_Result<="0000000000000000";
			out_WDATA<="0000000000000000";
		else
			out_Ctrl_WB<=Ctrl_WB;
			out_Ctrl_addr<=Ctrl_addr;
			out_Ctrl_PCMEM<=Ctrl_PCMEM;
			out_Ctrl_DRRE<=Ctrl_DRRE;
			out_Result<=Result;
			out_WDATA<=WDATA;			
		end if;
	end process;

end Behavioral;

