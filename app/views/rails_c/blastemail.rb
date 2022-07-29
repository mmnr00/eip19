real_email = []

Perse.all.each do |prs|
real_email << prs.email unless real_email.include? prs.email
end

Ddk.all.each do |prs|
real_email << prs.email unless real_email.include? prs.email
end

Ekid.all.each do |prs|
real_email << prs.femail unless real_email.include? prs.femail
real_email << prs.memail unless real_email.include? prs.memail
end




################# END GET ALL email

test_email=["mmnr00@gmail.com",
"mustrivium@yahoo.com"]


final_email = test_email


mail = SendGrid::Mail.new
mail.from = SendGrid::Email.new(email: "admin@anis.my", name: "Jabatan ANIS")
mail.subject = "Pengumuman Didik ANIS"
#Personalisation, add cc
personalization = SendGrid::Personalization.new
personalization.add_to(SendGrid::Email.new(email: "donotreply@anis.my"))
#Attachment
attachment = SendGrid::Attachment.new
attachment.content = Base64.strict_encode64(File.open('/Users/MustakhimRehan/Downloads/karninal-anis.jpeg', 'rb').read)
attachment.type = 'image/jpeg'
attachment.filename = "Poster"
attachment.disposition = 'attachment'
attachment.content_id = 'Reports Sheet'
mail.add_attachment(attachment)

final_email.each do |k|
personalization.add_bcc(SendGrid::Email.new(email: k))
puts k
end

# part 2, kena run lain2
mail.add_personalization(personalization)
#add content
msg = 
"<html>
<body>
Salam dan Selamat Sejahtera,<br><br>
Tuan/Puan,<br><br>
<b><u>BANTUAN DIDIK ANIS 2022</b></u><br><br>
Merujuk perkara di atas, kami ingin memaklumkan bahawa Jabatan Anak Istimewa Selangor(ANIS) akan mengadakan penyaluran Bantuan Didik ANIS bagi tahun 2022. Program Bantuan Didik ANIS merupakan inisiatif Kerajaan Negeri Selangor untuk membantu pusat Pendidikan swasta mahupun kerajaan dan pusat terapi yang menjalankan Program Intervensi Awal(EIP) di negeri Selangor bagi menaiktaraf keperluan di Pusat EIP.<br><br>
Tujuan e-mel dihantar adalah untuk meminta kerjasama pihak Tuan/Puan menyediakan dokumen untuk pihak kami memeriksa bagi proses selanjutnya. Dokumen yang diperlukan adalah seperti berikut:<br>
<ol>
<li>Borang Profil lengkap Institusi Pendidikan Anak Istimewa (borang yang diisi di website)</li>
<li>Salinan sijil pendaftaran pertubuhan/sijil pendaftaran dengan undang-undang tubuh yang disahkan oleh Pendaftar Pertubuhan/ Suruhanjaya Syarikat Malaysia (SSM).</li>
<li>Senarai nama dan Sijil petugas Institusi.</li>
<li>Senarai nama pelatih/kanak-kanak beserta umur, nombor kad pengenalan dan jenis kecacatan/kurang upaya/permasalahan.</li>
</ol>
Tuan/Puan diminta untuk menghantar dokumen ini sebelum atau pada <b>22 JULAI 2022</b> (Jumaat). Oleh itu, kerjasama Tuan/Puan amat dihargai dan didahului dengan ucapan terima kasih.<br><br>
Sekian.<br><br>

**Sila abaikan e-mel ini sekiranya anda sudah menghantar dokumen kepada pihak kami.

</body>
</html>"
#sending email
mail.add_content(SendGrid::Content.new(type: 'text/html', value: "#{msg}"))
sg = SendGrid::API.new(api_key: ENV['SENDGRID_PASSWORD'])
@response = sg.client.mail._('send').post(request_body: mail.to_json)
puts @response.status_code
# render json: @response and return
