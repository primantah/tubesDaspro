unit uF10_istirahat; 

interface

uses uP1_tipeBentukan, uP3_Umum;

	procedure mainIstirahat(var jmlIstirahat : integer;
									var energy : integer);
	{ I.S : jmlIstirahat = berapa kali istirahat hari ini, energy = energy hari ini
	* F.S : jmlIstirahat = berapa kali istirahat hari ini+1, energy = energy hari ini+1}

implementation

	procedure mainIstirahat(var jmlIstirahat : integer;
									var energy : integer);
	{ I.S : jmlIstirahat = berapa kali istirahat hari ini, energy = energy hari ini
	* F.S : jmlIstirahat = berapa kali istirahat hari ini+1, energy = energy hari ini+1}
	{ ALGORITMA }
	begin
		if energy >= 10 then
			writeln('Energi anda masih penuh!')
		else if jmlIstirahat>=6 then
			writeln('Anda hanya bisa istirahat 6x sehari!')
		else
		begin
			jmlIstirahat:=jmlIstirahat+1;
			energy:=energy+1;
		end;
	end;
	

end.
