class ApplicationController < ActionController::Base
	 before_action :configure_permitted_parameters, if: :devise_controller?
	 protect_from_forgery prepend: true
	 require 'roo'

	 def check_bday(ic)
	 	curr_yr = Date.today.year.to_s[2..3].to_i
	 	yr_ic = ic[0..1].to_i 
	 	if yr_ic <= curr_yr
	 		yr_bday = "20#{ic[0..1]}"
	 	else
	 		yr_bday = "19#{ic[0..1]}"
	 	end
	 	bday_dt = Date.new(yr_bday.to_i, ic[2..3].to_i, ic[4..5].to_i)

	 	puts bday_dt
	 	return true
	 end

	 def set_all
	 	@admin = current_admin
	 end
	 
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
		#personalization.add_bcc(SendGrid::Email.new(email: "mmnr00@gmail.com"))
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

	 

	 

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
