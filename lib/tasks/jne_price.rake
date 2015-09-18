namespace :jne do
  desc 'Update JNE Price from xls'
  task :update_from_xls => :environment do
    require 'spreadsheet'
    book = Spreadsheet.open Rails.root.join('lib', 'assets', 'price_jne_juni_2015.xls')
    worksheet = book.worksheet 0
    worksheet
  end
end
