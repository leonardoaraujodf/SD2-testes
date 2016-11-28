----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.10.2016 22:53:39
-- Design Name: 
-- Module Name: top_level - Behavioral
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

entity top_level is
    Port ( clk : in STD_LOGIC;
           ready : in STD_LOGIC;
           rw : in STD_LOGIC;
           rst : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (7 downto 0);
           addr : in STD_LOGIC_VECTOR (3 downto 0);
           cs : in STD_LOGIC;
           data_out : out STD_LOGIC_VECTOR (7 downto 0));
end top_level;

architecture Behavioral of top_level is

component controlador_fsm is
    Port (clk: in STD_LOGIC;
          ready: in STD_LOGIC;
          rw: in STD_LOGIC;
          rst: in STD_LOGIC;
          oe_b: out STD_LOGIC;
          we: out STD_LOGIC
                             );
end component;

component ram_memory is
Port ( we: in STD_LOGIC;
       addr: in STD_LOGIC_VECTOR (3 downto 0);
       data_in: in STD_LOGIC_VECTOR (7 downto 0);
       clk: in STD_LOGIC;
       cs: in STD_LOGIC;
       oe_b: in STD_LOGIC;
       data_out: out STD_LOGIC_VECTOR (7 downto 0)
         );
end component;

signal oe_b: STD_LOGIC;
signal we: STD_LOGIC;

begin

G1: controlador_fsm port map (
                                clk => clk,
                                ready => ready,
                                rw => rw,
                                rst => rst,
                                oe_b => oe_b,
                                we => we
                              );
G2: ram_memory port map (
                            we => we,
                            addr => addr,
                            data_in => data_in,
                            clk => clk,
                            cs => cs,
                            oe_b => oe_b,
                            data_out => data_out
                         );                              

end Behavioral;
