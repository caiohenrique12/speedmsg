class Message < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :user_receiver, class_name: 'User'

  after_update :update_date_view, if: :displayed?
  after_update :update_date_archived, if: :archive?

  validates_presence_of :title, :text, :user_receiver_id,

  def status_message
    displayed ? "Visualizado" : "Não Visualizado"
  end

  def change_status
    self.update(displayed: true)
  end

  def archive_message
    self.update(archive: true)
  end

  def update_date_view
    self.update_column(:date_view, DateTime.now)
  end

  def update_date_archived
    self.update_column(:date_archived, DateTime.now)
  end
end
