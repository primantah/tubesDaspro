unit umum;
interface
uses utipebentukan;
	procedure ambilTanggal(formatString : string; var x : tanggal);
	{ I.S	: tanggal masih dalam format dd//mm/yyyy
	* F.S	: tanggal sudah dalam bentuk record tanggal}
implementation
	procedure ambilTanggal(formatString : string; var x : tanggal);
	{ I.S	: tanggal masih dalam format dd//mm/yyyy
	* F.S	: tanggal sudah dalam bentuk record tanggal}
	var
		error	: integer;
	begin
		val(copy(formatString,1,2),x.hari,error);
		val(copy(formatString,4,2),x.hari,error);
		val(copy(formatString,7,4),x.hari,error);
	end;
	
end.
