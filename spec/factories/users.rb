FactoryBot.define do
    factory :user do
         first_name            {"島井"}
         first_name_kana       {"ヤスヒロ"}
         last_name             {"安広"}
         last_name_kana        {"ヤスヒロ"}
         nickname              {"tech"}
         birth_date            {"1987-08-31"}
         email                 {"kkk@email.com"}
         password              {"gakuen114"}
         password_confirmation {"gakuen114"}
    end
end