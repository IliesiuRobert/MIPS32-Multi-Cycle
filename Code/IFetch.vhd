library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity IFetch is
    Port (Jump : in STD_LOGIC;
          JumpAddress : in STD_LOGIC_VECTOR(31 downto 0);
          PCSrc : in STD_LOGIC;
          BranchAddress : in STD_LOGIC_VECTOR(31 downto 0);
          En : in STD_LOGIC;
          RST : in STD_LOGIC;
          clk : in STD_LOGIC;
          PC : out STD_LOGIC_VECTOR(31 downto 0);
          Instruction : out STD_LOGIC_VECTOR(31 downto 0));
end IFetch;

--Problema:
-- Sa se determine valoarea para maxima dintr-un sir de N numere stocate in memorie incepand cu adresa A (A<12). 
-- A si N se citesc de la adresele 0, respectiv 4. 
-- Rezultatul se va scrie in memorie la adresa 8.

architecture Behavioral of IFetch is
type rom_t is array(0 to 31) of STD_LOGIC_VECTOR(31 downto 0);
signal mem : rom_t := (B"000010_00000_00011_0000000000000100",   -- X"08030004" 00 lw $3,4($0) => incarcam valoarea lui N
                       B"000000_00000_00000_00000_00000_000000", -- X"00000000" 01 add $0,$0,$0 => NoOp
                       B"000000_00000_00000_00000_00000_000000", -- X"00000000" 02 add $0,$0,$0 => NoOp
                       B"000000_00000_00011_00100_00000_000000", -- X"00032000" 03 add $4,$0,$3 => numarul maxim de iteratii
                       B"000100_00001_00100_0000000000011001",   -- X"10240019" 04 beq $1,$4,25 => sarim la instructiunea 30 daca nu sunt egale
                       B"000000_00000_00000_00000_00000_000000", -- X"00000000" 05 add $0,$0,$0 => NoOp
                       B"000000_00000_00000_00000_00000_000000", -- X"00000000" 06 add $0,$0,$0 => NoOp
                       B"000000_00000_00000_00000_00000_000000", -- X"00000000" 07 add $0,$0,$0 => NoOp
                       B"000010_00010_00110_0000000000001100",   -- X"0846000C" 08 lw $6,12($2) => luam elementul curent din vector  
                       B"000001_00000_01010_0000000000000001",   -- X"040A0001" 09 addi $10,$0,1 => luam $10 = 1
                       B"000000_00000_00000_00000_00000_000000", -- X"00000000" 10 add $0,$0,$0 => NoOp
                       B"000000_00000_00000_00000_00000_000000", -- X"00000000" 11 add $0,$0,$0 => NoOp
                       B"000000_00110_01010_00111_00000_000100", -- X"00CA3804" 12 and $7,$6,$10 => facem and cu valoare 1 din $10 pentru a verifica ultimul bit
                       B"000000_00000_00000_00000_00000_000000", -- X"00000000" 13 add $0,$0,$0 => NoOp
                       B"000000_00000_00000_00000_00000_000000", -- X"00000000" 14 add $0,$0,$0 => NoOp
                       B"000100_00111_01010_0000000000001011",   -- X"10EA000A" 15 beq $7,$10,11 => daca este 1, atunci este numar impar si sarim la instructiunea 27
                       B"000000_00000_00000_00000_00000_000000", -- X"00000000" 16 add $0,$0,$0 => NoOp
                       B"000000_00000_00000_00000_00000_000000", -- X"00000000" 17 add $0,$0,$0 => NoOp
                       B"000000_00000_00000_00000_00000_000000", -- X"00000000" 18 add $0,$0,$0 => NoOp
                       B"000000_00101_00110_01000_00000_000111", -- X"00A64007" 19 slt $8,$5,$6 => daca maximul < valoarea curenta => $8 = 1
                       B"000000_00000_00000_00000_00000_000000", -- X"00000000" 20 add $0,$0,$0 => NoOp
                       B"000000_00000_00000_00000_00000_000000", -- X"00000000" 21 add $0,$0,$0 => NoOp
                       B"000100_01000_00000_0000000000000100",   -- X"11000004" 22 beq $8,$0,4 => daca e 0, sarim la urmatorul index in veactor
                       B"000000_00000_00000_00000_00000_000000", -- X"00000000" 23 add $0,$0,$0 => NoOp
                       B"000000_00000_00000_00000_00000_000000", -- X"00000000" 24 add $0,$0,$0 => NoOp
                       B"000000_00000_00000_00000_00000_000000", -- X"00000000" 25 add $0,$0,$0 => NoOp
                       B"000000_00110_00000_00101_00000_000000", -- X"00C02800" 26 add $5,$6,$0 => adaugam elementul curent din vector la registrul $5
                       B"000001_00010_00010_0000000000000100",   -- X"04420004" 27 addi $2,$2,4 => luam urmatorul element din vector
                       B"000001_00001_00001_0000000000000001",   -- X"04210001" 28 addi $1,$1,1 => i = i + 1
                       B"000111_00000000000000000000000100",     -- X"1C000009" 29 j 4 => sarim inapoi la instructiunea 4
                       B"000000_00000_00000_00000_00000_000000", -- X"00000000" 30 add $0,$0,$0 => NoOp
                       B"000011_00000_00101_0000000000001000",   -- X"0C050008" 31 sw $5,8($0) => stocam maximul la adresa 8
                       others => X"00000000");

signal Q : STD_LOGIC_VECTOR(31 downto 0);
signal D : STD_LOGIC_VECTOR(31 downto 0);
signal Mux1 : STD_LOGIC_VECTOR(31 downto 0);

begin
    process(clk, RST)
    begin
        if RST = '1' then Q <= (others => '0');
        elsif rising_edge(clk) then 
            if En = '1' then Q <= D;
            end if;
        end if;     
    end process;
    
    PC <= Q + X"00000004";  

    with PCSrc SELECT 
        Mux1 <= Q + 4 when '0',
        BranchAddress when '1'; 
    
    with Jump SELECT
        D <= Mux1 when '0',
        JumpAddress when '1';
    
    Instruction <= mem(conv_integer(Q(6 downto 2)));
end Behavioral;
