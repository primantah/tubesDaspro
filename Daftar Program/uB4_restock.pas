unit uB4_restock;

interface

uses uF5_beliBahan, uP1_tipeBentukan, uP3_Umum;

	procedure mainRestock(ID:integer; dataSimulasi: tabelSimulasi; 
							dataBahanMentah: tabelBahanMentah; var inventoriBahanMentah: tabelBahanMentah);
	{Melakukan restock setiap 3 hari dengan menjalankan procedure mainBeliBahan}
	
implementation

	procedure mainRestock(ID:integer; dataSimulasi: tabelSimulasi; 
							dataBahanMentah: tabelBahanMentah; var inventoriBahanMentah: tabelBahanMentah);
	{Kamus Lokal}
	var
	totalHarga : longint;
	i: longint;
	{Algoritma Lokal}
	begin
	totalHarga := 0;
		{menghitung total harga semua barang di supermarket}
		for i:=1 to dataBahanMentah.banyakItem do
		begin
			if((dataBahanMentah.itemKe[i].hargaBeli>0) and (dataBahanMentah.itemKe[i].hargaBeli<=500)) then
				totalHarga:=totalHarga+dataBahanMentah.itemKe[i].hargaBeli*20
			else if((dataBahanMentah.itemKe[i].hargaBeli>500) and (dataBahanMentah.itemKe[i].hargaBeli<=2000)) then
				totalHarga:=totalHarga+dataBahanMentah.itemKe[i].hargaBeli*10
			else if((dataBahanMentah.itemKe[i].hargaBeli>500) and (dataBahanMentah.itemKe[i].hargaBeli<=2000)) then
				totalHarga:=totalHarga+dataBahanMentah.itemKe[i].hargaBeli*5
			else{dataBahanMentah.itemKe[i].hargaBeli>5000}
				totalHarga:=totalHarga+dataBahanMentah.itemKe[i].hargaBeli*1;
		end;
	
	{mengecek apakah kapasitas maksimum inventori bisa menampung bahan yang akan direstock}
	if(inventoriBahanMentah.banyakItem+dataBahanMentah.banyakItem <= dataSimulasi.itemKe[ID].kapasitasMaxInventori) then
	begin
		{mengecek apakah uang saat ini cukup atau tidak}
		if(dataSimulasi.item[ID].JumlahDuit>=totalHarga) then
		begin
			for i:=1 to dataBahanMentah.banyakItem do
			begin
				if((dataBahanMentah.itemKe[i].hargaBeli>0) and (dataBahanMentah.itemKe[i].hargaBeli<=500)) then
					mainBeliBahan(dataBahanMentah.itemKe[i].nama, 20, ID, dataBahanMentah, dataSimulasi, inventoriBahanMentah)
				else if((dataBahanMentah.itemKe[i].hargaBeli>500) and (dataBahanMentah.itemKe[i].hargaBeli<=2000)) then
					mainBeliBahan(dataBahanMentah.itemKe[i].nama, 10, ID, dataBahanMentah, dataSimulasi, inventoriBahanMentah)
				else if((dataBahanMentah.itemKe[i].hargaBeli>500) and (dataBahanMentah.itemKe[i].hargaBeli<=2000)) then
					mainBeliBahan(dataBahanMentah.itemKe[i].nama, 5, ID, dataBahanMentah, dataSimulasi, inventoriBahanMentah)
				{dataBahanMentah.itemKe[i].hargaBeli>5000}
				else
					mainBeliBahan(dataBahanMentah.itemKe[i].nama, 1, ID, dataBahanMentah, dataSimulasi, inventoriBahanMentah);
			end;
		{uang sekarang tidak cukup}
		end else
			writeln('Uang tidak cukup, tidak bisa melakukan restock');
	{kapasitas inventori tidak cukup}
	end else
		writeln('Maaf kapasitas inventori tidak cukup untuk melakukan restock');
		
	end;

end.
