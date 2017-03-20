namespace :movie_utils do
  desc "This rake file will print the top 3 selling movies."
  task :top_sellers => :environment do

    all_orders = []

    LineItem.all.each do |f|
      all_orders << f.movie_id
    end

    3.times do
      best_seller = all_orders.max_by { |i| all_orders.count(i) }
      puts Movie.find_by(id: best_seller).title
      all_orders.delete(best_seller)
    end

  end
end
