FactoryBot.define do
  factory :message do
    user nil
    text "MyText"
    message_displayed false
    user_receiver_id 1
    data_displayed "2017-12-14"
  end
end
