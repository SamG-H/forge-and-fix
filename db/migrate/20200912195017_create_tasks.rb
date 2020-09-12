class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.integer :issue_id
      t.text :deadline
      
      t.timestamps
    end
  end
end
