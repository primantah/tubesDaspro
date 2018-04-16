unit uF6_OlahBahan;

interface

uses uP1_tipeBentukan, uP3_Umum;

	procedure mainOlahBahan(ID : integer; //hapus parameter yang tidak perlu
									var dataBahanMentah : tabelBahanMentah; 
									var dataBahanOlahan : tabelBahanOlahan;  
									var dataSimulasi : tabelSimulasi;
									var inventoriBahanOlahan : tabelBahanOlahan); 
	{ I.S : Bagaimana keadaan awal dari tiap variabel pada parameter?
	* F.S : Bagaimana keadaan akhir dari tiap variabel pada parameter?}
	
	procedure cariBM(var dataBahanMentah : tabelBahanMentah; 
									var s : string;
									var found : boolean;
									var iBM : integer);
	{ I.S : Bagaimana keadaan awal dari tiap variabel pada parameter?
	* F.S : Bagaimana keadaan akhir dari tiap variabel pada parameter?}
	
	procedure cekBM(var dataBahanMentah : tabelBahanMentah; 
									var BO : bahanOlahan;
									var found : boolean;
									var q : boolean;
									var jumlah : integer);
	{ I.S : Bagaimana keadaan awal dari tiap variabel pada parameter?
	* F.S : Bagaimana keadaan akhir dari tiap variabel pada parameter?}
	
	procedure kurangiBM(var dataBahanMentah : tabelBahanMentah; 
									var BO : bahanOlahan;
									var found : boolean;
									var jumlah : integer);
	{ I.S : Bagaimana keadaan awal dari tiap variabel pada parameter?
	* F.S : Bagaimana keadaan akhir dari tiap variabel pada parameter?}
	
	procedure cariBO(var found : boolean; 
									var iBO : integer;
									var dataBahanOlahan : tabelBahanOlahan;
									var s : string);
	{ I.S : Bagaimana keadaan awal dari tiap variabel pada parameter?
	* F.S : Bagaimana keadaan akhir dari tiap variabel pada parameter?}

