program TubesDaspro;
{SPESIFIKASI : Mensimulasikan 10 hari pertama dari Engi's Kitchen}

uses uload,upesan;

{KAMUS UTAMA}
var
	{Variabel yang terpakai dalam algoritma utama}
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

{Daftar prosedur}
procedure startSimulasi(idx	: integer);
var
	stopSimulasi : boolean;
begin
	stopSimulasi := false;
	tampilkanMenu('startSimulasi');
	repeat
		write('>> '); readln(perintah);
		(*
		case (perintah) of
			'stopSimulasi'		: stopSimulasi:=true;
			'beliBahan'			: beliBahan();
			'olahBahan'			: olahBahan();
			'jualOlahan'		: jualOlahan();
			'jualResep'			: jualResep();
			'makan'				: makan();
			'istirahat'			: istirahat();
			'tidur'				: tidur();
			'lihatStatistik'	: lihatStatistik();
			'lihatInventori'	: lihatInventori();
			'lihatResep'		: lihatResep();
			'cariResep'			: cariResep();
			'tambahResep'		: tambahResep();
			'upgradeInventori'	: upgradeInventori();
		else
			shoutWarning('salahPerintah');
		end;*)
	until (stopSimulasi);
end;

{Daftar fungsi}	
function cariIndeksNomorSimulasi(ID : integer):integer;
var
	i : integer;
begin
	for i := 1 to dataSimulasi.banyakItem do
	begin
		if (dataSimulasi.itemKe[i].nomor = ID) then
		begin
			cariIndeksNomorSimulasi := i;
			break;
		end;
	end;
end;

{ALGORITMA UTAMA}
begin
	{TAMPILAN ANTARMUKA AWAL}
	writeln('----------------------------------------');
	writeln('----PROGRAM SIMULASI ENGI''S KITCHEN----');
	writeln('----------------------------------------');
	writeln();
	
	{INISIALISASI VARIABEL}
	perintah := '';
	loaded := false;
	programSelesai := false;
	
	repeat
		{TAMPILAN MENU UTAMA}
		tampilkanMenu('utama');

		{MENYEDIAKAN PROMPT}
		write('> '); readln(perintah);
		
		{MENGEKSESUKSI PROMPT}
		case (perintah) of 
			'load' 				: mainLoad('bahanMentah.in','bahanOlahan.in','resep.in','simulasi.in',dataBahanMentah,dataBahanOlahan,dataResep,dataSimulasi);
			'exit' 				: begin
									shoutWarning('exitProgram');
									programSelesai := true;
								 end;(*
			'lihatInventori'	: lihatInventori();
			'lihatResep'		: lihatResep();
			'cariResep'			: cariResep();
			'tambahResep'		: tambahResep();
			'upgradeInventori'	: upgradeInventori();*)
		else begin
				if (pos('start',perintah)<>0) then //Kalo ketemu substring 'start' dalam string 'perintah'
				begin
					if (loaded) then
					begin
						val(copy(perintah,pos(' ',perintah)+1,length(perintah)) , ID, error); //Baris 43 : mengambil bagian angka dari string(perintah) dan memasukkannya ke variabel(ID)
						perintah := 'start';
						//startSimulasi(cariIndeksNomorSimulasi(ID)); //TO DO : Bikin procedure startSimulasi (checklist : x)
					end
					else {perintah "load" belum dijalankan}
					begin
						shoutWarning('belumLoad');
					end
				end
				else {masukkan user tidak memenuhi}
				begin
					shoutWarning('salahPerintah');
				end;
			 end;
		end;
		
	until (programSelesai);
	
	readln();
	
end.
