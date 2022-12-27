FactoryBot.define do
  factory :devise_user do
    fn = Faker::Name.first_name
    sn = Faker::Name.last_name
    email  {"#{fn}.#{sn}@yourdomain.net"}
    # email {"#{Faker::Internet.email}_#{devise_user.id}"}
    password {Faker::Internet.password(8)}
  end
end
