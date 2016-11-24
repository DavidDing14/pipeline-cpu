--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:57:48 11/24/2016
-- Design Name:   
-- Module Name:   E:/pipeline-cpu/CPU/PC/testCPU.vhd
-- Project Name:  PC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CPU
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
 
ENTITY testCPU IS
END testCPU;
 
ARCHITECTURE behavior OF testCPU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CPU
    PORT(
         clk : IN  std_logic;
         PCout : OUT  std_logic_vector(15 downto 0);
         PCin : IN  std_logic_vector(15 downto 0);
         rst : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '1';
   signal PCin : std_logic_vector(15 downto 0) := (others => '0');
   signal rst : std_logic := '1';

 	--Outputs
   signal PCout : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CPU PORT MAP (
          clk => clk,
          PCout => PCout,
          PCin => PCin,
          rst => rst
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		PCin<="0101010101010101";
      wait for 100 ns;	
		PCin<="1010101010101010";
      wait for 100 ns;
		rst<='0';
		wait for 100 ns;
		rst<='1';
		wait for 100 ns;
		PCin<="1111000000001111";
      -- insert stimulus here 

      wait;
   end process;

END;
