desc "Assign schools to lenders"
task :assign_schools => [:environment] do
  puts "Assigning Schools to lenders"

  school_ids = School.ids
  
  Lender.all.each do |lender|
    lender.school_ids = school_ids.sample(1000)
  end
    
  puts "Done"
end