unit uF17_upgradeInventori;

interface

uses uP1_tipeBentukan, uP3_Umum;

	procedure mainUpgradeInventori(ID : integer; var dataSimulasi : tabelSimulasi); 

	
implementation

//PROSEDUR UTAMA
	procedure mainUpgradeInventori(ID : integer; var dataSimulasi : tabelSimulasi); 
	
	{algoritma}
	begin
		if (dataSimulasi.itemKe[ID].jumlahDuit<25) then
		begin
			writeln('Maaf, duit anda tidak cukup untuk upgrade inventori!');
		end else
		begin
			dataSimulasi.itemKe[ID].kapasitasMaxInventori:=dataSimulasi.itemKe[ID].kapasitasMaxInventori+25;
			dataSimulasi.itemKe[ID].jumlahDuit:=dataSimulasi.itemKe[ID].jumlahDuit-25;
		end;
	end;

end.