implementation

	procedure mainOlahBahan(ID : integer; //hapus parameter yang tidak perlu
									var dataBahanMentah : tabelBahanMentah; 
									var dataBahanOlahan : tabelBahanOlahan; 
									var dataSimulasi : tabelSimulasi;
									var inventoriBahanOlahan : tabelBahanOlahan); 
	{ I.S : Bagaimana keadaan awal dari tiap variabel pada parameter?
	* F.S : Bagaimana keadaan akhir dari tiap variabel pada parameter?}
	var
	found,q : boolean;
	i, iBO, index, j, jumlah, stok : integer;
	BO : bahanOlahan;
	s : string;
	
	begin
		stok:=0;
		writeln('Masukkan bahan yang ingin dibuat');
		writeln('Bahan olahan yang tersedia: ');
		for i:=1 to dataBahanOlahan.banyakItem do
			begin
			write(dataBahanOlahan.itemKe[i].nama,'<-- ');
			for j:=1 to dataBahanOlahan.itemKe[i].banyakBahanBaku do
			write(dataBahanOlahan.itemKe[i].bahanBaku[j],' ');
			writeln();
			end;
		readln(s);
		cariBO(found,iBO,dataBahanOlahan,s);
		writeln('Berapa banyak yang ingin dibuat?');
		readln(jumlah);
		for i:=1 to inventoriBahanOlahan.banyakItem do
			begin
			stok:=stok+inventoriBahanOlahan.itemKe[i].jumlahTersedia;
			end;
		if (found) and (stok+jumlah<=dataSimulasi.itemKe[ID].kapasitasMaxInventori) then
			begin
			BO:=dataBahanOlahan.itemKe[iBO];
			cekBM(dataBahanMentah,BO,found,q,jumlah);
				if not(found) then
					writeln('Bahan mentah tak ditemukan!')
				else if not(q) then
					writeln('Bahan mentah tak cukup!')
				else
					begin
					kurangiBM(dataBahanMentah,BO,found,jumlah);
					index:= inventoriBahanOlahan.banyakItem+1;
						{memasukan ke array inventoriBahanOlahan}
						inventoriBahanOlahan.itemKe[index].nama := s;
						{membuat tanggal kadaluarsa}
						for j:= 1 to dataSimulasi.itemKe[ID].jumlahHariHidup do
						begin
							updateTanggal(inventoriBahanOlahan.itemKe[index].tanggalBuat);
						end;
						inventoriBahanOlahan.itemKe[index].jumlahTersedia:=jumlah;
						inc(inventoriBahanOlahan.banyakItem); 
						inventoriBahanOlahan.itemKe[index].hargaJual:=BO.hargaJual;
					dec(dataSimulasi.itemKe[ID].jumlahEnergi);
					writeln('Bahan olahan ',dataBahanOlahan.itemKe[iBO].nama,' telah dibuat!');
					end;
			end
		else if not(found) then
			writeln('Bahan olahan tidak ditemukan!')
		else if (stok+jumlah>dataSimulasi.itemKe[ID].kapasitasMaxInventori) then
			writeln('Jumlah bahan olahan melebihi kapasitas!');
	end;
	
	procedure cariBM(var dataBahanMentah : tabelBahanMentah; 
									var s : string;
									var found : boolean;
									var iBM : integer);
	{ I.S : Bagaimana keadaan awal dari tiap variabel pada parameter?
	* F.S : Bagaimana keadaan akhir dari tiap variabel pada parameter?}	
	var
	i : integer;
	begin
	found:=false;
	i:=1;
		repeat
		if s=dataBahanMentah.itemKe[i].nama then
			begin
			found:=true;
			iBM:=i;
			end;
		inc(i);
		until (found=true) or (i>dataBahanMentah.banyakItem);
	end;
	
	procedure cariBO(var found : boolean; 
									var iBO : integer;
									var dataBahanOlahan : tabelBahanOlahan;
									var s : string);
	{ I.S : Bagaimana keadaan awal dari tiap variabel pada parameter?
	* F.S : Bagaimana keadaan akhir dari tiap variabel pada parameter?}
	var
	i : integer;
	begin
	found:=false;
	i:=1;
		repeat
		if s=dataBahanOlahan.itemKe[i].nama then
			begin
			found:=true;
			iBO:=i;
			end;
		inc(i);
		until (found=true) or (i>dataBahanOlahan.banyakItem);
	end;
	
	procedure cekBM(var dataBahanMentah : tabelBahanMentah; 
									var BO : bahanOlahan;
									var found : boolean;
									var q : boolean;
									var jumlah : integer);
	{ I.S : Bagaimana keadaan awal dari tiap variabel pada parameter?
	* F.S : Bagaimana keadaan akhir dari tiap variabel pada parameter?}
	var
	i, x : integer;
	begin
	found:=true;
	q:=true;
	i:=1;
	x:=0;
		repeat
			cariBM(dataBahanMentah,BO.bahanBaku[i],found,x);
			if found then
				if dataBahanMentah.itemKe[x].jumlahTersedia<jumlah then
				q:=false;
			inc(i);
		until ((found=false) or (q=false)) or (i>BO.banyakBahanBaku);
	end;
	
	procedure kurangiBM(var dataBahanMentah : tabelBahanMentah; 
									var BO : bahanOlahan;
									var found : boolean;
									var jumlah : integer);
	{ I.S : Bagaimana keadaan awal dari tiap variabel pada parameter?
	* F.S : Bagaimana keadaan akhir dari tiap variabel pada parameter?}
	var
	i, x : integer;
	begin
	found:=true;
	i:=1;
	x:=0;
		repeat
			cariBM(dataBahanMentah,BO.bahanBaku[i],found,x);
			if found then
				dataBahanMentah.itemKe[x].jumlahTersedia:=dataBahanMentah.itemKe[x].jumlahTersedia-jumlah;
			inc(i);
		until (found=false) or (i>BO.banyakBahanBaku);
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
