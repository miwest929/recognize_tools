namespace :recognize do
  desc "Find which Controller#Action will get executed by specified uri"
  task :route, [:method, :uri] => :environment do |t, args|
    method = args[:method]
    uri    = args[:uri]

    # recognize_path expects first char to be /
    # If not included in param then add for user
    uri = "/#{uri}" unless uri.starts_with? '/'
    begin
      route_info = Rails.application.routes.recognize_path(uri, method: method.downcase.to_sym)
      puts "Controller: #{route_info[:controller]}"
      puts "Action: #{route_info[:action]}"
    rescue StandardError => e
      puts e.message
    end
  end
end
