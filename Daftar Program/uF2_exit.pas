unit uF2_exit;

interface

uses uP1_tipeBentukan, uP2_pesan, uP3_umum;

	procedure mainExit(var programSelesai: boolean;
						dataSimulasi : tabelSimulasi;
						dataInventoriBahanMentah : tabelBahanMentah;
						dataInventoriBahanOlahan : tabelBahanOlahan;
						nf_simulasi : string;
						nf_inventoriBahanMentah : string;
						nf_inventoriBahanOlahan : string);
	{ Program utama dari fitur exit }
	
	procedure writeFile(dataSimulasi : tabelSimulasi;
						dataInventoriBahanMentah : tabelBahanMentah;
						dataInventoriBahanOlahan : tabelBahanOlahan;
						nf_simulasi : string;
						nf_inventoriBahanMentah : string;
						nf_inventoriBahanOlahan : string);
	{ Memindahkan data dari array ke file eksternal }
	
	procedure writeSimulasi(dataSimulasi : tabelSimulasi; nf_simulasi : string);
	{ Memindahkan dataSimulasi dari array ke file eksternal }
	
	procedure writeInventoriBahanMentah(dataInventoriBahanMentah : tabelBahanMentah; nf_inventoriBahanMentah : string);
	{ Memindahkan inventoriBahanMentah dari array ke file eksternal }
		
	procedure writeInventoriBahanOlahan(dataInventoriBahanOlahan : tabelBahanOlahan; nf_inventoriBahanOlahan : string);
	{ Memindahkan inventoriBahanOlahan dari array ke file eksternal }
	
	
implementation

	procedure mainExit(var programSelesai: boolean; 
						dataSimulasi : tabelSimulasi;
						dataInventoriBahanMentah : tabelBahanMentah;
						dataInventoriBahanOlahan : tabelBahanOlahan;
						nf_simulasi : string;
						nf_inventoriBahanMentah : string;
						nf_inventoriBahanOlahan : string);
	{ Program utama dari fitur exit }
	{ ALGORITMA}
	begin
		writeFile(dataSimulasi, dataInventoriBahanMentah, dataInventoriBahanOlahan,nf_simulasi,nf_inventoriBahanMentah,nf_inventoriBahanOlahan);
		shoutWarning('exitProgram');
		programSelesai:=true;
	end;
	
	procedure writeFile(dataSimulasi : tabelSimulasi;
						dataInventoriBahanMentah : tabelBahanMentah;
						dataInventoriBahanOlahan : tabelBahanOlahan;
						nf_simulasi : string;
						nf_inventoriBahanMentah : string;
						nf_inventoriBahanOlahan : string);
	{ Memindahkan data dari array ke file eksternal }
	{ ALGORITMA }
	begin
		writeSimulasi(dataSimulasi, nf_simulasi);
		writeInventoriBahanMentah(dataInventoriBahanMentah, nf_inventoriBahanMentah);
		writeInventoriBahanOlahan(dataInventoriBahanOlahan, nf_inventoriBahanOlahan);
	end;
	
	procedure writeSimulasi(dataSimulasi : tabelSimulasi; nf_simulasi : string);
	{ Memindahkan dataSimulasi dari array ke file eksternal }
	{ KAMUS LOKAL }
	var
		i	: integer;
		fout: text;
	{ ALGORITMA LOKAL }
	begin
		assign(fout, nf_simulasi); rewrite(fout);
		for i := 1 to dataSimulasi.banyakItem do 
		begin
			write(fout, dataSimulasi.itemKe[i].nomor); write(fout, ' | ');
			write(fout, dataSimulasi.itemKe[i].jumlahHariHidup); write(fout, ' | ');
			write(fout, dataSimulasi.itemKe[i].jumlahEnergi); write(fout, ' | ');
			write(fout, dataSimulasi.itemKe[i].kapasitasMaxInventori); write(fout, ' | ');
			write(fout, dataSimulasi.itemKe[i].totalBahanMentahDibeli); write(fout, ' | ');
			write(fout, dataSimulasi.itemKe[i].totalBahanOlahanDibuat); write(fout, ' | ');
			write(fout, dataSimulasi.itemKe[i].totalBahanOlahanDijual); write(fout, ' | ');
			write(fout, dataSimulasi.itemKe[i].totalResepDijual); write(fout, ' | ');
			write(fout, dataSimulasi.itemKe[i].totalPemasukan); write(fout, ' | ');
			write(fout, dataSimulasi.itemKe[i].totalPengeluaran); write(fout, ' | ');
			write(fout, dataSimulasi.itemKe[i].totalPendapatan); write(fout, ' | ');
			write(fout, dataSimulasi.itemKe[i].jumlahDuit); writeln(fout,'');
		end;
		close(fout);
	end;
	
	procedure writeInventoriBahanMentah(dataInventoriBahanMentah : tabelBahanMentah; nf_inventoriBahanMentah : string);
	{ Memindahkan inventoriBahanMentah dari array ke file eksternal }
	var
		i	: integer;
		fout: text;
	{ ALGORITMA LOKAL }
	begin
		assign(fout, nf_inventoriBahanMentah); rewrite(fout);
		for i := 1 to dataInventoriBahanMentah.banyakItem do 
		begin
			write(fout, dataInventoriBahanMentah.itemKe[i].nama); write(fout, ' | ');
			//write(fout, tulisTanggalKeFile(dataInventoriBahanMentah.itemKe[i].tanggalBeli); write(fout, ' | ');
			write(fout, dataInventoriBahanMentah.itemKe[i].jumlahTersedia); writeln(fout,'');
		end;
		close(fout);
	end;
		
	procedure writeInventoriBahanOlahan(dataInventoriBahanOlahan : tabelBahanOlahan; nf_inventoriBahanOlahan : string);
	{ Memindahkan inventoriBahanOlahan dari array ke file eksternal }
	var
		i	: integer;
		fout: text;
	{ ALGORITMA LOKAL }
	begin
		assign(fout, nf_inventoriBahanOlahan); rewrite(fout);
		for i := 1 to dataInventoriBahanOlahan.banyakItem do 
		begin
			write(fout, dataInventoriBahanOlahan.itemKe[i].nama); write(fout, ' | ');
			//write(fout, tulisTanggal(dataInventoriBahanOlahan.itemKe[i].tanggalJual)); write(fout, ' | ');
			write(fout, dataInventoriBahanOlahan.itemKe[i].jumlahTersedia); writeln(fout,'');
		end;
		close(fout);
	end;	
	
end.
