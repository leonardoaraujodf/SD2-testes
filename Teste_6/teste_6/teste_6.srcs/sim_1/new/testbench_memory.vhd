----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.10.2016 19:51:03
-- Design Name: 
-- Module Name: testbench_memory - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity testbench_memory is
--  Port ( );
end testbench_memory;

architecture Behavioral of testbench_memory is

component top_level is 
                  Port ( clk : in STD_LOGIC;
                        ready : in STD_LOGIC;
                        rw : in STD_LOGIC;
                        rst : in STD_LOGIC;
                        data_in : in STD_LOGIC_VECTOR (7 downto 0);
                        addr : in STD_LOGIC_VECTOR (3 downto 0);
                        cs : in STD_LOGIC;
                        data_out : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal clk: STD_LOGIC;
signal ready: STD_LOGIC;
signal rw: STD_LOGIC;
signal rst: STD_LOGIC;
signal data_in: STD_LOGIC_VECTOR (7 downto 0);
signal addr: STD_LOGIC_VECTOR (3 downto 0);
signal cs: STD_LOGIC;
signal data_out: STD_LOGIC_VECTOR (7 downto 0);

begin

G1: top_level port map (
                        clk => clk,
                        ready => ready,
                        rw => rw,
                        rst => rst,
                        data_in => data_in,
                        addr => addr,
                        cs => cs,
                        data_out => data_out

                        );

clk <= '0', '1' after 1100 ns, '0' after 1150 ns, '1' after 1200 ns, '0' after 1250 ns, '1' after 1300 ns, '0' after 1350 ns, '1' after 1400 ns,
            '0' after 1450 ns, '1' after 1500 ns, '0' after 1550 ns, '1' after 1600 ns, '0' after 1650 ns, '1' after 1700 ns, '0' after 1750 ns,
            '1' after 1800 ns, '0' after 1850 ns, '1' after 1900 ns, '0' after 1950 ns, '1' after 2000 ns, '0' after 2050 ns, '1' after 2100 ns,
            '0' after 2150 ns, '1' after 2200 ns, '0' after 2250 ns, '1' after 2300 ns, '0' after 2350 ns, '1' after 2400 ns, '0' after 2450 ns,
            '1' after 2500 ns;
            
cs <= '0', '1' after 1090 ns;

ready <= '0', '1' after 1090 ns, '0' after 1120 ns, '1' after 1590 ns, '0' after 1720 ns, '1' after 1980 ns, '0' after 2120 ns;

rw <= '0', '1' after 1790 ns, '0' after 1820 ns;

rst <= '0', '1' after 2190 ns;

addr <= "0000", "0001" after 1400 ns, "0000" after 1600 ns;

data_in <= "00000100", "00000101" after  1400 ns;

end Behavioral;
