--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:11:56 11/29/2016
-- Design Name:   
-- Module Name:   G:/cpu/pipeline-cpu/CPU/PC/testCPU.vhd
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
         rst : IN  std_logic;
         outL : OUT  std_logic_vector(15 downto 0);
         ram1data : INOUT  std_logic_vector(15 downto 0);
         ram2data : INOUT  std_logic_vector(15 downto 0);
         ram1addr : OUT  std_logic_vector(17 downto 0);
         ram2addr : OUT  std_logic_vector(17 downto 0);
         ram1oe : OUT  std_logic;
         ram1we : OUT  std_logic;
         ram1en : OUT  std_logic;
         ram2oe : OUT  std_logic;
         ram2we : OUT  std_logic;
         ram2en : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

	--BiDirs
   signal ram1data : std_logic_vector(15 downto 0);
   signal ram2data : std_logic_vector(15 downto 0);

 	--Outputs
   signal outL : std_logic_vector(15 downto 0);
   signal ram1addr : std_logic_vector(17 downto 0);
   signal ram2addr : std_logic_vector(17 downto 0);
   signal ram1oe : std_logic;
   signal ram1we : std_logic;
   signal ram1en : std_logic;
   signal ram2oe : std_logic;
   signal ram2we : std_logic;
   signal ram2en : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CPU PORT MAP (
          clk => clk,
          rst => rst,
          outL => outL,
          ram1data => ram1data,
          ram2data => ram2data,
          ram1addr => ram1addr,
          ram2addr => ram2addr,
          ram1oe => ram1oe,
          ram1we => ram1we,
          ram1en => ram1en,
          ram2oe => ram2oe,
          ram2we => ram2we,
          ram2en => ram2en
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
      wait for 100 ns;	
		rst<='1';
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
