class CreateJoinTableLendersSchools < ActiveRecord::Migration[5.0]
  def change
    create_join_table :lenders, :schools do |t|
      t.index [:lender_id, :school_id]
      t.index [:school_id, :lender_id]
    end
  end
end
