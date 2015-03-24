class Question < ActiveRecord::Base
  belongs_to :user
  validates :title, :body, :presence => true
  has_many :responses
end
