--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:21:52 11/21/2016
-- Design Name:   
-- Module Name:   E:/pipeline-cpu/CPU/PC/Test_Rxyz.vhd
-- Project Name:  PC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Rxyz_MUX
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
 
ENTITY Test_Rxyz IS
END Test_Rxyz;
 
ARCHITECTURE behavior OF Test_Rxyz IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Rxyz_MUX
    PORT(
         Rx : IN  std_logic_vector(2 downto 0);
         Ry : IN  std_logic_vector(2 downto 0);
         Rz : IN  std_logic_vector(2 downto 0);
         ND : OUT  std_logic_vector(2 downto 0);
         Control_r : IN  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Rx : std_logic_vector(2 downto 0) := (others => '0');
   signal Ry : std_logic_vector(2 downto 0) := (others => '0');
   signal Rz : std_logic_vector(2 downto 0) := (others => '0');
   signal Control_r : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal ND : std_logic_vector(2 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Rxyz_MUX PORT MAP (
          Rx => Rx,
          Ry => Ry,
          Rz => Rz,
          ND => ND,
          Control_r => Control_r
        );

    --Clock process definitions
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
		Rx<="000";
		Ry<="010";
		Rz<="111";
		Control_r<="01";
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		Control_r<="11";
		wait for 100 ns;
		Control_r<="10";
      wait for 100 ns;
		Rx<="001";
		Ry<="011";
		Rz<="100";
		Control_r<="00";

      -- insert stimulus here 

      wait;
   end process;

END;
