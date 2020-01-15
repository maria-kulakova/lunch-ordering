namespace :menus do
  desc 'Generate empty menu for today'

  task create: :environment do
    time_now = Time.now
    Menu.create(menu_date: time_now.to_date)
  end
end
