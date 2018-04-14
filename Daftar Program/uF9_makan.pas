unit uF9_makan; 

interface

uses uP1_tipeBentukan, uP3_Umum;

	procedure mainMakan(var jmlMakan : integer;
									var energy : integer);
	{ I.S : jmlMakan = berapa kali makan hari ini, energy = energy hari ini
	* F.S : jmlMakan = berapa kali makan hari ini+1, energy = energy hari ini+3}

implementation

	procedure mainMakan(var jmlMakan : integer;
									var energy : integer); 
	{ I.S : jmlMakan = berapa kali makan hari ini, energy = energy hari ini
	* F.S : jmlMakan = berapa kali makan hari ini+1, energy = energy hari ini+3}
	begin
		if energy >= 10 then
			writeln('Energi anda masih penuh!')
		else if jmlMakan>=3 then
			writeln('Anda hanya bisa makan 3x sehari!')
		else if energy >=7 then
			begin
			jmlMakan:=jmlMakan+1;
			energy:=10;
			end
		else
			begin
			jmlMakan:=jmlMakan+1;
			energy:=energy+3;
			end;
	end;
	

end.

{ TIPS DAN CARA MEMPROGRAM DARI UNIT
* 1. Buat I.S dan F.S sebaik mungkin sehingga orang lain bisa tau maksud program lu tanpa harus ngebaca implementasinya
* 2. Keterangan : I.S(initial state); F.S(final state)
* 3. Jangan mengubah uP0_utama.pas, kalo mau ngetest file ini, silahkan "uncomment" HANYA "mainNamaTemplate()" di uP0_utama.pas atau uF3_startSimulasi.pas
* 4. Kalo mau butuh fungsi atau prosedur topik umum kaya updateTanggal(x) dan sejenisnya, silahkan request ke gue atau bikin sendiri di uP3_umum.pas
* 5. Silahkan perhatikan baik-baik untup tipedata bentukan di uP1_tipeBentukan.pas
* 
* }
