----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.10.2016 11:16:00
-- Design Name: 
-- Module Name: ram_memory - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ram_memory is
Port ( we: in STD_LOGIC;
       addr: in STD_LOGIC_VECTOR (3 downto 0);
       data_in: in STD_LOGIC_VECTOR (7 downto 0):=(others => '0');
       clk: in STD_LOGIC;
       cs: in STD_LOGIC;
       oe_b: in STD_LOGIC;
       data_out: out STD_LOGIC_VECTOR (7 downto 0):=(others => '0')
         );
end ram_memory;

architecture Behavioral of ram_memory is

type mem_array is array (15 downto 0) of STD_LOGIC_VECTOR (7 downto 0);
signal mem: mem_array:= (others => (others => '0'));

begin
    process (clk,cs,we)
    begin
        if cs = '1' then
            if rising_edge (clk) then
                if we = '1' then
                    mem(CONV_INTEGER(addr)) <= data_in;
                end if;
            end if;
        end if;    
    end process;

data_out <= mem(CONV_INTEGER(addr)) when cs = '1' and oe_b = '0';
    
end Behavioral;
