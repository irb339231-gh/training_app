class CreateTrainingLogs < ActiveRecord::Migration[8.1]
  def change
    create_table :training_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :exercise, null: false, foreign_key: true
      t.date :date
      t.float :weight
      t.integer :reps
      t.integer :sets
      t.text :memo

      t.timestamps
    end
  end
end
