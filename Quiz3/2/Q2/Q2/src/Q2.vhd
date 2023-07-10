library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Q2 is
    Port ( x0, x1, x2, x3, x4, x5, x6 : in  std_logic_vector(7 downto 0);

        avg : out  std_logic_vector(7 downto 0);

        median : out  std_logic_vector(7 downto 0));



end Q2;


architecture Behavioral of Q2 is



    constant N: positive := 7;

    subtype int8 is signed(7 downto 0);

    type int8_array is array (0 to N-1) of int8;


    function sort(arr: int8_array) return int8_array is
        variable temp: int8_array := arr;
        variable swapped: boolean;
    begin
        for i in temp'range loop
            swapped := false;

            for j in temp'low to temp'high-1 loop


                if temp(j) > temp(j+1) then

                    temp(j) := temp(j) xor temp(j+1);

                    temp(j+1) := temp(j) xor temp(j+1);

                    temp(j) := temp(j) xor temp(j+1);



                    swapped := true;
                end if;

            end loop;

            exit when not swapped;

        end loop;

        return temp;

    end function;

begin
    process(x0, x1, x2, x3, x4, x5, x6)

        variable sum: int8 := (others => '0');

        variable sorted_x: int8_array;

        variable x: int8_array := (int8(signed(x0)), int8(signed(x1)), int8(signed(x2)), int8(signed(x3)), int8(signed(x4)), int8(signed(x5)), int8(signed(x6)));
    begin

        for i in x'range loop

            sum := sum + x(i);

        end loop;
        avg <= std_logic_vector(sum / N);

        sorted_x := sort(x);

        median <= std_logic_vector(sorted_x(N/2));


    end process;
    
end Behavioral;

