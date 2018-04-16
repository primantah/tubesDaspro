unit uP3_umum;
interface
uses uP1_TipeBentukan;

	{------------------------------------------------------------}
	{**********DAFTAR SUBPROGRAM TENTANG TANGGAL*****************}
	{------------------------------------------------------------}
	
	procedure tulisTanggal(x : tanggal);
		
	procedure ambilTanggal(formatString : string; var x : tanggal);
	{ I.S	: tanggal masih dalam format dd//mm/yyyy
	* F.S	: tanggal sudah dalam bentuk record tanggal}
	
	procedure updateTanggal(var x : tanggal);
	{ I.S	: x adalah tanggal hari ini
	* F.S	: x adalah tanggal besok
	* asumsi: masukan selalu valid}
	
	function isKabisat(x : integer):boolean;
	{mengembalikan true jika x adalah tahun kabisat}
	
implementation

	{------------------------------------------------------------}
	{**********DAFTAR SUBPROGRAM TENTANG TANGGAL*****************}
	{------------------------------------------------------------}
	
	procedure tulisTanggal(x : tanggal);
	begin
		write(x.hari,'/',x.bulan,'/',x.tahun);
	end;
	
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
	
end.
