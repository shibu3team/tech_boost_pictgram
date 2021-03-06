# == Schema Information
#
# Table name: topics
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  description :string
#  image       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  validates :image, presence: true

  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: "user"
  has_many :replies

  scope :user_topics, -> (user_id) { where(user_id: user_id) }
  #method的な使い方（引数）＋条件

  
end
