json.extract! message, :id, :user_id, :text, :displayed, :user_receiver_id, :date_view, :created_at, :updated_at
json.url message_url(message, format: :json)
