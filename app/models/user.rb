class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages

  scope :list_users, -> (user_id) { where.not(id: user_id).compact }

  def count_messages
    messages.where.not(displayed: true).count
  end
end
