--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:19:23 11/24/2016
-- Design Name:   
-- Module Name:   E:/pipeline-cpu/CPU/PC/testWBReg_MUX.vhd
-- Project Name:  PC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: WB_Reg_MUX
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testWBReg_MUX IS
END testWBReg_MUX;
 
ARCHITECTURE behavior OF testWBReg_MUX IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT WB_Reg_MUX
    PORT(
         Data_DR : IN  std_logic_vector(15 downto 0);
         Data_WB : IN  std_logic_vector(15 downto 0);
         Data_NI : OUT  std_logic_vector(15 downto 0);
         Control_WB : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Data_DR : std_logic_vector(15 downto 0) := (others => '0');
   signal Data_WB : std_logic_vector(15 downto 0) := (others => '0');
   signal Control_WB : std_logic := '0';

 	--Outputs
   signal Data_NI : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: WB_Reg_MUX PORT MAP (
          Data_DR => Data_DR,
          Data_WB => Data_WB,
          Data_NI => Data_NI,
          Control_WB => Control_WB
        );

--   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		Data_DR<="0101010101010101";
		Data_WB<="1010010110100101";
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		Control_WB<='1';
		wait for 100 ns;
		Data_DR<="1111000000001111";
		Data_WB<="1111111100000000";
		wait for 100 ns;
		Control_WB<='0';

--      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
