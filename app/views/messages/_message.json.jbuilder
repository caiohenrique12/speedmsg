json.extract! message, :id, :user_id, :text, :message_displayed, :user_receiver_id, :data_displayed, :created_at, :updated_at
json.url message_url(message, format: :json)
