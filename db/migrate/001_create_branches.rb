class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :name
      t.references :counter_repository
      t.references :issue

    end
    add_index :branches, :issue_id
  end
end
