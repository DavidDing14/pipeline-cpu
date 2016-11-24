--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:17:25 11/24/2016
-- Design Name:   
-- Module Name:   G:/cpu/pipeline-cpu/CPU/PC/test_IF_ID_Ctrl.vhd
-- Project Name:  PC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: parseCtrl
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
 
ENTITY test_IF_ID_Ctrl IS
END test_IF_ID_Ctrl;
 
ARCHITECTURE behavior OF test_IF_ID_Ctrl IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT parseCtrl
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         instruction : IN  std_logic_vector(15 downto 0);
         PC : IN  std_logic_vector(15 downto 0);
         Break : IN  std_logic;
         out_instruction : OUT  std_logic_vector(15 downto 0);
         Ctrl_xy : OUT  std_logic;
         Ctrl_immidiate : OUT  std_logic_vector(2 downto 0);
         Ctrl_extend : OUT  std_logic;
         Ctrl_SP : OUT  std_logic_vector(1 downto 0);
         Ctrl_CMP : OUT  std_logic_vector(1 downto 0);
         Ctrl_IH : OUT  std_logic_vector(1 downto 0);
         Ctrl_r : OUT  std_logic_vector(1 downto 0);
         Ctrl_WB : OUT  std_logic;
         Ctrl_op1 : OUT  std_logic;
         Ctrl_op2 : OUT  std_logic;
         Ctrl_op : OUT  std_logic_vector(3 downto 0);
         Ctrl_addr : OUT  std_logic_vector(1 downto 0);
         Ctrl_PCMEM : OUT  std_logic;
         Ctrl_DRRE : OUT  std_logic;
         Ctrl_judge : OUT  std_logic;
         Ctrl_b : OUT  std_logic;
         Ctrl_Jump : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '1';
   signal instruction : std_logic_vector(15 downto 0) := (others => '0');
   signal PC : std_logic_vector(15 downto 0) := (others => '0');
   signal Break : std_logic := '0';

 	--Outputs
   signal out_instruction : std_logic_vector(15 downto 0);
   signal Ctrl_xy : std_logic;
   signal Ctrl_immidiate : std_logic_vector(2 downto 0);
   signal Ctrl_extend : std_logic;
   signal Ctrl_SP : std_logic_vector(1 downto 0);
   signal Ctrl_CMP : std_logic_vector(1 downto 0);
   signal Ctrl_IH : std_logic_vector(1 downto 0);
   signal Ctrl_r : std_logic_vector(1 downto 0);
   signal Ctrl_WB : std_logic;
   signal Ctrl_op1 : std_logic;
   signal Ctrl_op2 : std_logic;
   signal Ctrl_op : std_logic_vector(3 downto 0);
   signal Ctrl_addr : std_logic_vector(1 downto 0);
   signal Ctrl_PCMEM : std_logic;
   signal Ctrl_DRRE : std_logic;
   signal Ctrl_judge : std_logic;
   signal Ctrl_b : std_logic;
   signal Ctrl_Jump : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
	
	TYPE myarray is array (29 downto 0) of std_logic_vector(15 downto 0);
	--signal x1 : std_logic_vector(15 downto 0) := "0100100100000000"; -- ADDIU
	constant ins : myarray :=(
		"0100100100000000",--ADDIU
		"0100000100100000",--ADDIU3
		"0110001100000000",--ADDSP
		"1110000000000001",--ADDU
		"0000100000000000",--NOP
		"0001000000000000",--B
		"0010000000000000",--BEQZ
		"0010100000000000",--BNEZ
		"0011000000000000",--SLL
		"0011000000000011",--SRA
		"0011000000000010",--SRL
		"0101000000000000",--SLTI
		"0110000000000000",--BTEQZ
		"0110010000000000",--MTSP
		"0110100000000000",--LI
		"0111000000000000",--CMPI
		"1001000000000000",--LW_SP
		"1001100000000000",--LW
		"1101000000000000",--SW_SP
		"1101100000000000",--SW
		"0100100100000000",
		"0100100100000000",
		"0100100100000000",
		"0100100100000000",
		"0100100100000000",
		"0100100100000000",
		"0100100100000000",
		"0100100100000000",
		"0100100100000000",
		"0100100100000000"
	);
	
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: parseCtrl PORT MAP (
          clk => clk,
          rst => rst,
          instruction => instruction,
          PC => PC,
          Break => Break,
          out_instruction => out_instruction,
          Ctrl_xy => Ctrl_xy,
          Ctrl_immidiate => Ctrl_immidiate,
          Ctrl_extend => Ctrl_extend,
          Ctrl_SP => Ctrl_SP,
          Ctrl_CMP => Ctrl_CMP,
          Ctrl_IH => Ctrl_IH,
          Ctrl_r => Ctrl_r,
          Ctrl_WB => Ctrl_WB,
          Ctrl_op1 => Ctrl_op1,
          Ctrl_op2 => Ctrl_op2,
          Ctrl_op => Ctrl_op,
          Ctrl_addr => Ctrl_addr,
          Ctrl_PCMEM => Ctrl_PCMEM,
          Ctrl_DRRE => Ctrl_DRRE,
          Ctrl_judge => Ctrl_judge,
          Ctrl_b => Ctrl_b,
          Ctrl_Jump => Ctrl_Jump
        );

   -- Clock process definitions
   clk_process :process
	--variable count : Integer range 0 to 29 := 29;
   begin
		clk <= '0';
		wait for clk_period/2;
		--instruction <= ins(count);
		--count := count-1;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      --wait for 50 ns;
		for i in 29 downto 0 loop
			instruction <= ins(i);
			--wait for 10 ns;
		end loop;
      --wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
