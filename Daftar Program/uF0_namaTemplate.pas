unit uF0_namaTemplate; //Ganti : sesuaikan dengan nama file, tapi tanpa ".pas"

interface

uses uP1_tipeBentukan, uP3_Umum;

	procedure mainNamaTemplate(ID : integer; //hapus parameter yang tidak perlu
									var dataBahanMentah : tabelBahanMentah; 
									var dataBahanOlahan : tabelBahanOlahan; 
									var dataResep : tabelResep; 
									var dataSimulasi : tabelSimulasi
									var dataInventoriBahanMentah : tabelBahanMentah
									var dataInventoriBahanOlahan : tabelBahanOlahan); 
	{ I.S : Bagaimana keadaan awal dari tiap variabel pada parameter?
	* F.S : Bagaimana keadaan akhir dari tiap variabel pada parameter?}
	
	procedure contohProsedurPembantu(ID : integer; //hapus parameter yang tidak perlu
									var dataBahanMentah : tabelBahanMentah; 
									var dataBahanOlahan : tabelBahanOlahan; 
									var dataResep : tabelResep; 
									var dataSimulasi : tabelSimulasi
									var dataInventoriBahanMentah : tabelBahanMentah
									var dataInventoriBahanOlahan : tabelBahanOlahan);
	{ I.S : Bagaimana keadaan awal dari tiap variabel pada parameter?
	* F.S : Bagaimana keadaan akhir dari tiap variabel pada parameter?}

implementation

	procedure mainNamaTemplate(ID : integer; //hapus parameter yang tidak perlu
									var dataBahanMentah : tabelBahanMentah; 
									var dataBahanOlahan : tabelBahanOlahan; 
									var dataResep : tabelResep; 
									var dataSimulasi : tabelSimulasi
									var dataInventoriBahanMentah : tabelBahanMentah
									var dataInventoriBahanOlahan : tabelBahanOlahan); 
	{ I.S : Bagaimana keadaan awal dari tiap variabel pada parameter?
	* F.S : Bagaimana keadaan akhir dari tiap variabel pada parameter?}
	
	procedure contohProsedurPembantu(ID : integer; //hapus parameter yang tidak perlu
									var dataBahanMentah : tabelBahanMentah; 
									var dataBahanOlahan : tabelBahanOlahan; 
									var dataResep : tabelResep; 
									var dataSimulasi : tabelSimulasi
									var dataInventoriBahanMentah : tabelBahanMentah
									var dataInventoriBahanOlahan : tabelBahanOlahan);
	{ I.S : Bagaimana keadaan awal dari tiap variabel pada parameter?
	* F.S : Bagaimana keadaan akhir dari tiap variabel pada parameter?}	

end.

{ TIPS DAN CARA MEMPROGRAM DARI UNIT
* 1. Buat I.S dan F.S sebaik mungkin sehingga orang lain bisa tau maksud program lu tanpa harus ngebaca implementasinya
* 2. Keterangan : I.S(initial state); F.S(final state)
* 3. Jangan mengubah uP0_utama.pas, kalo mau ngetest file ini, silahkan "uncomment" HANYA "mainNamaTemplate()" di uP0_utama.pas atau uF3_startSimulasi.pas
* 4. Kalo mau butuh fungsi atau prosedur topik umum kaya updateTanggal(x) dan sejenisnya, silahkan request ke gue atau bikin sendiri di uP3_umum.pas
* 5. Silahkan perhatikan baik-baik untup tipedata bentukan di uP1_tipeBentukan.pas
* 
* }
