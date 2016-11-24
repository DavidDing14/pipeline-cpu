--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:02:01 11/24/2016
-- Design Name:   
-- Module Name:   E:/pipeline-cpu/CPU/PC/testMemory.vhd
-- Project Name:  PC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Memory
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
 
ENTITY testMemory IS
END testMemory;
 
ARCHITECTURE behavior OF testMemory IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Memory
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         Addr : IN  std_logic_vector(15 downto 0);
         Data : IN  std_logic_vector(15 downto 0);
         MEM_Ry : IN  std_logic_vector(15 downto 0);
         instruction : IN  std_logic_vector(15 downto 0);
         outAddr : OUT  std_logic_vector(15 downto 0);
         outData : OUT  std_logic_vector(15 downto 0);
         outMEM_Ry : OUT  std_logic_vector(15 downto 0);
         outinstruction : OUT  std_logic_vector(15 downto 0);
         Control_MEM : IN  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '1';
   signal rst : std_logic := '1';
   signal Addr : std_logic_vector(15 downto 0) := (others => '0');
   signal Data : std_logic_vector(15 downto 0) := (others => '0');
   signal MEM_Ry : std_logic_vector(15 downto 0) := (others => '0');
   signal instruction : std_logic_vector(15 downto 0) := (others => '0');
   signal Control_MEM : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal outAddr : std_logic_vector(15 downto 0);
   signal outData : std_logic_vector(15 downto 0);
   signal outMEM_Ry : std_logic_vector(15 downto 0);
   signal outinstruction : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Memory PORT MAP (
          clk => clk,
          rst => rst,
          Addr => Addr,
          Data => Data,
          MEM_Ry => MEM_Ry,
          instruction => instruction,
          outAddr => outAddr,
          outData => outData,
          outMEM_Ry => outMEM_Ry,
          outinstruction => outinstruction,
          Control_MEM => Control_MEM
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
		Control_MEM<="01";
		wait for 100 ns;
		Control_MEM<="10";
		wait for 100 ns;
		Control_MEM<="11";
		wait for 100 ns;
		Control_MEM<="00";
		wait for 100 ns;
		rst<='0';
		wait for 100 ns;
		rst<='1';
		wait for 100 ns;
		Control_MEM<="10";

      -- insert stimulus here 

      wait;
   end process;

END;
