library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.CMatrix.all;

entity test is
end entity;

architecture Q1TEST of test is
begin

    process

        variable a, b, c: Matrix(0 to 1, 0 to 1);
        variable m: Matrix(0 to 1, 0 to 1);
    begin

        FILL(m);

        a := m;

        report "A:";


        wait for 10 ns;

        FILL(m);

        b := m;

        report "B:";


        wait for 10 ns;

        c := ADD(a, b);

        report "A + B:";

        PRINT(c);

        wait for 10 ns;

        c := MUL(a, b);

        report "A * B:";
        PRINT(c);

        wait;

    end process;

end architecture;