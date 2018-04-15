program TubesDaspro;
{SPESIFIKASI : Mensimulasikan 10 hari pertama dari Engi's Kitchen}

uses uP1_tipeBentukan, uP2_pesan, uP3_umum, 
	 uF1_load, uF2_exit, uF3_startSimulasi, 
	 uF14_lihatResep, uF15_cariResep, 
	 uF16_tambahResep, uF17_upgradeInventori, uF13_lihatInventori;

{KAMUS UTAMA}
var
	{Variabel umum yang terpakai dalam algoritma utama}
	perintah		: string; //menerima masukan perintah dari user
	error			: integer; //penampung variabel jika terjadi error pada konversi string ke integer
	ID				: integer; //nomor simulasi
	loaded			: boolean;
	programSelesai	: boolean;
	
	{Array penyimpan}
	dataBahanMentah	: tabelBahanMentah;
	dataBahanOlahan	: tabelBahanOlahan;
	dataResep		: tabelResep;
	dataSimulasi	: tabelSimulasi;
	dataInventoriBahanMentah : tabelBahanMentah;
	dataInventoriBahanOlahan : tabelBahanOlahan;

{ALGORITMA UTAMA}
begin
	tampilkanMenu('awal'); 	{TAMPILAN ANTARMUKA AWAL}
	loaded := false; programSelesai := false; ID:=0;	{INISIALISASI VARIABEL}
	
	repeat
		tampilkanMenu('utama'); {TAMPILAN MENU UTAMA}

		write('> '); readln(perintah); 	{MENYEDIAKAN PROMPT}
		
		{MENGEKSESUKSI PROMPT}
		case (perintah) of 
			'load' 				: mainLoad('bahanMentah.in','bahanOlahan.in','resep.in','simulasi.in',dataBahanMentah,dataBahanOlahan,dataResep,dataSimulasi, loaded);
			'exit' 				: mainExit(programSelesai, dataSimulasi, dataInventoriBahanMentah, dataInventoriBahanOlahan,'simulasi.out', 'inventoriBahanMentah.out', 'inventoriBahanOlahan.out');
			'lihatInventori'	: mainLihatInventori(dataInventoriBahanMentah, dataInventoriBahanOlahan);
			'lihatResep'		: mainLihatResep(ID, dataResep);
			'cariResep'			: mainCariResep(ID, dataResep);
			'tambahResep'		: mainTambahResep(ID, dataBahanMentah, dataBahanOlahan, dataResep, dataSimulasi, dataInventoriBahanMentah);
			'upgradeInventori'	: mainUpgradeInventori(ID, dataSimulasi);
		else if (pos('start',perintah)>0) then 
				if (loaded) then
				begin
					val(copy(perintah,pos(' ',perintah)+1,length(perintah)) , ID, error); 
					perintah := 'start';
					mainStartSimulasi(ID, dataBahanMentah, dataBahanOlahan, dataResep, dataSimulasi, dataInventoriBahanMentah, dataInventoriBahanOlahan);
				end
				else {perintah "load" belum dijalankan}
					shoutWarning('belumLoad');
		end;{asumsi : 1. perintah selalu benar; 2. nomor simulasi di file simulasi.in sudah terurut}
		
	until (programSelesai);
	readln();
end.

