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
			  rst: in std_logic;
			  Addr : in  STD_LOGIC_VECTOR (15 downto 0);	--二路选择器送来的地址
           Data : in  STD_LOGIC_VECTOR (15 downto 0);	--从RAM1那条线读出来的数据作为数据传给寄存器堆
           MEM_Ry : in  STD_LOGIC_VECTOR (15 downto 0);	--MEM阶段送来的Ry的值，可能写回MEM[Addr]
           instruction : in  STD_LOGIC_VECTOR (15 downto 0);	--从RAM2读出来的数据作为指令
			  outAddr : out  STD_LOGIC_VECTOR (15 downto 0);	--二路选择器送来的地址
           outData : out  STD_LOGIC_VECTOR (15 downto 0);	--从RAM1那条线读出来的数据作为数据传给寄存器堆
           outMEM_Ry : out  STD_LOGIC_VECTOR (15 downto 0);	--MEM阶段送来的Ry的值，可能写回MEM[Addr]
           outinstruction : out  STD_LOGIC_VECTOR (15 downto 0);	--从RAM2读出来的数据作为指令
           Control_MEM : in  STD_LOGIC_VECTOR (1 downto 0));	--控制访问IR/DR以及访问DR的读/写
end Memory;

architecture Behavioral of Memory is
shared variable Reginstruction: std_logic_vector(15 downto 0);
shared variable RegAddr: std_logic_vector(15 downto 0);
shared variable RegData: std_logic_vector(15 downto 0);
shared variable RegMEM_Ry: std_logic_vector(15 downto 0);
begin
	process(clk, rst, Addr, Data, MEM_Ry, instruction, Control_MEM)
	begin
		if(rst='0')then
			Reginstruction:="0000000000000000";
			RegAddr:="0000000000000000";
			RegData:="0000000000000000";
			RegMEM_Ry:="0000000000000000";
		else
			if(Control_MEM="00")then	--访问IR，读取指令
				Reginstruction:="0100100100000001";	--ADDIU指令
			elsif(Control_MEM="11")then	--访问DR,SW类型指令，数据写入内存
				null;
			elsif(Control_MEM="01")then	--访问DR,LW类型指令，数据写回寄存器
				RegData:="0101010110101010";
			end if;
		end if;
		outAddr<=RegAddr;
		outData<=RegData;
		outMEM_Ry<=RegMEM_Ry;
		outinstruction<=Reginstruction;
	end process;

end Behavioral;

