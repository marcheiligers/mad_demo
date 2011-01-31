EMAIL = ''
API_KEY = ''
RECIPIENT = EMAIL

require 'mad_mimi_mail'
require 'mad_mimi_mailer'

MadMimiMail::Configuration.api_settings = {:email => EMAIL, :api_key => API_KEY}

class Notifier < MadMimiMailer
  default :from => "hello@me.com"

  def welcome
    @greeting = "Hi"
    mail(:to => RECIPIENT, :subject => 'welcome', :promotion_name => 'mad_demo')
  end

  def self.doit
    n = Notifier.welcome.deliver!
    puts n.transaction_id
    puts n.errors
  end
end
