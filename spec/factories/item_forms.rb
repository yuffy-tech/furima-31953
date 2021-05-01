FactoryBot.define do
    factory :item_buy do
      postal_code      { '123-4567' }
      start_area_id    { 2 }
      municipality     { '高知市' }
      address          { '河田町1-1-1' }
      building_name    { '龍馬'}
      phone_number     { '09012345678' }
    end
  end