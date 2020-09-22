require 'faker'

User.destroy_all
Post.destroy_all
Comment.destroy_all
Relationship.destroy_all
Type.destroy_all

#users - normal users and instructors
4.times do
   User.create(
        username: Faker::Name.name_with_middle,
        email: Faker::Internet.free_email,
        password: "12345",
        status: "online",
        description: "Yoga is the way of life. Follow me!"
        flag: true
   ) 
end

#Post by coaches/instructors
3.times do
    Post.create(
        title: Faker::Coffee.blend_name,
        content: Faker::Coffee.notes,  
        url: Faker::Quote.famous_last_words,
        views: Faker::Number.number(digits: 3),
        likes: Faker::Number.number(digits: 1),
        poster_id: User.all.first.id, 
    )
end

User.first.image.attach(io: File.open('/Users/daniel/Flatiron/personal/FitCo/FitCo-backend/samples/raymeProfile.png'), filename: 'raymeProfile.png', content_type: 'image/png')
Post.first.image.attach(io: File.open('/Users/daniel/Flatiron/personal/FitCo/FitCo-backend/samples/rayme1.png'), filename: 'rayme1.png', content_type: 'image/png')
Post.first.image.attach(io: File.open('/Users/daniel/Flatiron/personal/FitCo/FitCo-backend/samples/rayme2.png'), filename: 'rayme2.png', content_type: 'image/png')
Post.second.image.attach(io: File.open('/Users/daniel/Flatiron/personal/FitCo/FitCo-backend/samples/rayme3.png'), filename: 'rayme3.png', content_type: 'image/png')
Post.third.image.attach(io: File.open('/Users/daniel/Flatiron/personal/FitCo/FitCo-backend/samples/rayme4.png'), filename: 'rayme4.png', content_type: 'image/png')

#comments that belong to user & post
3.times do
    Comment.create(
        comment: "wow! great post",
        post: Post.all.last,
        username: Post.all.last,
        commenter_id: User.all.last.id
    )
end

#type of fitness coach: boxing, yoga, hit, etc.
type1 = Type.create(category: "Yoga", user_id: User.all.first.id )
type2 = Type.create(category: "Boxing", user_id: User.all.first.id )
type3 = Type.create(category: "Swimming", user_id: User.all.last.id )


#relationships 
Relationship.create(follower_id: User.all.first.id, followed_id: User.all.second.id)
Relationship.create(follower_id: User.all.first.id, followed_id: User.all.third.id)
Relationship.create(follower_id: User.all.first.id, followed_id: User.all.last.id)
Relationship.create(follower_id: User.all.second.id, followed_id: User.all.last.id)
Relationship.create(follower_id: User.all.third.id, followed_id: User.all.last.id)

puts 'completed'