# == Schema Information
#
# Table name: replies
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  topic_id   :integer
#

class Reply < ApplicationRecord
  validates :content, presence: true
  validates :topic_id, presence: true
  validates :user_id, presence: true

  belongs_to :user
  belongs_to :topic

end
