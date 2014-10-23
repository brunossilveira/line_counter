class CreateCorrectionFactors < ActiveRecord::Migration
  def change
    create_table :correction_factors do |t|
      t.string :complexity
      t.references :tracker
      t.references :project
      t.float :value
    end
    add_index :correction_factors, :tracker_id
    add_index :correction_factors, :project_id
  end
end
