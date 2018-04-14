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
end.
