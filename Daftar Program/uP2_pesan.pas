unit uP2_pesan;

interface
	
	procedure shoutWarning(kodePesan : string);
	{Menampilkan peringatan pesan kesalahan berdasarkan kodePesan}
	
	procedure tampilkanMenu(kodeMenu	: string);
	{Menampilkan tampilan menu berdasarkan kodeMenu}
	
implementation
	
	procedure shoutWarning(kodePesan : string);
	{Menampilkan peringatan pesan kesalahan berdasarkan kodePesan}
	begin
		case (kodePesan) of 
				'belumLoad'	: begin
								writeln('-------------------------------------------');
								writeln('WARNING : Anda belum meload file eksternal!');
								writeln('-------------------------------------------');
								writeln();
							  end;
			'salahPerintah'	: begin
								writeln('-----------------------------------------------------------------');
								writeln('WARNING : Perintah yang anda masukkan tidak tepat atau salah eja.');
								writeln('-----------------------------------------------------------------');
								writeln();
							  end;
			'exitProgram'	: begin
								writeln('Terima kasih telah menggunakan jasa kami!');
								writeln('Sampai berjumpa di lain waktu!');
								writeln('Tekan "enter" untuk mengakhiri program');
							  end;
		end;
	end;
	
	procedure tampilkanMenu(kodeMenu	: string);
	{Menampilkan tampilan menu berdasarkan kodeMenu}
	begin
		case (kodeMenu) of 
				'utama'		: begin
								writeln('Berikut pilihan perintah yang dapat anda masukkan pada prompt :');
								writeln('1. load');
								writeln('2. exit');
								writeln('3. start i (i=id simulasi yang diinginkan');
								writeln('4. lihatInventori');
								writeln('5. lihatResep');
								writeln('6. cariResep');
								writeln('7. tambahResep');
								writeln('8. upgradeInventori');
							  end;
			'startSimulasi'	: begin
								writeln('--------------------------------------');
								writeln('--------------SIMULASI----------------');
								writeln('--------------------------------------');
								writeln('Berikut pilihan perintah simulasi yang dapat anda masukkan');
								writeln('1. stopSimulasi');
								writeln('2. beliBahan');
								writeln('3. olahBahan');
								writeln('4. jualOlahan');
								writeln('5. jualResep');
								writeln('6. makan');
								writeln('7. istirahat');
								writeln('8. tidur');
								writeln('9. lihatStatistik');
								writeln('10. lihatInventori');
								writeln('11. lihatResep');
								writeln('12. cariResep');
								writeln('13. tambahResep');
								writeln('14. upgradeInventori');
								writeln('Masukkan perintah anda setelah tanda ">> "');
							  end;
			'awal'			: begin
									writeln('----------------------------------------');
									writeln('----PROGRAM SIMULASI ENGI''S KITCHEN----');
									writeln('----------------------------------------');
									writeln();
							  end;
		end;
	end;
end.
