namespace :movie_utils do
  desc "This rake file will print a list of all movies."
  task :movie_print => :environment do
    Movie.all.each do |movie|
      puts "#{movie.title} | #{movie.stock}"
    end
  end
end
