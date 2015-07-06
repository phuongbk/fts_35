class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :content
      t.boolean :is_correct, default: false
      
      t.belongs_to :question, index: true

      t.timestamps null: false
    end
  end
end
