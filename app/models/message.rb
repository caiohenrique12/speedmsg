class Message < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :user_receiver, class_name: 'User'


  def status_message
    displayed ? "Visualizado" : "Não Visualizado"
  end

  def change_status
    self.update(displayed: true)
  end

  def archive_message
    self.update(archive: true)
  end
end
