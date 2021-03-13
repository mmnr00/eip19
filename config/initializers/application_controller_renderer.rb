# Be sure to restart your server when you modify this file.

# ActiveSupport::Reloader.to_prepare do
#   ApplicationController.renderer.defaults.merge!(
#     http_host: 'example.org',
#     https: false
#   )
# end

$ddkstat = {
	"1" => ["primary","Permohonan Diterima", "Sila Submit Dokumen yang Lengkap ke Pejabat YAWAS"],
	"2" => ["warning","Permohonan Dalam Proses", "Pihak Kami Sedang Menyemak Permohonan Anda"]
	"3" => ["success","Permohonan Diluluskan", "Tahniah. Permohonan Anda Telah Diluluskan. Bayaran Akan Dibuat Terus ke Akaun Agensi"]
	"4" => ["danger","Permohonan Ditolak", "Maaf. Permohonan Anda Tidak Diluluskan. Sila Semak Sebab Dibawah."]
}

$scses = {"sha" => 9, "srd" => 5}
$admloc = {1=>["srd","sha"],2=>"sha",3=>"srd"}

$statekid = {"NEW" => "PERMOHONAN DITERIMA",
						 "REJECT" => "PERMOHONAN GAGAL",
						 "PENDING" => "PERMOHONAN DALAM PROSES",
						 "CONFIRM" => "PERMOHONAN BERJAYA"}

$newborn = ["Bayi Longlai Atau Kejang",
						"Menangis Tanpa Henti",
						"Melengkungkan Belakangnya",
						"Tidak Bertindak Balas Kepada Bunyi",
						"Tidak menunjukkan minat atau menyambut rangsangan untuk bermain",
						"Tidak berselera untuk makan",
						"Tidak membunyikan suara",
						"Tidak respon kepada orang-orang yang rapat dengannya (ibubapa, adik-beradik)"]

$empat = ["Tidak membuat bunyi-bunyi atau membebel (Mumbling)",			
					"Tidak memberi tindakbalas kepada ibubapa atau penjaga",			
					"Tidak belajar berguling ketika main di atas lantai",			
					"Tidak memberi balasan kepada rangsangan",			
					"Tidak bermain dengan kaki atau mengalihkan barang antara tangan"]

$lapan = ["Tidak menyahut atau membalas rangsangan ibubapa atau penjaga",
					"Tidak membebel (mumbling) atau menghasilkan bunyi",
					"Tidak mula duduk, merangkak atau menarik diri untuk berdiri",
					"Tidak berminat untuk memegang barang mainan",
					"Masih tidak boleh makan makanan pejal atau biasa"]

$duabelas = ["Tidak menggunakan perkataan atau aksi untuk berkomunikasi seperti mengangkat kedua tangan bila hendak diangkat",
						"Tidak mahu bergerak kearah sekeliling",
						"Tidak respon kepada yang lain",
						"Tidak menarik perhatian orang yang rapat dengannya"]

$duaempat =["Tidak berminat untuk bermain",
						"Kerap jatuh atau melanggar sesuatu tanpa sebab",
						"Sukar menggunakan objek kecil",
						"Tidak memahami arahan",
						"Tidak menggunakan perkataan yang banyak",
						"Tidak menggabungkan perkataan dalam frasa yang bermakna",
						"Tidak berminat untuk bermain atau berinteraksi dengan yang lain",
						"Tidak berminat untuk makan"]

$tigaenam = ["Tidak difahami oleh yang lain",
						"Mempunyai masalah gagap yang menganggu kelancaran bertutur",
						"Tidak boleh berbual",
						"Tidak faham arahan",
						"Tidak bermain dengan anak-anak lain"]

$addfo = ["Nama Pakar Kanak - Kanak (Jika Ada)","No Telefon Pakar","Maklumat Adik Beradik"]

$health = ["Cacar Air",
					"Campak",
					"Scarlet Fever/Demam Scarlet",
					"Rheumatic Fever/Demam",
					"Pneumonia/Radang Paru-paru",
					"Influenza",
					"Asthma/Lelah",
					"Hay Fever/Demam Alergi",
					"Encephalitis",
					"Mumps/ Beguk",
					"Meningitis",
					"Whooping cough/ Batuk kokol",
					"High fevers/ Demam panas",
					"Ear aches/ Sakit telinga",
					"Lain-lain penyakit yang tiada diatas",
					"Pembedahan",
					"Kecederaan",
					"Pendengaran"]

