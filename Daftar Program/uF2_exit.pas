unit uF2_exit;

interface

uses uP1_tipeBentukan, uP2_pesan, uP3_umum;

	procedure mainExit(var programSelesai: boolean; var dataSimulasi : tabelSimulasi);

implementation

	procedure mainExit(var programSelesai: boolean; var dataSimulasi : tabelSimulasi);
	begin
		shoutWarning('exitProgram');
		programSelesai:=true;
	end;

end.
