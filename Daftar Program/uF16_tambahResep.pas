unit uF16_tambahResep;

//INTERFACE
interface

uses uP1_tipeBentukan, uF1_load;

	procedure mainTambahResep(ID : integer;
									var dataBahanMentah : tabelBahanMentah; 
									var dataBahanOlahan : tabelBahanOlahan; 
									var dataResep : tabelResep; 
									var dataSimulasi : tabelSimulasi;
									var dataInventoriBahanMentah : tabelBahanMentah); 
	
	function isResepExist(nama:string; var dataResep : tabelResep):boolean;

//IMPLEMENTATION
implementation

//Prosedur Pembantu (1)
	function isResepExist(nama : string; var dataResep : tabelResep):boolean;
	{Kamus Lokal}
	var
		i     : integer;
		found : boolean;
	{Algoritma}
	begin
		i:=1;
		found:=false;
		while (found=false) and ( i<=dataResep.banyakItem) do
		begin
			if dataResep.itemKe[i].nama=nama then
			begin
				found:=true;
			end else
				i:=i+1;
		end;
		if (found=true) then
		begin
			isResepExist:=true;
		end else
			isResepExist:=false;
end;

//Prosedur Pembantu (2)	
		function hitungHargaModalResep(ID : integer;
									var dataBahanMentah : tabelBahanMentah; 
									var dataBahanOlahan : tabelBahanOlahan; 
									var dataResep : tabelResep;
									var dataInventoriBahanMentah : tabelBahanMentah):Integer;
		{Kamus Lokal}
		var
			i, j : integer;
		{Algoritma}
		begin
			hitungHargaModalResep:=0;
			for i:=1 to dataResep.banyakItem do
			begin
				for j:=1 to dataBahanMentah.banyakItem do
				begin
					if dataResep.itemKe[i].nama=dataBahanMentah.itemKe[j].nama then
					begin
						hitungHargaModalResep:=hitungHargaModalResep+dataBahanMentah.itemKe[j].hargaBeli;
					end;
				end;
				for j:=1 to dataBahanOlahan.banyakItem do
				begin
					if dataResep.itemKe[i].nama=dataBahanOlahan.itemKe[j].nama then
					begin
						hitungHargaModalResep:=hitungHargaModalResep+dataBahanOlahan.itemKe[j].hargaJual;
					end;
				end;
				
			end;
		end;
		
// PROSEDUR UTAMA //
	procedure mainTambahResep(ID : integer;
									var dataBahanMentah : tabelBahanMentah; 
									var dataBahanOlahan : tabelBahanOlahan; 
									var dataResep : tabelResep; 
									var dataSimulasi : tabelSimulasi; 
									var dataInventoriBahanMentah : tabelBahanMentah);
	{Kamus Lokal}
	var
		nama : string; {nama resep baru yg dimasukin}
		s : string; {String panjang bahan-bahan masakan}
		dataTemp : tabelString;
		found : boolean;
		i , j : integer; {pencacah}
		
	{Algoritma}	
begin
	repeat
		write('Nama resep :'); read(nama);
		if (isResepExist(nama,dataResep)=true) then
		begin	
			writeln('Nama resep telah ada, masukan nama yang lain!');
		end;
	until (isResepExist(nama,dataResep)=false);
	
	write('Bahan-bahan resep :');
	read(s);
	ambilBaris(s,dataTemp);
	
			
	if (dataTemp.banyakItem < 2 ) then
	begin	
		writeln('Item kurang dari 2');
	end else
	
	begin
		for i:=1 to dataTemp.banyakItem do		
		begin
			dataResep.itemKe[ID].bahan[i]:=dataTemp.itemKe[i];
		end;
		
		found:=true;
		
		while (found=false) do
		begin
			for i:=1 to dataResep.banyakItem do
				begin
					for j:=1 to dataInventoriBahanMentah.banyakItem do
					begin
						if dataResep.itemKe[ID].bahan[i]=dataInventoriBahanMentah.itemKe[j].nama then
							found:=true;
					end;
			end;
			
			
		end;		
				
			if found=false then
				writeln('Item tersebut tidak ada, masukan item yang lain!');	
			
			repeat 
				write('Harga jual resep :'); read(dataResep.itemKe[ID].hargaJual);
				
				if (dataResep.itemKe[ID].hargaJual < (0.125 * hitungHargaModalResep(ID,dataBahanMentah,dataBahanOlahan,dataResep,dataInventoriBahanMentah))) then
				begin
					writeln('Harga jual minimum harus 12,5% lebih tinggi dari harga modal!');
				end;
			until ((dataResep.itemKe[ID].hargaJual >= (0.125 * hitungHargaModalResep(ID,dataBahanMentah,dataBahanOlahan,dataResep,dataInventoriBahanMentah))));	
	end;
end;	

end.
