#FREE SCREENING
id=[7108,
7101,
7096,
7094,
7092,
7087]

@ekids = Ekid.where(id: id)
@ekids.each do |ek|
@client = Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_KEY"])
dt= "20 Oktober 2019"
@client.messages.create(
#to: "+60174151556",
to: "+60#{ek.mph}", 
from: ENV["TWILIO_PHONE_NO"], 
body: "\n\n MBI Selangor Incorporated 
\n Terima kasih kerana mendaftar untuk Program Saringan Percuma anjuran MBI Selangor (INC).
\n Tahniah! #{ek.name} telah disenaraipendek untuk proses pemilihan seterusnya. Untuk makluman, program seterusnya akan diadakan pada #{dt} di Denai Alam.
\n Klik link ini https://wa.me/60196072688?text=#{ek.name} dan klik send pada whatsapp untuk sahkan kehadiran.
\n Untuk pertanyaan lanjut sila hubungi urusetia Program, Pn Rusmina Sukim di 019-6072688
\n TEMPAT ADALAH AMAT TERHAD. Terima kasih atas kerjasama anda."
)
end

#Change Mentoring to Pending
Ekid.where(stat:"MENTOR").each do |ek|
ek.stat="PENDING"
ek.save
end

#Sort first 40
Ekid.where(stat: "NEW").order('created_at ASC').first(40).each do |ek|
ek.stat="MENTOR"
ek.save
end

#MENTORING
id=[7566, 6182, 6224, 6156, 6166, 6174, 6173, 6168, 6163, 6160]  

@ekids = Ekid.where(stat: "MENTOR")
@ekids.each do |ek|
@client = Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_KEY"])
@client.messages.create(
to: "+60#{ek.mph}", 
from: ENV["TWILIO_PHONE_NO"], 
body: "\n\n MBI Selangor Incorporated 
\n Terima kasih kerana mendaftar untuk Program Saringan Percuma anjuran MBI Selangor (INC).
\n Tahniah! #{ek.name} telah disenaraipendek untuk program mentoring dan coaching. Untuk makluman, program seterusnya akan diadakan seperti berikut:
\n 13 Oktober 2019 (Ahad)
\n 9.30am- 2.00pm
\n SACC MALL, Shah Alam.
\n Sila whatsapp maklumat dibawah kepada urusetia Program, Pn Zaiha di 013-668 9376
\n 1. Nama Anak
\n 2. Umur Anak dan No MyKid
\n 3. No yang boleh dihubungi
\n 4. Jenis Kelewatan Perkembangan Anak
\n TEMPAT ADALAH AMAT TERHAD. HUBUNGI KAMI SEGERA.Terima kasih atas kerjasama anda."
)
end
