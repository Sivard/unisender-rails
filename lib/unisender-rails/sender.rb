require 'unisender-rails/client'

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
      mail_to = [*(mail.to)]
      client = Client.new(@settings[:api_key])
      list_id = @settings[:list_id]
      result = client.subscribe fields: { email: mail_to.join(',') },
                                list_ids: list_id,
                                double_optin: 3
      log_event(result)

      result = client.sendEmail subject: mail.subject,
                                body: mail.body,
                                sender_email: mail.from,
                                email: mail_to,
                                sender_name: @settings[:sender_name] || mail.from.split('@').first,
                                list_id: list_id,
                                lang: @settings[:lang] || 'ru'
      log_event(result)
  	end

    private

    def log_event(message)
      Rails.logger.info "Unisender mailer result: #{message}" if @settings[:debug] == true
    end

  end
end
