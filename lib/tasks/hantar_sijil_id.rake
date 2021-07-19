desc "Hantar Sijil"
task hantar_sijil: :environment do

	def send_email(subject,to,cc,body)
	 	mail = SendGrid::Mail.new
		mail.from = SendGrid::Email.new(email: "anis@yawas.my", name: "Jabatan ANIS")
		mail.subject = "#{subject}"
		#Personalisation, add cc
		personalization = SendGrid::Personalization.new
		personalization.add_to(SendGrid::Email.new(email: "#{to}"))
		if cc.present?
			personalization.add_cc(SendGrid::Email.new(email: "#{cc}"))
		end
		# personalization.add_bcc(SendGrid::Email.new(email: "mmnr00@gmail.com"))
		mail.add_personalization(personalization)
		#add content
		msg = "<html>
		        <body>
		          #{body}
		        </body>
		      </html>"
		#sending email
		mail.add_content(SendGrid::Content.new(type: 'text/html', value: "#{msg}"))
		sg = SendGrid::API.new(api_key: ENV['SENDGRID_PASSWORD'])
		@response = sg.client.mail._('send').post(request_body: mail.to_json)
		puts @response.status_code
		# render json: @response and return
	 end

	
	Proge.where(acv: true).where("DATE(date) = ?", Date.today).each do |proge|
		subject = "Sijil Penyertaan untuk #{proge.name}"
		proge.perses.each do |prs|
			link = "https://www.anisselangor.com/progecert?perse=#{prs.id}&proge=#{proge.id}"
			body = "
			Terima kasih <b>#{prs.name}</b> kerana telah menyertai <b>#{proge.name}</b> pada 
			<b>#{proge.date.strftime('%d-%m-%Y')}</b><br><br>

			Sila <a href=#{link}> KLIK DISINI </a> untuk mendapatkan sijil penyertaan anda. <br><br>

			Yang Berusaha,<br>
			<b>Jabatan ANIS</b> 
			"
			send_email(subject,prs.email,"",body)
		end #perse
		body2 = "
			Penghantaran sijil penyertaan untuk <b>#{proge.name}</b> kepada <b>#{proge.perses.count} peserta</b> 
			telah BERJAYA pada <b>#{proge.date.strftime('%d-%m-%Y')}</b><br><br>


			Dihantar oleh,<br>
			<b>Sistem AnisSelangor</b> 
			"
			#"jabatananis@yawas.my"
		send_email("Penghantaran Sijil Untuk Program #{proge.name}",
			"jabatananis@yawas.my",
			"",
			body2)
		send_email("Penghantaran Sijil Untuk Program #{proge.name}",
			"mmnr00@gmail.com",
			"",
			body2)
		proge.acv = false
		proge.save
	end #proge
 puts "berjaya masuk"
end #task