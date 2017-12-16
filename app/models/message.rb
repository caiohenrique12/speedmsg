class Message < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :user_receiver, class_name: 'User'


  def status_message
    message_displayed ? "Visualizado" : "Não Visualizado"
  end

  def change_status
    self.update_columns(message_displayed: true)
  end
end
