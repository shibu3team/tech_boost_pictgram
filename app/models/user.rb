class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true,length: { maximum: 12 }, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 5 }

  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: "topic"
  has_many :replies

end
