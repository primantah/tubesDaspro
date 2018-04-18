unit uF13_lihatInventori; 

interface

uses uP1_tipeBentukan, uP3_Umum;

	procedure mainLihatInventori(var dataInventoriBahanMentah : tabelBahanMentah; var dataInventoriBahanOlahan : tabelBahanOLahan);
	procedure lihatDataInventoriBahanMentah(var dataInventoriBahanMentah : tabelBahanMentah);
	procedure lihatDataInventoriBahanOlahan(var dataInventoriBahanOlahan : tabelBahanOLahan);

	

implementation

	procedure mainLihatInventori(var dataInventoriBahanMentah : tabelBahanMentah; var dataInventoriBahanOlahan : tabelBahanOLahan);
	begin
		lihatDataInventoriBahanMentah(dataInventoriBahanMentah);
		lihatDataInventoriBahanOlahan(dataInventoriBahanOlahan);
	end;

	
	procedure lihatDataInventoriBahanMentah(var dataInventoriBahanMentah : tabelBahanMentah);
	var	i : integer;
	begin
		if (dataInventoriBahanMentah.banyakItem = 0) then
		begin
			writeln('Inventori Bahan Mentah Kosong');
		end
		else
		begin
			writeln('INVENTORI BAHAN MENTAH');			
			writeln('Nama | Tanggal Beli | Jumlah Tersedia');
			for i := 1 to dataInventoriBahanMentah.banyakItem do 
			begin
				write(dataInventoriBahanMentah.itemKe[i].nama, ' | ');
				tulisTanggal(dataInventoriBahanMentah.itemKe[i].tanggalBeli); write(' | ');
				write(dataInventoriBahanMentah.itemKe[i].jumlahTersedia);writeln();
			end; 
		end;
	end;
	
	procedure lihatDataInventoriBahanOlahan(var dataInventoriBahanOlahan : tabelBahanOLahan);
	var i : integer;
	begin
		if (dataInventoriBahanOlahan.banyakItem = 0) then
		begin
			writeln('Inventori Bahan Olahan Kosong');
		end
		else
		begin
			writeln('INVENTORI BAHAN OLAHAN');		
			writeln('Nama | Tanggal Buat | Jumlah Tersedia');
			for i := 1 to dataInventoriBahanOlahan.banyakItem do 
			begin
				write(dataInventoriBahanOlahan.itemKe[i].nama, ' | ');
				tulisTanggal(dataInventoriBahanOlahan.itemKe[i].tanggalBuat); write(' | ');
				write(dataInventoriBahanOlahan.itemKe[i].jumlahTersedia);writeln();
			end; 
		end;
	end;
	

end.
