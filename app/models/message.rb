class Message < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :user_receiver_id, foreign_key: :user_receiver_id, class_name: 'User'
end