$birth = ["Tempoh Bersalin (Jam)",
					"Berapa Bulan",
					"Cara Melahirkan:",
					"Keadaan Luar Biasa Pada atau Sebaik Sahaja Melahirkan"]

$grow = ["Dicapai dalam had normal",
"Kelewatan",
"Senarai Kelewatan Perkembangan yang tertentu",
"Nama Sekolah Terkini",
"Tahap Gred Terbaru",
"Subjek yang senang dikuasai:",
"Subjek yang lemah atau sukar dikuasai",
"Masalah yang dialami di sekolah",
"Penglibatan dalam Rekreasi dan Hobi"]

$physpch = ["Umur bagi perkataan pertama dan sila nyatakan",
						"Umur bagi kombinasi 2-3 perkataan pertama & sila nyatakan",
						"Kadar perkembangan pertuturan",
						"Umur bagi ayat pertama yang dituturkan & sila nyatakan",
						"Nyatakan perkembangan pertuturan pada masa sekarang:",
						"Adakah percakapan anak senang difahami oleh pendengar",
						"Bilakah Encik/Puan mula bimbang tentang kelewatan perkembangan percakapan",
						"Senaraikan bahasa yang digunakan di rumah",
						"Pernahkah membuat penilaian perkembangan anak sebelum ini",
						"Jika Ya, sila nyatakan maklumat dibawah:",
						"Mengangkat kepala sendiri 45 darjah",
						"Pusing badan kanan kiri sendiri",
						"Duduk sendiri tanpa bantuan",
						"Merangkak",
						"Berjalan",
						"Berlari"]

$agr = ["Saya:",
"membenarkan pasukan Early Intervention Program untuk menilai dan menjalankan intervensi atau terapi yang diperlukan dan disarankan untuk",
"Tarikh Pengesahan Kebenaran",
"Saya faham dengan kenyataan dibawah dan memberikan kebenaran untuk menggunakan maklumat diatas untuk mencapai tujuan program:",
"SAYA MENGESAHKAN MAKLUMAT YANG DIBERIKAN DI ATAS ADALAH BENAR"]
"Kami memahami bahawa penggunaan data atau maklumat peribadi adalah dianggap sebagai data peribadi sensiif yang tertakluk di bawah Akta Perlindungan Data Peribadi 2010 (Personal Data Protection Act 2010 - PDPA). SILA AMBIL PERHATIAN bahawa dengan memberikan semua maklumat yang terkandung di sini dan maklumat peribadi lain yang diperolehi daripada sebarang komunikasi dan / atau interaksi di antara pihak kami dan pihak anda (Subjek Data) dengan ini memberi persetujuan kepada MBI untuk mengumpul, memproses dan/atau menggunakan data peribadi untuk tujuan yang berkaitan dengan, atau selaras dengan (Early Intervention Program) di bawah inisiatif Smart Selangor (EIP) yang dikendalikan oleh MBI. MBI bersetuju untuk meyimpan data peribadi yang diterima daripada Subjek Data secara sulit dan mengikut peruntukan-peruntukan di bawah PDPA."







### OLD KIDCARE
$my_time = Time.now.in_time_zone('Singapore')

$trial = 30
$expire = 11

if Rails.env.development?
  $clt = "andkymil"
elsif Rails.env.production? 
  $clt = "x7w_y71n"
end

$package_price = 	{ "BASIC"=>80,
										"STANDARD"=>150,
										"PREMIUM"=>200,
										"PLATINUM"=>240,
										"PAY PER USE"=>2.8
									}
#taska discount = percentage(how much they have to pay i.e 40% == t.discount = 0.6)

$package_child = 	{ "BASIC"=>30,
										"STANDARD"=>60,
										"PREMIUM"=>80,
										"PLATINUM"=>100
									}

$month_name = { 1=>"JAN",
								2=>"FEB",
								3=>"MAR",
								4=>"APR",
								5=>"MAY",
								6=>"JUN",
								7=>"JUL",
								8=>"AUG",
								9=>"SEP",
								10=>"OCT",
								11=>"NOV",
								12=>"DEC",
							}
