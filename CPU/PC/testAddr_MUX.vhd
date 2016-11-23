--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:37:31 11/15/2016
-- Design Name:   
-- Module Name:   E:/Xilinx/Project/CPU/PC/testAddr_MUX.vhd
-- Project Name:  PC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Addr_MUX
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
 
ENTITY testAddr_MUX IS
END testAddr_MUX;
 
ARCHITECTURE behavior OF testAddr_MUX IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Addr_MUX
    PORT(
         PC : IN  std_logic_vector(15 downto 0);
         MEM : IN  std_logic_vector(15 downto 0);
         Addr : OUT  std_logic_vector(15 downto 0);
         Control_MEM : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal PC : std_logic_vector(15 downto 0) := (others => '0');
   signal MEM : std_logic_vector(15 downto 0) := (others => '0');
   signal Control_MEM : std_logic := '0';

 	--Outputs
   signal Addr : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace clk below with 
   -- appropriate port name 
 
 --  constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Addr_MUX PORT MAP (
          PC => PC,
          MEM => MEM,
          Addr => Addr,
          Control_MEM => Control_MEM
        );

   -- Clock process definitions
--   clk_process :process
--   begin
--		clk <= '0';
--		wait for clk_period/2;
--		clk <= '1';
--		wait for clk_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		PC<="0000111100001111";
		MEM<="0000111111110000";
		Control_MEM<='0';
      wait for 100 ns;	
		Control_MEM<='1';
      wait for 100 ns;
		Control_MEM<='0';
      -- insert stimulus here 

      wait;
   end process;

END;
