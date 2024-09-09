library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is
	port(   A,B : in integer range 0 to 15;
		OP : in std_logic_vector(1 downto 0);
		Qout : out integer range 0 to 15;
		z,c : out std_logic);
end entity ALU;

architecture ALU_arc of ALU is
begin
	
	process(A,B,OP)
	
	variable Q30 : integer range 0 to 30;
	begin
		if OP = "00" then
		
			Q30 := A + B;
			if Q30 > 15 then
				Q30 := Q30 - 16;
				Qout <= Q30;
				c <= '1';
				z <= '0';
			else
				Qout <= Q30;
				c <= '0';
				z <= '0';
			end if;
		
		elsif OP = "01" then
			
			if A >= B then
				Q30 := A - B;
				Qout <= Q30;
				c <= '0';
				z <= '0';
			else 
				Q30 := B - A;
				Qout <= Q30;
				c <= '1';
				z <= '0';
			end if;
		
		elsif OP = "10" then
		
			if (A * B) <= 15 then
				Q30 := A*B;
				Qout <= Q30;
				c <= '0';
				z <= '0';
			else
				Q30 := 0;
				Qout <= Q30;
				c <= '1';
				z <= '0';
			end if;
			
		else
		
			if B = 0 then 
				Q30 := 0;
				Qout <= Q30;
				c <= '1';
				z <= '0';
			else
				Q30 := A/B;
				Qout <= Q30;
				c <= '0';
				z <= '0';
			end if;
		end if;
		
		if Q30 = 0 then 
			z <= '1';
		end if;
	end process;
end architecture ALU_arc;
