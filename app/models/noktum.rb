class Noktum < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  acts_as_votable
  validates :body, length: {minimum: 2, maximum: 200}
end
