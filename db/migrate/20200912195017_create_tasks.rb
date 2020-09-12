class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.integer :issue_id
      t.string :status
      
      t.timestamps
    end
  end
end
