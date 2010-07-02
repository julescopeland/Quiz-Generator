# == Schema Information
# Schema version: 20100701132925
#
# Table name: questions
#
#  id         :integer         not null, primary key
#  question   :text
#  answer     :text
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Question < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :question, :on => :save, :message => "You haven't written a question!"
  validates_presence_of :answer, :on => :save, :message => "You haven't written the answer!"
  validates_uniqueness_of :question, :on => :create, :message => "We already have that question in the database."
  
  attr_accessible :question, :answer, :user_id
end
