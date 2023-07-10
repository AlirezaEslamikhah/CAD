library ieee;
use ieee.std_logic_1164.all;

entity StringDetector is
    port (
        clk     : in std_logic;
        reset   : in std_logic;
        input   : in std_logic;
        output  : out std_logic
    );
end entity StringDetector;

architecture Behavioral of StringDetector is
    type state_type is (S0, S1, S2, S3, S4);
    signal current_state, next_state : state_type;
    signal output_value : std_logic;

begin
    process(clk, reset)
    begin
        if reset = '1' then
            current_state <= S0;
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;

    process(current_state, input)
    begin
        case current_state is
            when S0 =>
                if input = '1' then
                    next_state <= S1;
                else
                    next_state <= S0;
                end if;
                
                output_value <= '0';
                
            when S1 =>
                if input = '1' then
                    next_state <= S2;
                else
                    next_state <= S0;
                end if;
                
                output_value <= '0';
                
            when S2 =>
                if input = '1' then
                    next_state <= S3;
                else
                    next_state <= S0;
                end if;
                
                output_value <= '0';
                
            when S3 =>
                if input = '0' then
                    next_state <= S4;
                else
                    next_state <= S0;
                end if;
                
                output_value <= '0';
                
            when S4 =>
                next_state <= S0;
                output_value <= '1';
                
            when others =>
                next_state <= S0;
                output_value <= '0';
        end case;
    end process;
    

    output <= output_value;
    
end architecture Behavioral;
