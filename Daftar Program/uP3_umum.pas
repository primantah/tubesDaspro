unit uP3_umum;
interface
uses uP1_TipeBentukan;

	{------------------------------------------------------------}
	{**********DAFTAR SUBPROGRAM TENTANG TANGGAL*****************}
	{------------------------------------------------------------}
	
	procedure ambilTanggal(formatString : string; var x : tanggal);
	{ I.S	: tanggal masih dalam format dd//mm/yyyy
	* F.S	: tanggal sudah dalam bentuk record tanggal}
	
	procedure updateTanggal(var x : tanggal);
	{ I.S	: x adalah tanggal hari ini
	* F.S	: x adalah tanggal besok
	* asumsi: masukan selalu valid}
	
	function isKabisat(x : integer):boolean;
	{mengembalikan true jika x adalah tahun kabisat}
	
	{------------------------------------------------------------}
	{**********DAFTAR SUBPROGRAM LIHAT ISI ARRAY*****************}
	{------------------------------------------------------------}

	procedure lihatDataBahanMentah(dataBahanMentah : tabelBahanMentah); 
	{Menampilkan array dataBahanMentah dengan setiap baris 1 SET elemen-elemen dataBahanMentah}
	
	procedure lihatDataSimulasi(dataSimulasi : tabelSimulasi);
	{Menampilkan array dataSimulasi dengan setiap baris 1 SET elemen-elemen dataSimulasi}
	
	
implementation

	{------------------------------------------------------------}
	{**********DAFTAR SUBPROGRAM TENTANG TANGGAL*****************}
	{------------------------------------------------------------}
	
	procedure ambilTanggal(formatString : string; var x : tanggal);
	{ I.S	: tanggal masih dalam format dd//mm/yyyy
	* F.S	: tanggal sudah dalam bentuk record tanggal}
	var
		error	: integer;
		i,j		: integer;
	begin
		formatString := formatString + '#';
		i:=0;
		repeat inc(i); until (formatString[i]='/');					 
		val(copy(formatString,1,i-1),x.hari,error); inc(i); j:=i;
		repeat inc(j); until (formatString[j]='/'); inc(j); 
		val(copy(formatString,i,j-i-1),x.bulan,error); i:=j;
		repeat inc(i); until (formatString[i]='#');
		val(copy(formatString,j,i-j),x.tahun,error);
	end;
	
	procedure updateTanggal(var x : tanggal);
	{ I.S	: x adalah tanggal hari ini
	* F.S	: x adalah tanggal besok
	* asumsi: masukan selalu valid}
	begin
		if ((x.bulan=1) or (x.bulan=3) or (x.bulan=5) or (x.bulan=7) or (x.bulan=8) or (x.bulan=10) or (x.bulan=12) ) then
			if (x.hari=31) then
				if (x.bulan=12) then
				begin
					x.hari:=1; x.bulan:=1; inc(x.tahun);
				end
				else
				begin
					x.hari:=1; inc(x.bulan);
				end
			else
				inc(x.hari)
		else if ((x.bulan=4) or (x.bulan=6) or (x.bulan=9) or (x.bulan=11)) then
			if (x.hari=30) then
			begin
				x.hari:=1; inc(x.bulan);
			end
			else
				inc(x.hari)
		else {x.bulan=2}
			if (isKabisat(x.tahun)) then
				if (x.hari=29) then
				begin
					x.hari:=1; inc(x.bulan);
				end
				else
					inc(x.hari)
			else
				if (x.hari=28) then
				begin
					x.hari:=1; inc(x.bulan);
				end
				else
					inc(x.hari);									
	end;
	
	function isKabisat(x : integer):boolean;
	{mengembalikan true jika x adalah tahun kabisat}
	begin
		if (x mod 100 = 0) then
			if (x mod 400 = 0) then
				isKabisat:=true
			else
				isKabisat:=false
		else
			if (x mod 4 = 0) then
				isKabisat:=true
			else
				isKabisat:=false;
	end;
	
	{------------------------------------------------------------}
	{**********DAFTAR SUBPROGRAM LIHAT ISI ARRAY*****************}
	{------------------------------------------------------------}
	
	procedure lihatDataBahanMentah(dataBahanMentah : tabelBahanMentah); 
	{Menampilkan array dataBahanMentah dengan setiap baris 1 SET elemen-elemen dataBahanMentah}
	var	i : integer;
	begin
		for i:= 1 to dataBahanMentah.banyakItem do 
			writeln(dataBahanMentah.itemKe[i].nama,' | ', dataBahanMentah.itemKe[i].hargaSatuan,' | ', dataBahanMentah.itemKe[i].durasikadaluarsa);
	end;
	
	procedure lihatDataBahanOlahan(dataBahanOlahan : tabelBahanOlahan);
	{Menampilkan array dataBahanOlahan dengan setiap baris 1 SET elemen-elemen dataBahanOlahan}
	begin
	end;
	
	
	procedure lihatDataSimulasi(dataSimulasi : tabelSimulasi);
	{Menampilkan array dataSimulasi dengan setiap baris 1 SET elemen-elemen dataSimulasi}
		var	i,j : integer;
	begin
		for i:= 1 to dataSimulasi.banyakItem do 
		begin
			write(dataSimulasi.itemKe[i].nomor,' | ');
			write(dataSimulasi.itemKe[i].tanggalSimulasi.hari,'/',
				  dataSimulasi.itemKe[i].tanggalSimulasi.bulan,'/',
				  dataSimulasi.itemKe[i].tanggalSimulasi.tahun,' | ');
			write(dataSimulasi.itemKe[i].jumlahHariHidup,' | ');
			write(dataSimulasi.itemKe[i].jumlahEnergi,' | ');
			write(dataSimulasi.itemKe[i].kapasitasMaxInventori,' | ');
			write(dataSimulasi.itemKe[i].totalBahanMentahDibeli,' | ');
			write(dataSimulasi.itemKe[i].totalBahanOlahanDibuat,' | ');
			write(dataSimulasi.itemKe[i].totalBahanOlahanDijual,' | ');
			write(dataSimulasi.itemKe[i].totalResepDijual,' | ');
			write(dataSimulasi.itemKe[i].totalPemasukan,' | ');
			write(dataSimulasi.itemKe[i].totalPengeluaran,' | ');
			write(dataSimulasi.itemKe[i].totalPendapatan);
			writeln;
		end;
	end;
end.
