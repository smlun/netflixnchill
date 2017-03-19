namespace :time_utils do
  desc "This rake file will show the current time."
  task :show_time => :environment do
    puts "==========================="
    puts "Current time is #{Time.now}"
  end
end
