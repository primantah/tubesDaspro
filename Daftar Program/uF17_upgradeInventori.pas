unit uF17_upgradeInventori;

interface

uses uP1_tipeBentukan, uP3_Umum;

	procedure mainUpgradeInventori(ID : integer; var dataSimulasi : tabelSimulasi); 
	{I.S : kapasitas Inventori belum bertambah dan duit belum berkurang
	 F.S : kapasitas Inventori sudah bertambah sebanyak 25 dan duit akan berkurang sejumlah 25}
	
implementation

//PROSEDUR UTAMA
	procedure mainUpgradeInventori(ID : integer; var dataSimulasi : tabelSimulasi); 
	{I.S : kapasitas Inventori belum bertambah dan duit belum berkurang
	 F.S : kapasitas Inventori sudah bertambah sebanyak 25 dan duit akan berkurang sejumlah 25}
	
	{algoritma}
	begin
		if (dataSimulasi.itemKe[ID].jumlahDuit<25) then
		begin
			writeln('Maaf, duit anda tidak cukup untuk upgrade inventori!'); {proses validasi jumlah duit}
		end else
		begin
			dataSimulasi.itemKe[ID].kapasitasMaxInventori:=dataSimulasi.itemKe[ID].kapasitasMaxInventori+25;
			dataSimulasi.itemKe[ID].jumlahDuit:=dataSimulasi.itemKe[ID].jumlahDuit-25;
		end;
	end;

end.


