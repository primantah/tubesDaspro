unit uF1_load;

interface

uses uP1_tipeBentukan,uP3_umum;
	
	procedure mainLoad(nf_bahanMentah : string; nf_bahanOlahan:string; nf_resep : string; nf_simulasi : string;
		var T1 : tabelBahanMentah; var T2 : tabelBahanOlahan; var T3 : tabelResep; var T4 : tabelSimulasi; var loaded : boolean);
	{ I.S	: semua data belum terupload dari file eksternal	ket* : nf=nama file
	* F.S	: semua data telah terupload dari file eksternal}

	procedure ambilBaris(baris : string; var dataTemp : tabelString);
	{ I.S	: dataTemp kosong, baris masih full
	* F.S	: dataTemp sudah terisi oleh elemen dari suatu baris, baris kosong}

	procedure loadFileBahanMentah(namaFile : string; var T : tabelBahanMentah);
	{ I.S	: "T" kosong
	* F.S	: "T.itemKe[i]" terisi oleh tiap baris dari file "namaFile"}
	
	procedure loadFileBahanOlahan(namaFile : string; var T : tabelBahanOlahan);
	{ I.S	: "T" kosong, baris masih full
	* F.S	: "T.itemKe[i]" terisi oleh tiap baris dari file "namaFile"}
	
	procedure loadFileResep(namaFile : string; var T : tabelResep);
	{ I.S	: "T" kosong, baris masih full
	* F.S	: "T.itemKe[i]" terisi oleh tiap baris dari file "namaFile"}
	
	procedure loadFileSimulasi(namaFile : string; var T : tabelSimulasi);
	{ I.S	: "T" kosong, baris masih full
	* F.S	: "T.itemKe[i]" terisi oleh tiap baris dari file "namaFile"}
	
