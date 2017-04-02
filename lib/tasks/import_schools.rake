require 'csv'

desc "Import schools from csv file"
task :import_schools => [:environment] do
  file = "#{Rails.root}/db/seeds/schools.csv"

  puts "Importing Schools from #{file}"

  CSV.foreach(file, headers: true, encoding: 'ISO-8859-1') do |row|
    School.create ({     
      external_id:  row['UNITID'],
      name:         row['INSTNM'],
      address:      row['ADDR'],
      city:         row['CITY'],
      state:        row['STABBR'],
      zip:          row['ZIP']
    })
  end

  puts "Done"
end
