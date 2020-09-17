require 'faker'

User.destroy_all
Post.destroy_all
Comment.destroy_all
Relationship.destroy_all
Type.destroy_all

#users - normal users and instructors
3.times do
   User.create(
        username: Faker::Name.name_with_middle,
        email: Faker::Internet.free_email,
        password: "123456"
   ) 
end
#Post by coaches/instructors
2.times do
    Post.create(
        title: Faker::Coffee.blend_name,
        content: Faker::Coffee.notes,  
        url: Faker::Quote.famous_last_words,
        views: Faker::Number.number(digits: 3),
        likes: Faker::Number.number(digits: 1),
        poster_id: User.all.first.id
    )
end
#comments that belong to user & post
1.times do
    Comment.create(
        comment: "wow! great post",
        post: Post.all.first,
        commenter_id: User.all.last.id
    )
end

#type of fitness coach: boxing, yoga, hit, etc.
type1 = Type.create(category: "Yoga", user_id: User.all.first.id )
type2 = Type.create(category: "Boxing", user_id: User.all.first.id )
type3 = Type.create(category: "Swimming", user_id: User.all.last.id )


#relationships 
Relationship.create(follower_id: User.all.first.id, followed_id: User.all.second.id)
Relationship.create(follower_id: User.all.first.id, followed_id: User.all.last.id)


puts 'completed'