$bank_code =	{ "AFFIN BANK BERHAD"=>"PHBMMYKL",
								"AGROBANK / BANK PERTANIAN MALAYSIA BERHAD"=>"BPMBMYKL",
								"ALLIANCE BANK MALAYSIA BERHAD"=>"MFBBMYKL",
								"AL RAJHI BANKING INVESTMENT CORPORATION (MALAYSIA) BERHAD"=>"RJHIMYKL",
								"AMBANK (M) BERHAD"=>"ARBKMYKL",
								"BANK ISLAM MALAYSIA BERHAD"=>"BIMBMYKL",
								"BANK KERJASAMA RAKYAT MALAYSIA BERHAD"=>"BKRMMYKL",
								"BANK MUAMALAT (MALAYSIA) BERHAD"=>"BMMBMYKL",
								"BANK SIMPANAN NASIONAL BERHAD"=>"BSNAMYK1",
								"CIMB BANK BERHAD"=>"CIBBMYKL",
								"CITIBANK BERHAD"=>"CITIMYKL",
								"HONG LEONG BANK BERHAD"=>"HLBBMYKL",
								"HSBC BANK MALAYSIA BERHAD"=>"HBMBMYKL",
								"MAYBANK / MALAYAN BANKING BERHAD"=>"MBBEMYKL",
								"OCBC BANK (MALAYSIA) BERHAD"=>"OCBCMYKL",
								"PUBLIC BANK BERHAD"=>"PBBEMYKL",
								"RHB BANK BERHAD"=>"RHBBMYKL",
								"STANDARD CHARTERED BANK (MALAYSIA) BERHAD"=>"SCBLMYKX",
								"UNITED OVERSEAS BANK (MALAYSIA) BERHAD"=>"UOVBMYKL", 
							}
$ph_sel19 = {
							1	=>{	1	=>"	New Year's Day	",
									21	=>"	Thaipusam	"},
							2	=>{	5	=>"	Chinese New Year	",
									6	=>"	Chinese New Year Holiday	"},
							5	=>{	1	=>"	Labour Day	",
									20	=>"	Wesak Day Holiday	",
									22	=>"	Nuzul Al-Quran	"},
							6	=>{	5	=>"	Hari Raya Aidilfitri	",
									6	=>"	Hari Raya Aidilfitri Holiday	"},
							8	=>{	12	=>"	Hari Raya Haji Holiday	"},
							9	=>{	2	=>"	Awal Muharram Holiday	",
									9	=>"	Agong's Birthday	",
									16	=>"	Malaysia Day	"},
							10	=>{	28	=>"	Deepavali Holiday	"},
							12	=>{	11	=>"	Sultan of Selangor's Birthday	",
									25	=>"	Christmas Day	"},
						}

# # ## BILLPLZ LOCAL
# # $billplz_url = "https://billplz-staging.herokuapp.com/api/v3/"
# # $billplz = "https://billplz-staging.herokuapp.com/"
# # $api_key = "6d78d9dd-81ac-4932-981b-75e9004a4f11"
# # $root_url = "http://localhost:3000/"

# # ## BILLPLZ STAGING 
# # $billplz_url = "https://billplz-staging.herokuapp.com/api/v3/"
# # $billplz = "https://billplz-staging.herokuapp.com/"
# # $api_key = "6d78d9dd-81ac-4932-981b-75e9004a4f11"
# # $root_url = "http://kidcare-staging.herokuapp.com/"

# # # ##BILLPLZ PRODUCTION-TRY
# # $billplz_url = "https://billplz-staging.herokuapp.com/api/v3/"
# # $billplz = "https://billplz-staging.herokuapp.com/"
# # $api_key = "6d78d9dd-81ac-4932-981b-75e9004a4f11"
# # $root_url = "http://kidcare-prod.herokuapp.com/"

# # ##BILLPLZ PRODUCTION-REAL
# $billplz_url = "https://www.billplz.com/api/v3/"
# $billplz = "https://www.billplz.com/"
# $api_key = "667aac2a-cdb2-4b44-8ca6-2d26f63d63f3"
# $root_url = "http://kidcare-prod.herokuapp.com/"






