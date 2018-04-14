unit uF4_stopSimulasi;

interface

uses uP1_TipeBentukan, uP3_umum;

	procedure mainStopSimulasi(var stopSimulasi:boolean);


implementation

	procedure mainStopSimulasi(var stopSimulasi:boolean);
	begin
		stopSimulasi := true;
	end;

end.
