task :daily => :environment do
  ApplicationController.generate_daily_emails
end
