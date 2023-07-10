library ieee;
use ieee.std_logic_1164.all;

entity mux_2to1_tb is
end mux_2to1_tb;

architecture behavioral of mux_2to1_tb is
  -- Component declaration for the DUT
  component mux_2to1
    port (a, b, sel : in std_logic;
          y : out std_logic);
  end component;

  -- Testbench signals
  signal a_sig : std_logic := '0';
  signal b_sig : std_logic := '1';
  signal sel_sig : std_logic := '0';
  signal y_sig : std_logic;

begin
  -- Instantiate the DUT
  dut: mux_2to1 port map (a => a_sig, b => b_sig, sel => sel_sig, y => y_sig);

  -- Stimulus process
  stim_proc: process
  begin
    -- Test case 1
    a_sig <= '0';
    b_sig <= '1';
    sel_sig <= '0';
    wait for 10 ns;
    assert y_sig = '0' report "Test case 1 failed" severity error;

    -- Test case 2
    a_sig <= '0';
    b_sig <= '1';
    sel_sig <= '1';
    wait for 10 ns;
    assert y_sig = '1' report "Test case 2 failed" severity error;

    -- Test case 3
    a_sig <= '1';
    b_sig <= '0';
    sel_sig <= '0';
    wait for 10 ns;
    assert y_sig = '1' report "Test case 3 failed" severity error;

    -- Test case 4
    a_sig <= '1';
    b_sig <= '0';
    sel_sig <= '1';
    wait for 10 ns;
    assert y_sig = '0' report "Test case 4 failed" severity error;

    wait;
  end process;
end behavioral;
