User.create!(name:  "foo and bar",
             email: "foobar@foobar.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:  password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

# リレーションシップ
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
<<<<<<< HEAD
followers.each { |follower| follower.follow(user) }
=======
followers.each { |follower| follower.follow(user) }

# コメント
users = User.order(:created_at).take(3)
microposts = Micropost.order(:created_at).take(6)
users.each do |user|
  microposts.each do |micropost|
    message = Faker::Lorem.sentence(2)
    micropost.comments.create!(message: message, user_id: user.id)
  end
end
>>>>>>> origin/for-work
