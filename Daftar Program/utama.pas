program TubesDaspro;
{SPESIFIKASI : Mensimulasikan 10 hari pertama dari Engi's Kitchen}

uses uload;
//uses usimulasi dan uvalidation;

{KAMUS UTAMA}
const 
	NMax = 100;
var
	{variabel yang terpakai dalam algoritma utama}
	perintah		: string; //menerima masukan perintah dari user
	error			: integer; //penampung variabel jika terjadi error pada konversi string ke integer
	ID				: integer; //nomor simulasi
	loaded			: boolean;
	programSelesai	: boolean;
	stopSimulasi	: boolean;
	sleep			: boolean;
	
	{Array Penyimpan}
	dataBahanMentah	: tabelBahanMentah;
	dataBahanOlahan	: tabelBahanOlahan;
	dataResep		: tabelResep;
	dataSimulasi	: tabelSimulasi;
	
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
		{TAMPILAN PETUNJUK AWAL}
		writeln('Berikut pilihan perintah yang dapat anda masukkan pada prompt :');
		writeln('1. load');
		writeln('2. exit');
		writeln('3. start i (i=id yang diinginkan)');

		{MENYEDIAKAN PROMPT}
		write('> '); readln(perintah);
		
		{MENGEKSESUKSI PROMPT}
		if (perintah='load') then
		begin
			mainLoad('bahanMentah.in','bahanOlahan.in','resep.in','simulasi.in',dataBahanMentah,dataBahanOlahan,dataResep,dataSimulasi);
			loaded:=true;
		end
		else if (perintah='exit') then
		begin
			//exit(); //TO DO : Bikin procedure exit (checklist : x)
			writeln('sedang menjalankan fitur exit()'); //DEBUG
			writeln('Terima kasih telah menggunakan jasa kami!');
			writeln('Sampai berjumpa di lain waktu!');
			writeln('Tekan "enter" untuk mengakhiri program');
			programSelesai := true;
		end
		else if (pos('start',perintah)<>0) then //Kalo ketemu substring 'start' dalam string 'perintah'
		begin
			if (loaded) then
			begin
				stopSimulasi:=false;
				val(copy(perintah,pos(' ',perintah)+1,length(perintah)) , ID, error); 
				//Baris 43 : mengambil bagian angka dari string(perintah) dan memasukkannya ke variabel(ID)
				perintah := 'start';
				//mainSimulasi(ID); //TO DO : Bikin procedure startSimulasi (checklist : x)
				if ID=0 then
				ID:=1; //DEBUG
				writeln('sedang menjalankan fitur startSimulasi(',ID,')'); //DEBUG
				{Inisialisasi}
				sleep:=false;
				dataSimulasi.itemKe[ID].jumlahHariHidup:=1;
				{Simulasi Dimulai}
				
					repeat
						begin
						writeln('Selamat pagi!, hari ini tanggal: ',dataSimulasi.itemKe[ID].tanggalSimulasi.hari,'/',dataSimulasi.itemKe[ID].tanggalSimulasi.bulan,'/',dataSimulasi.itemKe[ID].tanggalSimulasi.tahun);
						repeat {Memulai aktivitas hari ini}
							begin
							writeln('Sisa energi: ',dataSimulasi.itemKe[ID].jumlahEnergi);
							checkEnergi(dataSimulasi.itemKe[ID].jumlahEnergi,sleep);
							if sleep=false then
								activity(dataSimulasi.itemKe[ID].jumlahEnergi,dataBahanMentah,dataBahanOlahan,stopSimulasi,sleep);
							end;
						until (stopSimulasi=true) or (sleep=true);
						resetDay(sleep,dataSimulasi.itemKe[ID].tanggalSimulasi,dataSimulasi.itemKe[ID].jumlahEnergi,dataSimulasi.itemKe[ID].jumlahHariHidup);
							if dataSimulasi.itemKe[ID].jumlahHariHidup>10 then
								stopSimulasi:=true;
						end;
					until stopSimulasi=true;
					
				{Simulasi Berakhir}	
					
			end
			else {perintah "load" belum dijalankan}
			begin
				writeln('WARNING : Anda belum meload file eksternal!');
				writeln('-------------------------------------------');
				writeln();
			end
		end
		else {masukkan user tidak memenuhi}
		begin
			writeln('WARNING : Perintah tidak sesuai, silahkan ulangi pilihan anda!');
			writeln('--------------------------------------------------------------');
			writeln();
		end;
		
	until (programSelesai);
	
	readln();
	
end.
