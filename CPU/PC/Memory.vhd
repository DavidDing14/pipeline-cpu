----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:01:37 11/15/2016 
-- Design Name: 
-- Module Name:    Memory - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Memory is
    Port ( clk	: in	STD_LOGIC;	--时钟信号，访问读写
			  Addr : inout  STD_LOGIC_VECTOR (15 downto 0);	--二路选择器送来的地址
           Data : inout  STD_LOGIC_VECTOR (15 downto 0);	--从RAM1那条线读出来的数据作为数据传给寄存器堆
           MEM_Ry : inout  STD_LOGIC_VECTOR (15 downto 0);	--MEM阶段送来的Ry的值，可能写回MEM[Addr]
           instruction : inout  STD_LOGIC_VECTOR (15 downto 0);	--从RAM2读出来的数据作为指令
           Control_MEM : in  STD_LOGIC_VECTOR (1 downto 0));	--控制访问IR/DR以及访问DR的读/写
end Memory;

architecture Behavioral of Memory is

begin
	process(clk, Addr, Data, MEM_Ry, instruction, Control_MEM)
	begin
		if(Control_MEM="00")then	--访问IR，读取指令
			instruction<="010010000101001";	--ADDIU指令
		elsif(Control_MEM="01")then	--访问DR,SW类型指令，数据写入内存
			null;
		elsif(Control_MEM="10")then	--访问DR,LW类型指令，数据写回寄存器
			null;
		end if;
	end process;

end Behavioral;

