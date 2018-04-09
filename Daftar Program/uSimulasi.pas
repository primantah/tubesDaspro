unit usimulasi;
interface
uses utipebentukan;

	{######################################################}
	{***********KELOMPOK SUBPROGRAM FITUR TIDUR************}
	{######################################################}

	procedure checkEnergi(E : integer; var sleep : boolean);
	{Mengecek apakah energi sudah habis}
	
	procedure resetDay(var sleep : boolean;var tgl : tanggal;var energy : integer;var hariHidup : integer);
	{Prosedur Me-reset Hari}
	
	procedure activity(var energy : integer;var Mentah : tabelBahanMentah;var Olahan : tabelBahanOlahan;var stop : boolean;var sleep : boolean);
	{Prosedur aktivitas hari ini}
	
implementation

	{######################################################}
	{***********KELOMPOK SUBPROGRAM FITUR TIDUR************}
	{######################################################}
	
	procedure checkEnergi(E : integer; var sleep : boolean);
	begin
		if (E<=0) then
			begin
				writeln('Energi habis! Chef akan tidur...');
				sleep:=true;
			end
		else
		writeln('Masukkan perintah: (tidur/beliBahan/stopSimulasi) ');
	end;

	procedure resetDay(var sleep : boolean;var tgl : tanggal;var energy : integer;var hariHidup : integer);
	begin
		sleep:=false;
		tgl.hari:=tgl.hari+1; {Bagian ini harus diperbaiki agar sesuai sistem kalendar}
		energy:=10;
		hariHidup:=hariHidup+1;
	end;
	
	procedure activity(var energy : integer;var Mentah : tabelBahanMentah;var Olahan : tabelBahanOlahan;var stop : boolean;var sleep : boolean);
	var
		perintah : string;
		i : integer;
	begin
		write('>> ');readln(perintah);(*
		case (perintah) of 
			'stopSimulasi'		: stopSimulasi();
			'beliBahan'			: beliBahan();
			'olahBahan'			: olahBahan();
			'jualOlahan'		: jualOlahan();
			'jualResep'			: jualResep();
			'makan'				: makan();
			'istirahat'			: istirahat();
			'tidur'				: tidur();
			'lihatStatistik'	: lihatStatistik();
			'lihatInventori'	: lihatInventori();
			'lihatResep'		: lihatResep();
			'cariResep'			: cariResep();
			'tambahResep'		: tambahResep();
			'upgradeInventori'	: upgradeInventori();
		else begin
				shoutWarning('salahPerintah');
			 end;
		end;*)
	end;
end.
