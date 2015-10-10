10.times do
  Hotel.create do |h|
    h.title            = Faker::Name.title
    h.room_description = Faker::Lorem.paragraph(10)
    h.price_for_room   = 100
    h.state            = Faker::Address.state
    h.city             = Faker::Address.city
    h.street           = Faker::Address.street_address
    h.hotels_country   = Faker::Address.country

    h.user = User.create do |u|
      u.name                  = Faker::Internet.user_name
      u.email                 = Faker::Internet.email
      password                = Faker::Lorem.characters(10)
      u.password              = password
      u.password_confirmation = password
    end
  end
end

