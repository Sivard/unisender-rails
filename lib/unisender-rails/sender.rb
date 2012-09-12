require 'uni_sender'

module UnisenderRails
  class Sender
  	

  	def initialize(args)
  	  @settings = {:api_key => nil}
      args.each do |arg_name, arg_value|
  	    @settings[arg_name.to_sym] = arg_value
      end
  	end

  	def settings
  	  @settings
  	end

  	def deliver!(mail)
  	  puts @settings[:api_key]
      client = UniSender::Client.new(@settings[:api_key])
      first_list_id = client.get_lists['result'].first['id']
      puts client.sendEmail :subject => mail.subject,
                       :body => mail.body,
                       :sender_email => mail.from,
                       :email => mail.to,
                       :sender_name => mail.to.split('@').first,
                       :list_id => first_list_id
  	end

  end
end