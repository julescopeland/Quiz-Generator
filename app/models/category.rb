# == Schema Information
# Schema version: 20100702093703
#
# Table name: categories
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :string(255)
#  parent_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Category < ActiveRecord::Base
  has_and_belongs_to_many :questions
  
  validates_presence_of :name
  
  acts_as_tree
  
  def number_of_questions
    self.questions_including_subcategories.size
  end
  
  def questions_including_subcategories
    return self.questions if self.children.nil?
    all_questions = self.questions
    self.children.each do |subcategory|
      all_questions << subcategory.questions
    end
  end
end
