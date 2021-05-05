FactoryBot.define do
    factory :item_form do
      postal_code      { '123-4567' }
      start_area_id    { 2 }
      municipality     { "我孫子市"}
      address          { '河田町1-1-1' }
      building_name    { '龍馬'}
      phone_number     { '09012345678' }
      token            { 'sk********************' }
    end
  end