unit uF5_beliBahan;

interface

uses uP1_tipeBentukan, uP3_Umum;

	procedure mainBeliBahan(ID : integer; dataBahanMentah: tabelBahanMentah; dataSimulasi: tabelSimulasi;//hapus parameter yang tidak perlu
									var inventoriBahanMentah : tabelBahanMentah );
	{ Menjalankan fungsi beliBahan }
	

implementation

	procedure mainBeliBahan(ID : integer; dataBahanMentah: tabelBahanMentah; dataSimulasi: tabelSimulasi;//hapus parameter yang tidak perlu
									var inventoriBahanMentah : tabelBahanMentah
									);
	var
		bahanYangDibeli: String;
		kuantitas: integer;
		i,j,index: integer;
		ada: boolean;
		modal : longint;
	{ Menjalankan fungsi beliBahan }
	begin
		write('Nama bahan: ');
		readln(bahanYangDibeli);
		write('Kuantitas: ');
		readln(kuantitas);
		
		i:=1;
		ada:=false;
		while((i<=dataBahanMentah.banyakItem) and (ada=false)) do
		begin
			if(dataBahanMentah.itemKe[i].nama = bahanYangDibeli) then
				ada:=true
			else
				i:=i+1;
		end;
		
		if(ada = false) then
			writeln('Bahan yang ingin Anda beli tidak dijual disupermarket')
		else
		begin
		
			modal := 20000+dataSimulasi.itemKe[ID].totalPemasukan-dataSimulasi.itemKe[ID].totalPengeluaran;
			
			if(modal>=dataBahanMentah.itemKe[i].hargaBeli*kuantitas) then
			begin
				writeln('Total harga: ', dataBahanMentah.itemKe[i].hargaBeli*kuantitas);
				writeln('Pembelian Sukses');
				index:= inventoriBahanMentah.banyakItem+1;
				{memasukan ke array inventoriBahanMentah}
				inventoriBahanMentah.itemKe[index].nama := bahanYangDibeli;
				{membuat tanggal kadaluarsa}
				for j:= 1 to dataSimulasi.itemKe[ID].jumlahHariHidup do
				begin
					updateTanggal(inventoriBahanMentah.itemKe[index].tanggalBeli);
				end;
				inventoriBahanMentah.itemKe[index].jumlahTersedia := kuantitas;
			end else
			begin
				writeln('Total harga: ', dataBahanMentah.itemKe[i].hargaBeli*kuantitas);
				writeln('Pembelian Gagal');
			end;
		end;
		
		inventoriBahanMentah.banyakItem:= inventoriBahanMentah.banyakItem+1; 
		dataSimulasi.itemKe[ID].totalPengeluaran:= dataBahanMentah.itemKe[i].hargaBeli*kuantitas;
		dataSimulasi.itemKe[ID].jumlahEnergi := dataSimulasi.itemKe[ID].jumlahEnergi-1;
	end;
end.
