FactoryBot.define do

  factory :visualized_false, class: Message do
    user_id {
      User.find_by(email: 'caio@speedmsg.com').try(:id) || FactoryBot.create(:user_on).id
    }
    title "ping"
    text "testando 1, 2 , 3"
    visualized false
    user_receiver_id {
      User.find_by(email: 'carlos@speedmsg.com').try(:id) || FactoryBot.create(:carlos).id
    }
    date_view "2017-12-14"
    archive false
  end

  factory :visualized_true, class: Message  do
    user_id {
      User.find_by(email: 'caio@speedmsg.com').try(:id) || FactoryBot.create(:user_on).id
    }
    title "ping"
    text "testando 1, 2 , 3"
    visualized true
    user_receiver_id {
      User.find_by(email: 'carlos@speedmsg.com').try(:id) || FactoryBot.create(:carlos).id
    }
    date_view "2017-12-13"
    archive false
  end

  factory :message_receiver, class: Message  do
    user_id {
      User.find_by(email: 'carlos@speedmsg.com').try(:id) || FactoryBot.create(:carlos).id
    }
    title "ping"
    text "testando 1, 2 , 3"
    visualized false
    user_receiver_id {
      User.find_by(email: 'caio@speedmsg.com').try(:id) || FactoryBot.create(:user_on).id
    }
    date_view "2017-12-13"
    archive false
  end

  factory :message_archived, class: Message  do
    user_id {
      User.find_by(email: 'caio@speedmsg.com').try(:id) || FactoryBot.create(:user_on).id
    }
    title "ping"
    text "testando 1, 2 , 3"
    visualized true
    user_receiver_id {
      User.find_by(email: 'carlos@speedmsg.com').try(:id) || FactoryBot.create(:carlos).id
    }
    date_view "2017-12-13"
    archive true
  end
end
