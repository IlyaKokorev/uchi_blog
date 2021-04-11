require 'ffaker'

#User.create(email: 'teacher@uchi.ru', password: '123123', password_confirmation: '123123')

35.times do
  Post.create(title: FFaker::CheesyLingo.title,
              summary: FFaker::CheesyLingo.sentence,
              body: FFaker::CheesyLingo.paragraph)
end
