library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use IEEE.MATH_COMPLEX.ALL;
use ieee.numeric_std.all;
use IEEE.MATH_COMPLEX.COMPLEX;


package CMatrix is
	--generic 
--	(
--        ROWS: positive := 3;
--        COLS: positive := 3
--    );
	---------- DAMN GENERIC DOESN'T WORK 
    type Complex is record
        real: real;
        imag: real;
    end record;
	

	--type Matrix is array(0 to ROWS-1, 0 to COLS-1) of Complex;	
--	
--	function ADD(A, B: Matrix) return Matrix;
--	
--	function MUL(a: Matrix; b: Matrix) return Matrix;	
--	
--	procedure FILL(m: inout Matrix);
--	
--	procedure PRINT(m: in Matrix); 



	type Matrix is array(integer range <>, integer range <>) of Complex; 
	function ADD(A, B: Matrix) return Matrix;
	function MUL(a: Matrix; b: Matrix) return Matrix;
	procedure FILL(m: inout Matrix);
	procedure PRINT(m: in Matrix);
	
	
end CMatrix;


	library ieee;
	use ieee.std_logic_1164.all;
	use work.CMatrix.all;
	use IEEE.NUMERIC_STD.ALL;






package body CMatrix is

	procedure PRINT(m: in Matrix) is
		begin
			for i in M'range(1) loop
				for j in M'range(2) loop
					report "Element (" & integer'image(i) & ", " & integer'image(j) & "): " &
						   "Real = " & real'image(M(i, j).real) & ", " &
						   "Imaginary = " & real'image(M(i, j).imag);
				end loop;
			end loop;
		end PRINT;
	




	function rand_generator return real is
        variable s1, s2: positive;
        variable temp: real;
    begin
        s1 := 10 + s1;

        s2 := 10 + s2;

        temp := real(s1) * real(s2);

        return temp;

    end function;




	function ADD(A, B: Matrix) return Matrix is
	--variable Result: Matrix;
	variable result: Matrix(A'range(1), A'range(2));
    begin
        for i in A'range(1) loop
            for j in A'range(2) loop
                Result(i, j).real := A(i, j).real + B(i, j).real;
                Result(i, j).imag := A(i, j).imag + B(i, j).imag;
            end loop;
        end loop;
        return result;
    end ADD;
	

	function MUL(a: Matrix; b: Matrix) return Matrix is
		variable result: Matrix(a'range(1), b'range(2));
		variable sum: Complex;
	begin
		for i in a'range(1) loop
			for j in b'range(2) loop
				sum.real := 0.0;
				sum.imag := 0.0;
				for k in a'range(2) loop
					sum.real := sum.real + a(i, k).real * b(k, j).real - a(i, k).imag * b(k, j).imag;
					sum.imag := sum.imag + a(i, k).real * b(k, j).imag + a(i, k).imag * b(k, j).real;
				end loop;
				result(i, j) := sum;
			end loop;
		end loop;
		return result;
	end MUL;



	procedure FILL(m: inout Matrix) is
	begin
		for i in m'range(1) loop
			for j in m'range(2) loop
				m(i, j).real := rand_generator;
				m(i, j).imag := rand_generator ;
			end loop;
		end loop;
	end FILL;


end package body;