unit uF17_upgradeInventori;

interface

uses uP1_tipeBentukan, uP3_Umum;

	procedure mainUpgradeInventori(ID : integer; var dataSimulasi : tabelSimulasi); 
	{ I.S : Bagaimana keadaan awal dari tiap variabel pada parameter?
	* F.S : Bagaimana keadaan akhir dari tiap variabel pada parameter?}
	
implementation

	procedure mainUpgradeInventori(ID : integer; var dataSimulasi : tabelSimulasi); 
	{ I.S : Bagaimana keadaan awal dari tiap variabel pada parameter?
	* F.S : Bagaimana keadaan akhir dari tiap variabel pada parameter?}
	begin
		if (dataSimulasi.jumlahDuit<25) then
		begin
			writeln('Maaf, duit anda tidak cukup untuk upgrade inventori!');
		end else
			dataSimulasi.kapasitasMaxInventori:=dataSimulasi.kapasitasMaxInventori+25;
			dataSimulasi.jumlahDuit:=dataSimulasi.jumlahDuit-25;
	end;

end.

{ TIPS DAN CARA MEMPROGRAM DARI UNIT
* 1. Buat I.S dan F.S sebaik mungkin sehingga orang lain bisa tau maksud program lu tanpa harus ngebaca implementasinya
* 2. Keterangan : I.S(initial state); F.S(final state)
* 3. Jangan mengubah uP0_utama.pas, kalo mau ngetest file ini, silahkan "uncomment" HANYA "mainNamaTemplate()" di uP0_utama.pas atau uF3_startSimulasi.pas
* 4. Kalo mau butuh fungsi atau prosedur topik umum kaya updateTanggal(x) dan sejenisnya, silahkan request ke gue atau bikin sendiri di uP3_umum.pas
* 5. Silahkan perhatikan baik-baik untup tipedata bentukan di uP1_tipeBentukan.pas
* 
* * }
