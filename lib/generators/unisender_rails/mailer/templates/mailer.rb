<% module_namespacing do -%>
class <%= class_name %> < ActionMailer::Base
  default <%= key_value :from, '"from@example.com"' %>
  self.delivery_method = :unisender  
  self.unisender_settings = {:api_key => 'your api key',
                             :list_id => 'users group list id'}
<% actions.each do |action| -%>

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.<%= file_path.gsub("/",".") %>.<%= action %>.subject
  #
  def <%= action %>
    self.unisender_settings[:lang] = 'ru'
    @greeting = "Hi"

    mail <%= key_value :to, '"to@example.org"' %>
  end
<% end -%>
end
<% end -%>