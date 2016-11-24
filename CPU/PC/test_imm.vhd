--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:52:20 11/21/2016
-- Design Name:   
-- Module Name:   E:/pipeline-cpu/CPU/PC/test_imm.vhd
-- Project Name:  PC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: immidiate_mux_extend
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
 
ENTITY test_imm IS
END test_imm;
 
ARCHITECTURE behavior OF test_imm IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT immidiate_mux_extend
    PORT(
         imm : IN  std_logic_vector(10 downto 0);
         imm_to_Reg : OUT  std_logic_vector(15 downto 0);
         Control_i : IN  std_logic_vector(2 downto 0);
         Control_e : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal imm : std_logic_vector(10 downto 0) := (others => '0');
   signal Control_i : std_logic_vector(2 downto 0) := (others => '0');
   signal Control_e : std_logic := '0';

 	--Outputs
   signal imm_to_Reg : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: immidiate_mux_extend PORT MAP (
          imm => imm,
          imm_to_Reg => imm_to_Reg,
          Control_i => Control_i,
          Control_e => Control_e
        );

   -- Clock process definitions
 --  <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		imm<="10101001001";
		Control_i<="000";
		Control_e<='0';
      wait for 100 ns;	
		Control_i<="001";
		wait for 100 ns;
		Control_i<="010";
		wait for 100 ns;
		Control_i<="011";
		wait for 100 ns;
		Control_i<="100";
		wait for 100 ns;
		Control_e<='1';
      wait for 100 ns;	
		Control_i<="001";
		wait for 100 ns;
		Control_i<="010";
		wait for 100 ns;
		Control_i<="011";
		wait for 100 ns;
		Control_i<="100";
		wait for 100 ns;
 --     wait for <clock>_period*10;
		
		imm<="10101000101";
		Control_i<="000";
		Control_e<='0';
      wait for 100 ns;	
		Control_i<="001";
		wait for 100 ns;
		Control_i<="010";
		wait for 100 ns;
		Control_i<="011";
		wait for 100 ns;
		Control_i<="100";
		wait for 100 ns;
		Control_e<='1';
      wait for 100 ns;	
		Control_i<="001";
		wait for 100 ns;
		Control_i<="010";
		wait for 100 ns;
		Control_i<="011";
		wait for 100 ns;
		Control_i<="100";
		wait for 100 ns;
      -- insert stimulus here 

      wait;
   end process;

END;
