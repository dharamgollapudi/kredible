class AddSchoolToSubmissions < ActiveRecord::Migration[5.0]
  def change
    add_reference :submissions, :school, index: true
  end
end
