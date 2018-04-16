unit uF10_istirahat;

interface 
uses uP1_TipeBentukan;


	procedure beristirahat (ID : integer; var dataSimulasi : tabelSimulasi);

	
implementation 

	procedure beristirahat (ID : integer; var dataSimulasi : tabelSimulasi);

	var
	istirahat : Boolean;
	jumlahIstirahat : integer;
	Hari : integer;

	begin
		jumlahIstirahat := 0;
		istirahat := false;
		Hari := dataSimulasi.itemKe[ID].jumlahHariHidup;
		repeat
			if istirahat = true then
			begin
				jumlahIstirahat := jumlahIstirahat + 1;
				if jumlahIstirahat <= 6 then
				begin
					if dataSimulasi.itemKe[ID].jumlahEnergi <= 10 then
					begin
						dataSimulasi.itemKe[ID].jumlahEnergi := dataSimulasi.itemKe[ID].jumlahEnergi + 1;
					end
					else
					begin
						dataSimulasi.itemKe[ID].jumlahEnergi := 10;
					end;
				end;
			end;
		until (Hari = 10);
	end;
end.
			
				
			
		
			
