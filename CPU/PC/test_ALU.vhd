--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:16:37 11/23/2016
-- Design Name:   
-- Module Name:   E:/pipeline-cpu/CPU/PC/test_ALU.vhd
-- Project Name:  PC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY test_ALU IS
END test_ALU;
 
ARCHITECTURE behavior OF test_ALU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         ALU1 : IN  std_logic_vector(15 downto 0);
         ALU2 : IN  std_logic_vector(15 downto 0);
         result : OUT  std_logic_vector(15 downto 0);
         Control_op : IN  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ALU1 : std_logic_vector(15 downto 0) := (others => '0');
   signal ALU2 : std_logic_vector(15 downto 0) := (others => '0');
   signal Control_op : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal result : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          ALU1 => ALU1,
          ALU2 => ALU2,
          result => result,
          Control_op => Control_op
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
		ALU1<="0100010001000100";
		ALU2<="0000000000000100";
		Control_op<="0000";
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		Control_op<="0001";
      -- hold reset state for 100 ns.
      wait for 100 ns;
		Control_op<="0010";
      -- hold reset state for 100 ns.
      wait for 100 ns;
		Control_op<="0011";
      -- hold reset state for 100 ns.
      wait for 100 ns;
		Control_op<="0100";
      -- hold reset state for 100 ns.
      wait for 100 ns;
		Control_op<="0101";
      -- hold reset state for 100 ns.
      wait for 100 ns;
		Control_op<="0110";
      -- hold reset state for 100 ns.
      wait for 100 ns;
		Control_op<="0111";
      -- hold reset state for 100 ns.
      wait for 100 ns;
		Control_op<="1000";
      -- hold reset state for 100 ns.
      wait for 100 ns;
		Control_op<="1001";
      -- hold reset state for 100 ns.
      wait for 100 ns;
		Control_op<="1010";
      -- hold reset state for 100 ns.
      wait for 100 ns;
--      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
