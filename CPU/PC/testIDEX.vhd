--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:34:48 11/23/2016
-- Design Name:   
-- Module Name:   E:/pipeline-cpu/CPU/PC/testIDEX.vhd
-- Project Name:  PC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: IDEX_Reg
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
 
ENTITY testIDEX IS
END testIDEX;
 
ARCHITECTURE behavior OF testIDEX IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT IDEX_Reg
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         PC : IN  std_logic_vector(15 downto 0);
         outPC : OUT  std_logic_vector(15 downto 0);
         break : IN  std_logic;
         Reg1 : IN  std_logic_vector(15 downto 0);
         Reg2 : IN  std_logic_vector(15 downto 0);
         RegND : IN  std_logic_vector(3 downto 0);
         Data_Ry : IN  std_logic_vector(15 downto 0);
         Control_WB : IN  std_logic;
         Control_op1 : IN  std_logic;
         Control_op2 : IN  std_logic_vector(1 downto 0);
         Control_op : IN  std_logic_vector(3 downto 0);
         Control_addr : IN  std_logic_vector(1 downto 0);
         Control_PCMEM : IN  std_logic;
         Control_DRRE : IN  std_logic;
         outReg1 : OUT  std_logic_vector(15 downto 0);
         outReg2 : OUT  std_logic_vector(15 downto 0);
         outRegND : OUT  std_logic_vector(3 downto 0);
         outData_Ry : OUT  std_logic_vector(15 downto 0);
         outControl_WB : OUT  std_logic;
         outControl_op1 : OUT  std_logic;
         outControl_op2 : OUT  std_logic_vector(1 downto 0);
         outControl_op : OUT  std_logic_vector(3 downto 0);
         outControl_addr : OUT  std_logic_vector(1 downto 0);
         outControl_PCMEM : OUT  std_logic;
         outControl_DRRE : OUT  std_logic;
         Control_BJ : IN  std_logic;
         Control_Jump : IN  std_logic;
         Control_ctrl_JJ : OUT  std_logic;
         Control_JJ : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '1';
   signal rst : std_logic := '1';
   signal PC : std_logic_vector(15 downto 0) := (others => '0');
   signal break : std_logic := '0';
   signal Reg1 : std_logic_vector(15 downto 0) := (others => '0');
   signal Reg2 : std_logic_vector(15 downto 0) := (others => '0');
   signal RegND : std_logic_vector(3 downto 0) := (others => '0');
   signal Data_Ry : std_logic_vector(15 downto 0) := (others => '0');
   signal Control_WB : std_logic := '0';
   signal Control_op1 : std_logic := '0';
   signal Control_op2 : std_logic_vector(1 downto 0) := (others => '0');
   signal Control_op : std_logic_vector(3 downto 0) := (others => '0');
   signal Control_addr : std_logic_vector(1 downto 0) := (others => '0');
   signal Control_PCMEM : std_logic := '0';
   signal Control_DRRE : std_logic := '0';
   signal Control_BJ : std_logic := '0';
   signal Control_Jump : std_logic := '0';

 	--Outputs
   signal outPC : std_logic_vector(15 downto 0);
   signal outReg1 : std_logic_vector(15 downto 0);
   signal outReg2 : std_logic_vector(15 downto 0);
   signal outRegND : std_logic_vector(3 downto 0);
   signal outData_Ry : std_logic_vector(15 downto 0);
   signal outControl_WB : std_logic;
   signal outControl_op1 : std_logic;
   signal outControl_op2 : std_logic_vector(1 downto 0);
   signal outControl_op : std_logic_vector(3 downto 0);
   signal outControl_addr : std_logic_vector(1 downto 0);
   signal outControl_PCMEM : std_logic;
   signal outControl_DRRE : std_logic;
   signal Control_ctrl_JJ : std_logic;
   signal Control_JJ : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: IDEX_Reg PORT MAP (
          clk => clk,
          rst => rst,
          PC => PC,
          outPC => outPC,
          break => break,
          Reg1 => Reg1,
          Reg2 => Reg2,
          RegND => RegND,
          Data_Ry => Data_Ry,
          Control_WB => Control_WB,
          Control_op1 => Control_op1,
          Control_op2 => Control_op2,
          Control_op => Control_op,
          Control_addr => Control_addr,
          Control_PCMEM => Control_PCMEM,
          Control_DRRE => Control_DRRE,
          outReg1 => outReg1,
          outReg2 => outReg2,
          outRegND => outRegND,
          outData_Ry => outData_Ry,
          outControl_WB => outControl_WB,
          outControl_op1 => outControl_op1,
          outControl_op2 => outControl_op2,
          outControl_op => outControl_op,
          outControl_addr => outControl_addr,
          outControl_PCMEM => outControl_PCMEM,
          outControl_DRRE => outControl_DRRE,
          Control_BJ => Control_BJ,
          Control_Jump => Control_Jump,
          Control_ctrl_JJ => Control_ctrl_JJ,
          Control_JJ => Control_JJ
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
		wait for 100 ns;
		rst<='0';
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		rst<='1';
		 PC<="0101010110101010";
		 Reg1<="1111000000001111";
		 Reg2<="0000111111110000";
		 RegND<="0011";
		 Data_Ry<="1111111100000000";
		 Control_WB<='0';
		 Control_op1<='0';
		 Control_op2<="01";
		 Control_op<="0001";
		 Control_addr<="10";
		 Control_PCMEM<='0';
		 Control_DRRE<='0';
		 Control_BJ<='1';
		 wait for 100 ns;
		 clk<='0';
		 wait for 100 ns;
		 clk<='1';
--      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
