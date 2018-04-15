unit uF3_startSimulasi;

interface

uses uP1_tipeBentukan, uP2_pesan, 
	 uF4_stopSimulasi, uF11_tidur, uF5_beliBahan, uF9_makan, 
	 uF6_OlahBahan, uF7_jualOlahan, uF16_tambahResep, uF17_upgradeInventori, uF14_lihatResep, uF15_cariResep;

	procedure mainStartSimulasi(ID : integer;
									var dataBahanMentah : tabelBahanMentah; 
									var dataBahanOlahan : tabelBahanOlahan; 
									var dataResep : tabelResep; 
									var dataSimulasi : tabelSimulasi;
									var dataInventoriBahanMentah: tabelBahanMentah; 
									var dataInventoriBahanOlahan: tabelBahanOlahan);	
	{memberikan prompt kepada user untuk memasukkan perintah dan melaksanakan perintah tersebut}
									
	function lelah(dataSimulasi : tabelSimulasi; ID : integer):boolean;
	{memberikan nilai true dan sebuah pesan kesalahan apabila dataSimulasi.itemKe[ID].jumlahEnergi <=0}
	
implementation

	procedure mainStartSimulasi(ID : integer;
									var dataBahanMentah : tabelBahanMentah; 
									var dataBahanOlahan : tabelBahanOlahan; 
									var dataResep : tabelResep; 
									var dataSimulasi : tabelSimulasi;
									var dataInventoriBahanMentah: tabelBahanMentah; 
									var dataInventoriBahanOlahan: tabelBahanOlahan);	
	{memberikan prompt kepada user untuk memasukkan perintah dan melaksanakan perintah tersebut}
	{KAMUS LOKAL}
	var 
		stopSimulasi: boolean;
		perintah	: string;
		jmlMakan	: integer;
		jmlIstirahat: integer;
	{ALGORITMA LOKAL}
	begin	
		dataSimulasi.itemKe[ID].jumlahEnergi	:= 10;
		dataSimulasi.itemKe[ID].jumlahHariHidup	:= 1;
		dataSimulasi.itemKe[ID].jumlahDuit		:= 20000;
		dataInventoriBahanOlahan.banyakItem		:= 0;
		
		repeat
			{inisialisasi} 
			stopSimulasi := false;
			dataSimulasi.itemKe[ID].isTidur 		:= false;
			jmlMakan := 0;
			jmlIstirahat := 0;
			
			{antarmuka}
			tampilkanMenu('startSimulasi');	
			writeln('Selamat pagi!, hari ini tanggal: ',dataSimulasi.itemKe[ID].tanggalSimulasi.hari,'/',dataSimulasi.itemKe[ID].tanggalSimulasi.bulan,'/',dataSimulasi.itemKe[ID].tanggalSimulasi.tahun);
			writeln('Sisa Energi: ', dataSimulasi.itemKe[ID].jumlahEnergi);
			writeln('Sisa Uang: ', dataSimulasi.itemKe[ID].jumlahDuit);
			write('>> '); readln(perintah);
			
			case (perintah) of 
				'stopSimulasi'		: mainStopSimulasi(stopSimulasi);(*
				'lihatStatistik'	: mainLihatStatistik(dataSimulasi, ID);
				'lihatInventori'	: mainLihatInventori(dataBahanMentah, dataBahanOlahan, ID);*)
				'lihatResep'		: mainLihatResep(ID, dataResep);
				'cariResep'			: mainCariResep(ID, dataResep);
				'tambahResep'		: mainTambahResep(ID, dataBahanMentah, dataBahanOlahan, dataResep, dataSimulasi, dataInventoriBahanMentah);
				'upgradeInventori' 	: mainUpgradeInventori(ID, dataSimulasi);
				'beliBahan'			: mainBeliBahan(ID, dataBahanMentah, dataSimulasi, dataInventoriBahanMentah);
				'olahBahan' 		: mainOlahBahan(ID,dataInventoriBahanMentah,dataBahanOlahan,dataSimulasi,dataInventoriBahanOlahan);
				'jualOlahan'		: mainJualOlahan(ID,dataInventoriBahanOlahan,dataSimulasi);
				(*'jualResep'			: if (lelah(dataSimulasi,ID)) then mainTidur(dataSimulasi,dataBahanMentah, dataBahanOlahan, ID, jmlMakan) else mainJualResep();*)
				'makan'				: mainMakan(jmlMakan, dataSimulasi.itemKe[ID].jumlahEnergi);
				(*'istirahat'		: if (lelah(dataSimulasi,ID)) then mainTidur(dataSimulasi,dataBahanMentah, dataBahanOlahan, ID, jmlMakan) else mainIstirahat();*)
				'tidur'				: mainTidur(dataSimulasi, dataInventoriBahanMentah, dataInventoriBahanOlahan, ID, jmlMakan, jmlIstirahat);
			end; {asumsi : perintah selalu valid}
			
		until (stopSimulasi) or (dataSimulasi.itemKe[ID].jumlahHariHidup>10);				
	end;
	
	function lelah(dataSimulasi : tabelSimulasi; ID : integer):boolean;
	{memberikan nilai true dan pesan kesalahan apabila dataSimulasi.itemKe[ID].jumlahEnergi <=0}
	begin
		if (dataSimulasi.itemKe[ID].jumlahEnergi <= 0) then
		begin
			writeln('Anda kelelahan, silahkan tidur');
			lelah:= true
		end
		else
			lelah:= false;
	end;
	
end.
