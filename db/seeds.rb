# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create!(
  name: 'admin',
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password',
)

User.create!(
  name: 'general',
  email: 'general@example.com',
  password: 'password',
  password_confirmation: 'password',
)

Bird.create!(
  bird_type: 1,
  description: '並セキセイインコ（ノーマルセキセイインコ）の特徴は後頭部から背中のさざ波模様。代表的な色はグリーンで、これが本来の野生種に最も近い種類です。',
)

Bird.create!(
  bird_type: 2,
  description: '宝石の「オパール」のようにきれいに輝いた毛並みをしていることから、オパーリンという名前がつけられたそうです。',
)

Bird.create!(
  bird_type: 3,
  description: 'レインボーはオパーリンの一種で、ブルー系に頭部がイエローのものが一般的にレインボーと呼ばれます。',
)

10.times do |index|
  pet = Pet.create!(
    user: User.offset(rand(User.count)).first,
    bird: Bird.offset(rand(Bird.count)).first,
    name: "インコ#{index}"
  )
  puts "#{pet.name} has created!"
end
