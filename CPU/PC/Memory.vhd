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
    Port ( clk	: in	STD_LOGIC;	--ʱ���źţ����ʶ�д
			  Addr : inout  STD_LOGIC_VECTOR (15 downto 0);	--��·ѡ���������ĵ�ַ
           Data : inout  STD_LOGIC_VECTOR (15 downto 0);	--��RAM1�����߶�������������Ϊ���ݴ����Ĵ�����
           MEM_Ry : inout  STD_LOGIC_VECTOR (15 downto 0);	--MEM�׶�������Ry��ֵ������д��MEM[Addr]
           instruction : inout  STD_LOGIC_VECTOR (15 downto 0);	--��RAM2��������������Ϊָ��
           Control_MEM : in  STD_LOGIC_VECTOR (1 downto 0));	--���Ʒ���IR/DR�Լ�����DR�Ķ�/д
end Memory;

architecture Behavioral of Memory is

begin
	process(clk, Addr, Data, MEM_Ry, instruction, Control_MEM)
	begin
		if(Control_MEM="00")then	--����IR����ȡָ��
			instruction<="010010000101001";	--ADDIUָ��
		elsif(Control_MEM="01")then	--����DR,SW����ָ�����д���ڴ�
			null;
		elsif(Control_MEM="10")then	--����DR,LW����ָ�����д�ؼĴ���
			null;
		end if;
	end process;

end Behavioral;

