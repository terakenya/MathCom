class CreateQuestionCategories < ActiveRecord::Migration
  def change
    create_table :question_categories do |t|

      t.timestamps null: false
    end
  end
end
