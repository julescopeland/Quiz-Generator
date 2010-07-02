class CreateCategoriesQuestionsTable < ActiveRecord::Migration
  def self.up
    create_table :categories_questions, :id => false, :force => true do |t|
      t.references :category
      t.references :question
      t.timestamps
    end
  end

  def self.down
    drop_table :categories_questions
  end
end