--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:08:05 11/23/2016
-- Design Name:   
-- Module Name:   E:/pipeline-cpu/CPU/PC/testALU1.vhd
-- Project Name:  PC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU1_MUX
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
 
ENTITY testALU1 IS
END testALU1;
 
ARCHITECTURE behavior OF testALU1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU1_MUX
    PORT(
         PC : IN  std_logic_vector(15 downto 0);
         Reg1 : IN  std_logic_vector(15 downto 0);
         ALU1 : OUT  std_logic_vector(15 downto 0);
         Control_op1 : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal PC : std_logic_vector(15 downto 0) := (others => '0');
   signal Reg1 : std_logic_vector(15 downto 0) := (others => '0');
   signal Control_op1 : std_logic := '0';

 	--Outputs
   signal ALU1 : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU1_MUX PORT MAP (
          PC => PC,
          Reg1 => Reg1,
          ALU1 => ALU1,
          Control_op1 => Control_op1
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
		PC<="1100110000110011";
		Reg1<="0011001111001100";
		Control_op1<='0';
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		Control_op1<='1';
		wait for 100 ns;
--      wait for <clock>_period*10;
		Control_op1<='0';
      -- insert stimulus here 

      wait;
   end process;

END;
