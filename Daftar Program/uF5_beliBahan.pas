unit uF5_beliBahan;

interface

uses uP1_tipeBentukan, uP3_Umum;

	procedure mainBeliBahan(ID : integer; dataBahanMentah: tabelBahanMentah;var dataSimulasi: tabelSimulasi;//hapus parameter yang tidak perlu
									var inventoriBahanMentah : tabelBahanMentah );
	{ Menjalankan fungsi beliBahan }
	

implementation

	procedure mainBeliBahan(ID : integer; dataBahanMentah: tabelBahanMentah;var dataSimulasi: tabelSimulasi;//hapus parameter yang tidak perlu
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
		
			modal := dataSimulasi.itemKe[ID].jumlahDuit;
			
			if ((modal>=dataBahanMentah.itemKe[i].hargaBeli*kuantitas) and (ada)) then
			begin
				writeln('Total harga: ', dataBahanMentah.itemKe[i].hargaBeli*kuantitas);
				writeln('Pembelian Sukses');
				index:= inventoriBahanMentah.banyakItem+1; 
				{memasukan ke array inventoriBahanMentah}
				inventoriBahanMentah.itemKe[index].nama := bahanYangDibeli;
				{membuat tanggal beli}
				inventoriBahanMentah.itemKe[index].tanggalBeli.hari := dataSimulasi.itemKe[ID].tanggalSimulasi.hari;
				inventoriBahanMentah.itemKe[index].tanggalBeli.bulan := dataSimulasi.itemKe[ID].tanggalSimulasi.bulan;
				inventoriBahanMentah.itemKe[index].tanggalBeli.tahun := dataSimulasi.itemKe[ID].tanggalSimulasi.tahun;
				
				inventoriBahanMentah.itemKe[index].jumlahTersedia := kuantitas;
				dataSimulasi.itemKe[ID].jumlahDuit:=dataSimulasi.itemKe[ID].jumlahDuit-dataBahanMentah.itemKe[i].hargaBeli*kuantitas;
				inventoriBahanMentah.banyakItem:= inventoriBahanMentah.banyakItem+1;
			end else
			begin
				writeln('Total harga: ', dataBahanMentah.itemKe[i].hargaBeli*kuantitas);
				writeln('Pembelian Gagal');
			end;
		end;
		
		dataSimulasi.itemKe[ID].totalPengeluaran:= dataBahanMentah.itemKe[i].hargaBeli*kuantitas;
		dataSimulasi.itemKe[ID].jumlahEnergi := dataSimulasi.itemKe[ID].jumlahEnergi-1;
	end;
end.
