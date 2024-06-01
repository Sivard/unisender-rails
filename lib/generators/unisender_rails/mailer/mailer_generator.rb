module UnisenderRails
  module Generators
    class MailerGenerator < ::Rails::Generators::NamedBase
      desc "This generator creates mailer with unisender defaults"
      source_root File.expand_path("../templates", __FILE__)      
      
      argument :actions, type: :array, default: [], banner: "method method"
      check_class_collision suffix: "Mailer"

      def generate_mailer
        template 'mailer.rb', File.join(Rails.root, 'app/mailers', class_path, "#{file_name}.rb")
      end

      hook_for :template_engine, :test_framework
    end
  end
end