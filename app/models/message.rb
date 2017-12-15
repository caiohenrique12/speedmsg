class Message < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :user_receiver, class_name: 'User'
end
