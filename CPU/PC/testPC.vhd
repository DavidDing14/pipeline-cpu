--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:04:42 11/15/2016
-- Design Name:   
-- Module Name:   E:/Xilinx/Project/CPU/PC/testPC.vhd
-- Project Name:  PC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PC
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
 
ENTITY testPC IS
END testPC;
 
ARCHITECTURE behavior OF testPC IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PC
    PORT(
         clk : IN  std_logic;
         break : IN  std_logic;
         next_PC : IN  std_logic_vector(15 downto 0);
         PC_to_add : OUT  std_logic_vector(15 downto 0);
         PC_IF : OUT  std_logic_vector(15 downto 0);
         PC_EX : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal break : std_logic := '0';
   signal next_PC : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal PC_to_add : std_logic_vector(15 downto 0);
   signal PC_IF : std_logic_vector(15 downto 0);
   signal PC_EX : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PC PORT MAP (
          clk => clk,
          break => break,
          next_PC => next_PC,
          PC_to_add => PC_to_add,
          PC_IF => PC_IF,
          PC_EX => PC_EX
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
		next_PC<=next_PC+4;
      wait for 100 ns;	
		next_PC<=next_PC+4;
      -- insert stimulus here 

      wait;
   end process;

END;
