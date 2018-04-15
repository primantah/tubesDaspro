unit uF13_lihatInventori; //Ganti : sesuaikan dengan nama file, tapi tanpa ".pas"

interface

uses uP1_tipeBentukan, uP3_Umum;

	procedure mainLihatInventori(var dataInventoriBahanMentah : tabelBahanMentah; var dataInventoriBahanOlahan : tabelBahanOLahan);
	procedure lihatDataInventoriBahanMentah(var dataInventoriBahanMentah : tabelBahanMentah);
	procedure lihatDataInventoriBahanOlahan(var dataInventoriBahanOlahan : tabelBahanOLahan);

	

implementation

	procedure mainLihatInventori(var dataInventoriBahanMentah : tabelBahanMentah; var dataInventoriBahanOlahan : tabelBahanOLahan);
	begin
		writeln('INVENTORI BAHAN MENTAH');
		lihatDataInventoriBahanMentah(dataInventoriBahanMentah);
		writeln('INVENTORI BAHAN OLAHAN');
		lihatDataInventoriBahanOlahan(dataInventoriBahanOlahan);
	end;

	
	procedure lihatDataInventoriBahanMentah(var dataInventoriBahanMentah : tabelBahanMentah);
	var	i : integer;
	begin
		writeln('Nama | Harga Beli | Durasi Kadaluarsa | Tanggal Beli | Jumlah Tersedia');
		for i := 1 to dataInventoriBahanMentah.banyakItem do 
		begin
			write(dataInventoriBahanMentah.itemKe[i].nama, ' | ');
			write(dataInventoriBahanMentah.itemKe[i].hargaBeli, ' | ');
			write(dataInventoriBahanMentah.itemKe[i].durasiKadaluarsa, ' | ');
			tulisTanggal(dataInventoriBahanMentah.itemKe[i].tanggalBeli); write(' | ');
			write(dataInventoriBahanMentah.itemKe[i].jumlahTersedia);writeln();
		end; 
	end;
	
	procedure lihatDataInventoriBahanOlahan(var dataInventoriBahanOlahan : tabelBahanOLahan);
	var i : integer;
	begin
		writeln('Nama | Harga Jual | Tanggal Buat | Jumlah Tersedia');
		for i := 1 to dataInventoriBahanOlahan.banyakItem do 
		begin
			write(dataInventoriBahanOlahan.itemKe[i].nama, ' | ');
			write(dataInventoriBahanOlahan.itemKe[i].hargaJual, ' | ');
			tulisTanggal(dataInventoriBahanOlahan.itemKe[i].tanggalBuat); write(' | ');
			write(dataInventoriBahanOlahan.itemKe[i].jumlahTersedia);writeln();
		end; 
	end;
	

end.
