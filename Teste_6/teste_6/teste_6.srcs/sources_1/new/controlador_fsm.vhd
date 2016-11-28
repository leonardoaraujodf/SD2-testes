----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.10.2016 22:10:27
-- Design Name: 
-- Module Name: controlador_fsm - Behavioral
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

entity controlador_fsm is
    Port (clk: in STD_LOGIC;
          ready: in STD_LOGIC;
          rw: in STD_LOGIC;
          rst: in STD_LOGIC;
          oe_b: out STD_LOGIC;
          we: out STD_LOGIC
                             );
end controlador_fsm;

architecture Behavioral of controlador_fsm is

type state is (idle,decision,read,write);
signal current_state, next_state : state := idle;

begin

armazena_estado: process (clk,rst)
    begin
    if rising_edge (clk) then
    
        if rst='1' then
            current_state <= idle;
        else
            current_state <= next_state;
        end if;
    end if;
       
    end process;

transicao_estado: process (current_state,ready,rw)
    begin
        case current_state is 
            when idle =>                
                we <= '0';
                oe_b <= '1';
                
                if ready='1' then
                    next_state <= decision;
                else
                    next_state <= idle;
            end if;    
            
            when decision =>
                we <= '0';
                oe_b <= '1';
                
                if rw='1' then
                    next_state <= read;
                else
                    next_state <= write;
                end if;
                
            when read =>
                we <= '0';
                oe_b <= '0';
                
                if ready = '1' then
                    next_state <= idle;
                else
                    next_state <= read;
                end if;
                
            when write =>
                we <= '1';
                oe_b <= '1';
                
                if ready = '1' then
                    next_state <= idle;
                else
                    next_state <= write;
                end if;
            
        end case;
    end process;


end Behavioral;
