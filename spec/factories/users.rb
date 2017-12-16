FactoryBot.define do
  factory :user_on, class: User do
    nickname "Caio"
    email "caio@speedmsg.com"
    password "123123"
    password_confirmation "123123"
  end

  factory :carlos, class: User do
    nickname "Carlos"
    email "carlos@speedmsg.com"
    password "123123"
    password_confirmation "123123"
  end

  factory :pedro, class: User do
    nickname "Pedro"
    email "pedro@speedmsg.com"
    password "123123"
    password_confirmation "123123"
  end

  factory :felipe, class: User do
    nickname "Felipe"
    email "felipe@speedmsg.com"
    password "123123"
    password_confirmation "123123"
  end
end
