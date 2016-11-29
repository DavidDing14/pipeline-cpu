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
			  rst: in std_logic;
			  Addr : in  STD_LOGIC_VECTOR (15 downto 0);	--��·ѡ���������ĵ�ַ
           Data : in  STD_LOGIC_VECTOR (15 downto 0);	--��RAM1�����߶�������������Ϊ���ݴ����Ĵ�����
           MEM_Ry : in  STD_LOGIC_VECTOR (15 downto 0);	--MEM�׶�������Ry��ֵ������д��MEM[Addr]
           instruction : in  STD_LOGIC_VECTOR (15 downto 0);	--��RAM2��������������Ϊָ��
			  outAddr : out  STD_LOGIC_VECTOR (15 downto 0);	--��·ѡ���������ĵ�ַ
           outData : out  STD_LOGIC_VECTOR (15 downto 0);	--��RAM1�����߶�������������Ϊ���ݴ����Ĵ�����
           outMEM_Ry : out  STD_LOGIC_VECTOR (15 downto 0);	--MEM�׶�������Ry��ֵ������д��MEM[Addr]
           outinstruction : out  STD_LOGIC_VECTOR (15 downto 0);	--��RAM2��������������Ϊָ��
           Control_MEM : in  STD_LOGIC_VECTOR (1 downto 0));	--���Ʒ���IR/DR�Լ�����DR�Ķ�/д
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
			if(Control_MEM="00")then	--����IR����ȡָ��
				Reginstruction:="0100100100000001";	--ADDIUָ��
			elsif(Control_MEM="11")then	--����DR,SW����ָ�����д���ڴ�
				null;
			elsif(Control_MEM="01")then	--����DR,LW����ָ�����д�ؼĴ���
				RegData:="0101010110101010";
			end if;
		end if;
		outAddr<=RegAddr;
		outData<=RegData;
		outMEM_Ry<=RegMEM_Ry;
		outinstruction<=Reginstruction;
	end process;

end Behavioral;

