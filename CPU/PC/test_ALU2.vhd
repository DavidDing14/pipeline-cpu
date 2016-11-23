--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:11:47 11/23/2016
-- Design Name:   
-- Module Name:   E:/pipeline-cpu/CPU/PC/test_ALU2.vhd
-- Project Name:  PC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU2_MUX
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
 
ENTITY test_ALU2 IS
END test_ALU2;
 
ARCHITECTURE behavior OF test_ALU2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU2_MUX
    PORT(
         Reg2 : IN  std_logic_vector(15 downto 0);
         ALU2 : OUT  std_logic_vector(15 downto 0);
         Control_op2 : IN  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Reg2 : std_logic_vector(15 downto 0) := (others => '0');
   signal Control_op2 : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal ALU2 : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU2_MUX PORT MAP (
          Reg2 => Reg2,
          ALU2 => ALU2,
          Control_op2 => Control_op2
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
		Reg2<="0011111111111100";
		Control_op2<="00";
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		Control_op2<="01";
		wait for 100 ns;
		Control_op2<="10";
		wait for 100 ns;
		Control_op2<="11";
		wait for 100 ns;
		Control_op2<="00";
--      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