<<<<<<< HEAD:Daftar Program/uload.pas
	procedure ambilTanggal(formatString : string; var x : tanggal);
	{ I.S	: tanggal masih dalam format dd//mm/yyyy
	* F.S	: tanggal sudah dalam bentuk record tanggal}
	
	{######################################################}
	{**********KELOMPOK SUBPROGRAM UNTUK SIMULASI**********}
	{######################################################}
	
	{**********KELOMPOK SUBPROGRAM FITUR TIDUR**********}

	procedure checkEnergi(E : integer; var sleep : boolean);
	{Mengecek apakah energi sudah habis}
	
	procedure resetDay(var sleep : boolean;var tgl : tanggal;var energy : integer;var hariHidup : integer);
	{Prosedur Me-reset Hari}
	
	procedure activity(var energy : integer;var Mentah : tabelBahanMentah;var Olahan : tabelBahanOlahan;var stop : boolean;var sleep : boolean);
	{Prosedur aktivitas hari ini}
	
	procedure beliBahan(var energy : integer;var Mentah : tabelBahanMentah);
	{Prosedur Membeli Bahan Mentah}
	
	procedure tidur(var energy : integer;var sleep : boolean);
	{Prosedur untuk tidur}
	
	
=======
>>>>>>> b4445375edc2bf9cb66821cd90780567f74ed6a3:Daftar Program/uF1_load.pas
implementation

uses uP2_pesan;

	procedure mainLoad(nf_bahanMentah : string; nf_bahanOlahan:string; nf_resep : string; nf_simulasi : string;
		var T1 : tabelBahanMentah; var T2 : tabelBahanOlahan; var T3 : tabelResep; var T4 : tabelSimulasi; var loaded : boolean);
	{ I.S	: semua data belum terupload dari file eksternal	ket* : nf=nama file
	* F.S	: semua data telah terupload dari file eksternal}
	begin
		loadFileBahanMentah(nf_bahanMentah, T1);
		loadFileBahanOlahan(nf_bahanOlahan, T2);
		loadFileResep(nf_resep, T3);
		loadFileSimulasi(nf_simulasi, T4);
		loaded:=true;
		writeln('BERHASIL : File Selesai diupload.');
		writeln('---------------------------------');
		writeln();
	end;

	procedure ambilBaris(baris : string; var dataTemp : tabelString);
	{ I.S	: dataTemp kosong, baris masih full
	* F.S	: dataTemp sudah terisi oleh elemen dari suatu baris, baris kosong}
	{KAMUS LOKAL}
	var
		i		: integer;
	{ALGORITMA LOKAL}
	begin
		i:=1;
		while (pos(' | ',baris)>0) do 
		begin
			dataTemp.itemKe[i] := copy(baris,1,pos(' | ',baris)-1);
			delete(baris,1,pos(' | ',baris)+2);
			inc(i);		
		end;
		dataTemp.itemKe[i] := baris; //sisa
	end;
	
	procedure loadFileBahanMentah(namaFile : string; var T : tabelBahanMentah);
	{ I.S	: "T" kosong
	* F.S	: "T.itemKe[i]" terisi oleh tiap baris dari file "namaFile"}
	{KAMUS LOKAL}
	var
		fin 	: text;
		i		: integer;
		baris	: string;
		dataTemp: tabelString;
		error	: integer;
	{ALGORITMA LOKAL}
	begin
		assign(fin, namaFile); reset(fin);
		if (EOF(fin)) then
		begin
			writeln('WARNING : file "',namaFile,'" kosong.');
		end
		else
		begin
			i:= 1;
			while (not(EOF(fin))) do
			begin
				readln(fin,baris);
				ambilBaris(baris,dataTemp);
				T.itemKe[i].nama := dataTemp.itemKe[1];
				val(dataTemp.itemKe[2],T.itemKe[i].hargaBeli,error);
				val(dataTemp.itemKe[3],T.itemKe[i].durasiKadaluarsa,error);
				inc(i);
			end;
			T.banyakItem := i-1;
		end;
	end;
	
	procedure loadFileBahanOlahan(namaFile : string; var T : tabelBahanOlahan);
	{ I.S	: "T" kosong, baris masih full
	* F.S	: "T.itemKe[i]" terisi oleh tiap baris dari file "namaFile"}
	{KAMUS LOKAL}
	var
		fin 	: text;
		i,j		: integer;
		baris	: string;
		dataTemp: tabelString;
		error	: integer;
	{ALGORITMA LOKAL}
	begin
		assign(fin, namaFile); reset(fin);
		if (EOF(fin)) then
		begin
			writeln('WARNING : file "',namaFile,'" kosong.');
		end
		else
		begin
			i:= 1;
			while (not(EOF(fin))) do
			begin
				readln(fin,baris);
				ambilBaris(baris,dataTemp);
				T.itemKe[i].nama := dataTemp.itemKe[1];
				val(dataTemp.itemKe[2],T.itemKe[i].hargaJual,error);
				val(dataTemp.itemKe[3],T.itemKe[i].banyakBahanBaku,error);
				for j:=1 to T.itemKe[i].banyakBahanBaku do
				begin
					T.itemKe[i].bahanBaku[j] := dataTemp.itemKe[j+3];
				end;
				inc(i);
			end;
			T.banyakItem := i-1;
		end;
	end;
	
	procedure loadFileResep(namaFile : string; var T : tabelResep);
	{ I.S	: "T" kosong, baris masih full
	* F.S	: "T.itemKe[i]" terisi oleh tiap baris dari file "namaFile"}
	{KAMUS LOKAL}
	var
		fin 	: text;
		i,j		: integer;
		baris	: string;
		dataTemp: tabelString;
		error	: integer;
	{ALGORITMA LOKAL}
	begin
		assign(fin, namaFile); reset(fin); 
		if (EOF(fin)) then
		begin
			writeln('WARNING : file "',namaFile,'" kosong.');
		end
		else
		begin
			i:= 1;
			while (not(EOF(FIN))) do
			begin
				readln(fin,baris);
				ambilBaris(baris,dataTemp);
				T.itemKe[i].nama := dataTemp.itemKe[1];
				val(dataTemp.itemKe[2],T.itemKe[i].hargaJual,error);
				val(dataTemp.itemKe[3],T.itemKe[i].banyakBahan,error);
				for j:=1 to T.itemKe[i].banyakBahan do
				begin
					T.itemKe[i].bahan[j] := dataTemp.itemKe[j+3];
				end;
				inc(i);
			end;
			T.banyakItem := i-1;
		end;
	end;
	
	procedure loadFileSimulasi(namaFile : string; var T : tabelSimulasi);
	{ I.S	: "T" kosong, baris masih full
	* F.S	: "T.itemKe[i]" terisi oleh tiap baris dari file "namaFile"}
	{KAMUS LOKAL}
	var
		fin 	: text;
		i		: integer;
		baris	: string;
		dataTemp: tabelString;
		error	: integer;
	{ALGORITMA LOKAL}
	begin
		assign(fin, namaFile); reset(fin); 
		if (EOF(fin)) then
		begin
			writeln('WARNING : file "',namaFile,'" kosong.');
		end
		else
		begin
			i:= 1;
			while (not(EOF(fin))) do
			begin
				readln(fin,baris);
				ambilBaris(baris,dataTemp);
				val(dataTemp.itemKe[1],T.itemKe[i].nomor,error);
				ambilTanggal(dataTemp.itemKe[2],T.itemKe[i].tanggalSimulasi);
				val(dataTemp.itemKe[3],T.itemKe[i].jumlahHariHidup,error);
				val(dataTemp.itemKe[4],T.itemKe[i].jumlahEnergi,error);
				val(dataTemp.itemKe[5],T.itemKe[i].kapasitasMaxInventori,error);
				val(dataTemp.itemKe[6],T.itemKe[i].totalBahanMentahDibeli,error);
				val(dataTemp.itemKe[7],T.itemKe[i].totalBahanOlahanDibuat,error);
				val(dataTemp.itemKe[8],T.itemKe[i].totalBahanOlahanDijual,error);
				val(dataTemp.itemKe[9],T.itemKe[i].totalResepDijual,error);
				val(dataTemp.itemKe[10],T.itemKe[i].totalPemasukan,error);
				val(dataTemp.itemKe[11],T.itemKe[i].totalPengeluaran,error);
				val(dataTemp.itemKe[12],T.itemKe[i].totalPendapatan,error);
				inc(i);
			end;
			T.banyakItem := i-1;
		end;
	end;
<<<<<<< HEAD:Daftar Program/uload.pas
	
	procedure ambilTanggal(formatString : string; var x : tanggal);
	{ I.S	: tanggal masih dalam format dd//mm/yyyy
	* F.S	: tanggal sudah dalam bentuk record tanggal}
	var
		i	: integer;
		s	: string;
	begin
			i:=1;
		repeat
		str(x.hari,s);
		val((s+formatString[i]),x.hari);
		i:=i+1;
		until formatString[i]='/';
		i:=i+1;
		repeat
		str(x.bulan,s);
		val((s+formatString[i]),x.bulan);
		i:=i+1;
		until formatString[i]='/';
		i:=i+1;
		repeat
		str(x.tahun,s);
		val((s+formatString[i]),x.tahun);
		i:=i+1;
		until i>length(formatString);
	end;
	
	{######################################################}
	{**********KELOMPOK SUBPROGRAM UNTUK SIMULASI**********}
	{######################################################}
	
	{**********KELOMPOK SUBPROGRAM FITUR TIDUR*********}

	procedure checkEnergi(E : integer; var sleep : boolean);
	begin
		if (E<=0) then
			begin
				writeln('Energi habis! Chef akan tidur...');
				sleep:=true;
			end
		else
		writeln('Masukkan perintah: (tidur/beliBahan/stopSimulasi) ');
	end;

	procedure resetDay(var sleep : boolean;var tgl : tanggal;var energy : integer;var hariHidup : integer);
	begin
		sleep:=false;
		tgl.hari:=tgl.hari+1; {Bagian ini harus diperbaiki agar sesuai sistem kalendar}
		energy:=10;
		hariHidup:=hariHidup+1;
	end;
	
	procedure activity(var energy : integer;var Mentah : tabelBahanMentah;var Olahan : tabelBahanOlahan;var stop : boolean;var sleep : boolean);
	var
		p, s : string;
		i : integer;
	begin
		write('>> '); readln(p);
		case (p) of
			'stopSimulasi'		: stopSimulasi:=true;
			'beliBahan'			: beliBahan(energy,Mentah);
			(*'olahBahan'			: olahBahan();
			'jualOlahan'		: jualOlahan();
			'jualResep'			: jualResep();
			'makan'				: makan();
			'istirahat'			: istirahat();*)
			'tidur'				: tidur(energy,sleep);
			(*'lihatStatistik'	: lihatStatistik();
			'lihatInventori'	: lihatInventori();
			'lihatResep'		: lihatResep();
			'cariResep'			: cariResep();
			'tambahResep'		: tambahResep();
			'upgradeInventori'	: upgradeInventori();*)
		else
			shoutWarning('salahPerintah');
	end;
		
	{THISSSVVVVVVVVV}
		if p='beliBahan' then
		begin
			s:=copy(p,pos(' ',p)+1,length(p));
			i:=0;
			repeat
				i:=i+1;
			until (Mentah.itemKe[i].nama=s) or (i>=Mentah.banyakItem);
			if Mentah.itemKe[i].nama=s then
				begin
				Mentah.itemKe[i].jumlahTersedia:=Mentah.itemKe[i].jumlahTersedia+1;
				energy:=energy-1;
				end
			else
				writeln('Item Tidak Ditemukan!');
		end
		else if p='tidur' then
			if energy=10 then
			writeln('Anda tidak bisa tidur saat energi anda penuh!')
			else
			sleep:=true
		else if p='stopSimulasi' then
			stop:=true
		else
			writeln('Pilihan Salah!');
	end;
	
	
=======
>>>>>>> b4445375edc2bf9cb66821cd90780567f74ed6a3:Daftar Program/uF1_load.pas
end.
