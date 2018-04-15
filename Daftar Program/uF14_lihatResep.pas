unit uF14_lihatResep;

interface

uses uP1_tipeBentukan, uP3_Umum;

	procedure mainLihatResep(ID : integer; dataResep : tabelResep);  
	{ Menjalankan fungsi 14 }
	
	
	procedure urutkanTabelResep(var dataResep : tabelResep);
	{ I.S : dataResep tidak terurut berdasarkan nama
	* F.S : dataResep telah terurut berdasarkan nama mulai terbesar}

implementation

	procedure mainLihatResep(ID : integer; dataResep : tabelResep); 
	{ Menjalankan fungsi 14 }
	var
	i,j : integer;
	begin
		{mengurutkan dataResep}
		urutkanTabelResep(dataResep);
		
		{menampilkan resep}
		for i:= 1 to dataResep.banyakItem do
		begin
			write('Resep ',i, ' :');
			writeln(dataResep.itemKe[i].nama);
			writeln('harga jual : ', dataResep.itemKe[i].hargaJual);
			{menampikan bahan-bahan}
			write('Bahan : ');
				for j:=1 to dataResep.itemKe[i].banyakBahan-1 do
				begin
					write(dataResep.itemKe[i].bahan[j], ', ');
				end;
			writeln(dataResep.itemKe[i].bahan[dataResep.itemKe[i].banyakBahan]);
		end;
	end;
	
	procedure urutkanTabelResep(var dataResep : tabelResep);
	{ I.S : dataResep tidak terurut berdasarkan nama
	* F.S : dataResep telah terurut berdasarkan nama mulai terbesar}
	var
	i,j: integer;
	temp: resep;
	begin
		for i:= dataResep.banyakItem downto 2 do
		begin
			for j:= 2 to i do
			begin
				if(dataResep.itemKe[j].nama>dataResep.itemKe[j-1].nama) then
				begin
					temp:=dataResep.itemKe[j];
					dataResep.itemKe[j]:=dataResep.itemKe[j-1];
					dataResep.itemKe[j-1]:=temp;
				end;
			end;
		end;
	end;
	
end.
