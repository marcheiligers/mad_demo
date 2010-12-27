EMAIL = '**'
API_KEY = '**'
RECIPIENT = EMAIL

require 'mad_mimi_mail'
require 'mad_mimi_mailer'

MadMimiMail::Configuration.api_settings = {:email => EMAIL, :api_key => API_KEY}

class Notifier < MadMimiMailer
  default :from => "hello@me.com"

  def welcome
    @greeting = "Hi"
    mail(:to => RECIPIENT, :subject => 'welcome') do |format|
      format.text
    end
  end

  def self.doit
    Notifier.welcome.deliver!
  end
end
