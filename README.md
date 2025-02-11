&nbsp;This project implements a MIPS multi-cycle processor in VHDL, designed to execute MIPS instructions using a multi-cycle approach. The multi-cycle design breaks down the execution of instructions into smaller steps, each requiring a separate clock cycle, allowing for more efficient resource utilization compared to a single-cycle processor.

&nbsp;The processor supports a wide range of MIPS instructions, including arithmetic, logical, load, and store operations, and uses a variety of control signals to coordinate each cycle. Key components of the design include the instruction memory, data memory, ALU, registers, and control unit. Each stage in the multi-cycle processor (fetch, decode, execute, memory access, and write-back) is carefully orchestrated to minimize data hazards and ensure proper sequencing of operations.

&nbsp;The design also includes hazard detection and forwarding mechanisms, which help avoid pipeline stalls and ensure correct execution of instructions. This VHDL implementation offers a practical and efficient way to study the operation of a MIPS processor at the cycle level.

Key Features:  
&ensp;* Multi-cycle instruction execution.  
&ensp;* ALU for arithmetic and logical operations.  
&ensp;* Register file with read and write capabilities.  
&ensp;* Control unit to generate appropriate control signals.  
&ensp;* Hazard detection and forwarding to prevent data hazards.  
&ensp;* Instruction and data memory modules.  
&ensp;* Support for common MIPS instructions (e.g., add, sub, lw, sw, beq).  
&ensp;* Fully synthesizable VHDL code. 

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

&nbsp;Acest proiect implementează un procesor MIPS cu cicluri multiple în VHDL, conceput pentru a executa instrucțiuni MIPS utilizând o abordare multi-ciclu. Designul multi-ciclu împarte executarea instrucțiunilor în pași mai mici, fiecare necesitând un ciclu de ceas separat, permițând o utilizare mai eficientă a resurselor comparativ cu un procesor cu ciclu unic.

&nbsp;Procesorul suportă o gamă largă de instrucțiuni MIPS, inclusiv operații aritmetice, logice, de încărcare și de stocare, și utilizează o varietate de semnale de control pentru a coordona fiecare ciclu. Componentele cheie ale designului includ memoria de instrucțiuni, memoria de date, ALU, registrele și unitatea de control. Fiecare etapă din procesorul cu cicluri multiple (preluare, decodare, execuție, acces la memorie și scriere înapoi) este orchestrat cu atenție pentru a minimiza conflictele de date și pentru a asigura o secvențiere corectă a operațiunilor.

&nbsp;Designul include și mecanisme de detectare a hazardurilor și forwarding, care ajută la evitarea blocajelor în pipeline și asigură execuția corectă a instrucțiunilor. Această implementare VHDL oferă o modalitate practică și eficientă de a studia funcționarea unui procesor MIPS la nivel de ciclu.

Caracteristici cheie:  
&ensp;* Executarea instrucțiunilor în cicluri multiple.  
&ensp;* ALU pentru operații aritmetice și logice.  
&ensp;* Fișier de registre cu capacități de citire și scriere.  
&ensp;* Unitate de control pentru generarea semnalelor de control adecvate.  
&ensp;* Detectarea hazardurilor și forwarding pentru prevenirea hazardurilor de date.  
&ensp;* Module de memorie pentru instrucțiuni și date.  
&ensp;* Suport pentru instrucțiuni comune MIPS (de exemplu, add, sub, lw, sw, beq).  
&ensp;* Cod VHDL complet sintetizabil.  
