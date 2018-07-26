class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :questions
      t.text :description
      t.string :generation
      t.timestamps
    end
  end
end
