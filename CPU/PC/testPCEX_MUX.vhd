--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:00:31 11/24/2016
-- Design Name:   
-- Module Name:   E:/pipeline-cpu/CPU/PC/testPCEX_MUX.vhd
-- Project Name:  PC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PC_EX_MUX
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testPCEX_MUX IS
END testPCEX_MUX;
 
ARCHITECTURE behavior OF testPCEX_MUX IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PC_EX_MUX
    PORT(
         PC_ALU : IN  std_logic_vector(15 downto 0);
         EX_result : IN  std_logic_vector(15 downto 0);
         result : OUT  std_logic_vector(15 downto 0);
         Control_EX : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal PC_ALU : std_logic_vector(15 downto 0) := (others => '0');
   signal EX_result : std_logic_vector(15 downto 0) := (others => '0');
   signal Control_EX : std_logic := '0';

 	--Outputs
   signal result : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PC_EX_MUX PORT MAP (
          PC_ALU => PC_ALU,
          EX_result => EX_result,
          result => result,
          Control_EX => Control_EX
        );

   -- Clock process definitions
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
		PC_ALU<="0101010101010101";
		EX_result<="1010101010101010";
		Control_EX<='0';
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		Control_EX<='1';
		wait for 100 ns;
		PC_ALU<="1111111100000000";
		EX_result<="0000000011111111";
--      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
