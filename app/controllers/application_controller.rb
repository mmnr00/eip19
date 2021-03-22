class ApplicationController < ActionController::Base
	 before_action :configure_permitted_parameters, if: :devise_controller?
	 protect_from_forgery prepend: true
	 require 'roo'
	 
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
		personalization.add_bcc(SendGrid::Email.new(email: "mmnr00@gmail.com"))
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
		puts @response
	 end

	 

	 

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
