# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.date :due_date
      t.date :completed_date
      t.integer :progress
      t.integer :status, default: 0
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
