library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity FullAdder is
    Port ( A    : in  STD_LOGIC;
           B    : in  STD_LOGIC;
           Cin  : in  STD_LOGIC;
           Sum  : out  STD_LOGIC;
           Cout : out  STD_LOGIC
        );
end FullAdder;






architecture Q of FullAdder is



    begin


        process(A, B, Cin)



        begin



            Sum <= A XOR B XOR Cin;



            Cout <= (A AND B) OR (Cin AND (A XOR B));





            end process;




            end Q;



            library IEEE;



            use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity NBitAdder is
    Generic ( N : integer range 2 to 8 );
    Port ( A    : in  STD_LOGIC_VECTOR (N-1 downto 0);
           B    : in  STD_LOGIC_VECTOR (N-1 downto 0);
           Cin  : in  STD_LOGIC;
           Sum  : out  STD_LOGIC_VECTOR (N-1 downto 0);
           Cout : out  STD_LOGIC);
end NBitAdder;

architecture Q of NBitAdder is
    component FullAdder is
        Port ( A : in  STD_LOGIC;
               B : in  STD_LOGIC;
               Cin : in  STD_LOGIC;
               Sum : out  STD_LOGIC;
               Cout : out  STD_LOGIC);
    end component;

    signal Carry : STD_LOGIC_VECTOR (N downto 0);
begin
    Carry(0) <= Cin;
    FA: for i in 0 to N-1 generate
        Adder_i: FullAdder port map(A(i), B(i), Carry(i), Sum(i), Carry(i+1));
    end generate;
    Cout <= Carry(N);
end Q;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity even is
    Generic ( N : integer range 1 to 8 );
    Port ( Input : in  STD_LOGIC_VECTOR (N-1 downto 0);
           Output : out  STD_LOGIC);
end even;

architecture Q of even is
begin
    process(Input)
        variable Count : integer range 0 to N;
    begin
        Count := 0;
        for i in Input'range loop
            if Input(i) = '1' then
                Count := Count + 1;
            end if;
        end loop;
        
        if Count mod 2 = 0 then
            Output <= '1';
        else
            Output <= '0';
        end if;
    end process;
end Q;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity outt is
    Generic ( N : integer range 1 to 8 );
    Port ( Input     : in  STD_LOGIC;
           ResultNOR : in  STD_LOGIC;
           Sum       : in  STD_LOGIC_VECTOR (N-1 downto 0);
           Output    : out  STD_LOGIC_VECTOR (N downto 0)
        );
end outt;

architecture Q of outt is
begin
    Output <= (ResultNOR & Sum);

    gen_extend_msb: if N > 8 generate
        Output(N) <= Sum(N-1);
    end generate gen_extend_msb;
    
end Q;


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity MainComponent is
    Generic ( N : integer range 2 to 8 );
    Port ( A : in  STD_LOGIC_VECTOR (N-1 downto 0);
           B : in  STD_LOGIC_VECTOR (N-1 downto 0);
           C : out  STD_LOGIC_VECTOR (N downto 0)
        );
end MainComponent;

architecture Q of MainComponent is
    component NBitAdder is
        Generic ( N : integer range 2 to 8 );
        Port ( A    : in  STD_LOGIC_VECTOR (N-1 downto 0);
               B    : in  STD_LOGIC_VECTOR (N-1 downto 0);
               Cin  : in  STD_LOGIC;
               Sum  : out  STD_LOGIC_VECTOR (N-1 downto 0);
               Cout : out  STD_LOGIC
            );
    end component;

    component even is
        Generic ( N : integer range 1 to 8 );
        Port ( Input  : in  STD_LOGIC_VECTOR (N-1 downto 0);
               Output : out  STD_LOGIC
            );
    end component;

    component outt is
        Generic ( N : integer range 1 to 8 );
        Port ( Input     : in  STD_LOGIC;
               ResultNOR : in  STD_LOGIC;
               Sum       : in  STD_LOGIC_VECTOR (N-1 downto 0);
               Output    : out  STD_LOGIC_VECTOR (N downto 0)
            );
    end component;

    signal Sum : STD_LOGIC_VECTOR (N-1 downto 0);
    signal ResultNOR : STD_LOGIC;
begin
    Adder: NBitAdder generic map(N => N)
            port map(A => A, B => B, Cin => '0', Sum => Sum, Cout => open);

    Counter: even generic map(N => N)
            port map(Input => Sum, Output => ResultNOR);

    Generator: outt generic map(N => N)
                port map(Input => '1', ResultNOR => ResultNOR, Sum => Sum, Output => C);
end Q;
