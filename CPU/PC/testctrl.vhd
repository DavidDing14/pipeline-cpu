--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:12:58 11/24/2016
-- Design Name:   
-- Module Name:   E:/pipeline-cpu/CPU/PC/testctrl.vhd
-- Project Name:  PC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ctrl
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
 
ENTITY testctrl IS
END testctrl;
 
ARCHITECTURE behavior OF testctrl IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ctrl
    PORT(
         clk : IN  std_logic;
			rst : IN  std_logic;
         instruction : IN  std_logic_vector(15 downto 0);
         Control_ctrl_JJ : IN  std_logic;
         Control_PC : OUT  std_logic;
         Control_IF : OUT  std_logic;
         Control_ID : OUT  std_logic;
         Control_EX : OUT  std_logic;
         Control_MEM : OUT  std_logic;
         Control_Reg : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '1';
	signal rst : std_logic := '1';
   signal instruction : std_logic_vector(15 downto 0) := (others => '0');
   signal Control_ctrl_JJ : std_logic := '0';

 	--Outputs
   signal Control_PC : std_logic;
   signal Control_IF : std_logic;
   signal Control_ID : std_logic;
   signal Control_EX : std_logic;
   signal Control_MEM : std_logic;
   signal Control_Reg : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ctrl PORT MAP (
          clk => clk,
			 rst => rst,
          instruction => instruction,
          Control_ctrl_JJ => Control_ctrl_JJ,
          Control_PC => Control_PC,
          Control_IF => Control_IF,
          Control_ID => Control_ID,
          Control_EX => Control_EX,
          Control_MEM => Control_MEM,
          Control_Reg => Control_Reg
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
		instruction<="0100100010101010";
      wait for 100 ns;	
		instruction<="0100111101010101";
		wait for 100 ns;
		instruction<="0100101011110000";
		Control_ctrl_JJ<='1';
		wait for 100 ns;
		instruction<="0100110100001111";
		wait for 100 ns;
      -- insert stimulus here 
		rst<='0';
		wait for 100 ns;
		rst<='1';
      wait;
   end process;

END;
