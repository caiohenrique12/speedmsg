FactoryBot.define do

  factory :message_displayed_false, class: Message do
    user_id {
      User.find_by(email: 'caio@speedmsg.com').try(:id) || FactoryBot.create(:user_on).id
    }
    title "ping"
    text "testando 1, 2 , 3"
    message_displayed false
    user_receiver_id {
      User.find_by(email: 'carlos@speedmsg.com').try(:id) || FactoryBot.create(:carlos).id
    }
    data_displayed "2017-12-14"
  end

  factory :message_displayed_true, class: Message  do
    user_id {
      User.find_by(email: 'caio@speedmsg.com').try(:id) || FactoryBot.create(:user_on).id
    }
    title "ping"
    text "testando 1, 2 , 3"
    message_displayed true
    user_receiver_id {
      User.find_by(email: 'carlos@speedmsg.com').try(:id) || FactoryBot.create(:carlos).id
    }
    data_displayed "2017-12-13"
  end
end
