FactoryGirl.define do
  factory :user do
  	name     "Vitalik"
  	email    "vit@esi.com"
  	password "12345678"
  	password_confirmation "12345678"
  end
  factory :hotel do
    title              "Plaza hotel"
    star_rating        5
    breakfast_included true
    room_description   "Very nice room"
    price_for_room     120
    country            "Ukraine"
    state              "Lugansk"
    city               "Don"
    street             "Lenina"
  end
end
