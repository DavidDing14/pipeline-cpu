--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:53:52 11/23/2016
-- Design Name:   
-- Module Name:   E:/pipeline-cpu/CPU/PC/testMainReg.vhd
-- Project Name:  PC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Main_Reg
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
 
ENTITY testMainReg IS
END testMainReg;
 
ARCHITECTURE behavior OF testMainReg IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Main_Reg
    PORT(
         instruction : IN  std_logic_vector(15 downto 0);
         rst : IN  std_logic;
         Rx : IN  std_logic_vector(2 downto 0);
         Ry : IN  std_logic_vector(2 downto 0);
         ND : IN  std_logic_vector(2 downto 0);
         NI : IN  std_logic_vector(15 downto 0);
         imm : IN  std_logic_vector(15 downto 0);
         Reg1 : OUT  std_logic_vector(15 downto 0);
         Reg2 : OUT  std_logic_vector(15 downto 0);
         RegND : OUT  std_logic_vector(3 downto 0);
         RegND_WB : IN  std_logic_vector(3 downto 0);
         Data_Ry : OUT  std_logic_vector(15 downto 0);
         Result_EX : IN  std_logic_vector(15 downto 0);
         Result_MEM : IN  std_logic_vector(15 downto 0);
         Control_ctrl : IN  std_logic_vector(1 downto 0);
         Control_SP : IN  std_logic_vector(1 downto 0);
         Control_IH : IN  std_logic_vector(1 downto 0);
         Control_imm_ry : IN  std_logic;
         Control_B : IN  std_logic;
         Control_WB : IN  std_logic;
         Control_XY : IN  std_logic;
         Control_BJ : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal instruction : std_logic_vector(15 downto 0) := (others => '0');
   signal rst : std_logic := '0';
   signal Rx : std_logic_vector(2 downto 0) := (others => '0');
   signal Ry : std_logic_vector(2 downto 0) := (others => '0');
   signal ND : std_logic_vector(2 downto 0) := (others => '0');
   signal NI : std_logic_vector(15 downto 0) := (others => '0');
   signal imm : std_logic_vector(15 downto 0) := (others => '0');
   signal RegND_WB : std_logic_vector(3 downto 0) := (others => '0');
   signal Result_EX : std_logic_vector(15 downto 0) := (others => '0');
   signal Result_MEM : std_logic_vector(15 downto 0) := (others => '0');
   signal Control_ctrl : std_logic_vector(1 downto 0) := (others => '0');
   signal Control_SP : std_logic_vector(1 downto 0) := (others => '0');
   signal Control_IH : std_logic_vector(1 downto 0) := (others => '0');
   signal Control_imm_ry : std_logic := '0';
   signal Control_B : std_logic := '0';
   signal Control_WB : std_logic := '0';
   signal Control_XY : std_logic := '0';

 	--Outputs
   signal Reg1 : std_logic_vector(15 downto 0);
   signal Reg2 : std_logic_vector(15 downto 0);
   signal RegND : std_logic_vector(3 downto 0);
   signal Data_Ry : std_logic_vector(15 downto 0);
   signal Control_BJ : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Main_Reg PORT MAP (
          instruction => instruction,
          rst => rst,
          Rx => Rx,
          Ry => Ry,
          ND => ND,
          NI => NI,
          imm => imm,
          Reg1 => Reg1,
          Reg2 => Reg2,
          RegND => RegND,
          RegND_WB => RegND_WB,
          Data_Ry => Data_Ry,
          Result_EX => Result_EX,
          Result_MEM => Result_MEM,
          Control_ctrl => Control_ctrl,
          Control_SP => Control_SP,
          Control_IH => Control_IH,
          Control_imm_ry => Control_imm_ry,
          Control_B => Control_B,
          Control_WB => Control_WB,
          Control_XY => Control_XY,
          Control_BJ => Control_BJ
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
		wait for 100 ns;
		rst<='0';
		wait for 100 ns;
		rst<='1';
		wait for 100 ns;
		Rx<="001";
		Ry<="111";
		ND<="010";
		NI<="0101010101010101";
		imm<="0000010101010111";
		RegND_WB<="1000";
		Control_ctrl<="00";
		Control_SP<="00";
		Control_IH<="00";
		Control_imm_ry<='0';
		Control_B<='0';
		Control_WB<='0';
		Control_XY<='0';
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      Rx<="101";
		wait for 100 ns;
		Control_XY<='1';
		wait for 100 ns;
		Control_SP<="01";
      -- insert stimulus here 

      wait;
   end process;

END;
