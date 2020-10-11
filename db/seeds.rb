require 'faker'

User.destroy_all
Post.destroy_all
Comment.destroy_all
Relationship.destroy_all
Type.destroy_all

=begin 
#Create manual samples 
user1 = User.create(
        username: "Raymee",
        email: Faker::Internet.free_email,
        password: "12345",
        status: "online",
        description: "Yoga is the way of life. Follow me!",
        twitter: "RayRay",
        instagram: "Raymee",
        flag: true
    ) 
user2= User.create(
        username: "June",
        email: Faker::Internet.free_email,
        password: "12345",
        status: "offline",
        description: "Proud coach @ FitCo.",
        twitter: "physique",
        instagram: "physique",
        flag: true
    ) 
user2.image.attach(io: File.open("samples/june.png"), filename: "june.png", content_type: 'image/png')

#Create Instructors
21.times do |i|
    sample = User.create(
            username: Faker::Twitter.screen_name,
            email: Faker::Internet.free_email,
            password: "12345",
            status: "offline",
            description: Faker::Games::Overwatch.quote,
            twitter: Faker::Twitter.screen_name,
            instagram: Faker::Games::Dota.player,
            flag: true
    ) 
User.second.image.attach(io: File.open("samples/profile#{i+1}.png"), filename: "profile#{i+1}.png", content_type: 'image/png')

end

#manual posts
Post.create(
        title: "Tabata Burnnn",
        content: "Non-stop 45min fat burn with us",  
        views: Faker::Number.number(digits: 3),
        likes: Faker::Number.number(digits: 1),
        poster_id: User.first.id
)
Post.create(
        title: Faker::Games::StreetFighter.move,
        content: "Pull out those dumbells, Time for Round 1",  
        views: Faker::Number.number(digits: 3),
        likes: Faker::Number.number(digits: 1),
        poster_id: User.first.id
)
Post.create(
        title: Faker::Games::StreetFighter.move,
        content: "Part 2. Shoulder, arms, & back workout",  
        views: Faker::Number.number(digits: 3),
        likes: Faker::Number.number(digits: 1),
        poster_id: User.first.id
)
Post.create(
        title: "Total Body Annihilation!",
        content: "feature guest Tallifa",  
        views: Faker::Number.number(digits: 4),
        likes: Faker::Number.number(digits: 2),
        poster_id: User.first.id
)


#Post by coaches/instructors
4.times do |i|
    samplePost = Post.create(
        title: Faker::Games::StreetFighter.character,
        content: Faker::Coffee.notes,  
        views: Faker::Number.number(digits: 3),
        likes: Faker::Number.number(digits: 2),
        poster_id: User.second.id 
    )
    samplePost.image.attach(io: File.open("samples/post#{i+1}.png"), filename: "post#{i+1}.png", content_type: 'image/png')

end

#manual posts



#attach images
User.first.image.attach(io: File.open('samples/raymeProfile.png'), filename: 'raymeProfile.png', content_type: 'image/png')
Post.first.image.attach(io: File.open('samples/rayme1.png'), filename: 'rayme1.png', content_type: 'image/png')
Post.second.image.attach(io: File.open('samples/rayme2.png'), filename: 'rayme2.png', content_type: 'image/png')
Post.third.image.attach(io: File.open('samples/rayme3.png'), filename: 'rayme3.png', content_type: 'image/png')
Post.fourth.image.attach(io: File.open('samples/rayme4.png'), filename: 'rayme4.png', content_type: 'image/png')


#comments
User.all.each do |user|
Comment.create(
    comment: Faker::Quote.yoda,
    post: Post.all.first,
    username: user.username,
    commenter_id: user.id
)
end 

#type of fitness coach: boxing, yoga, hit, etc.
User.all.each do |user|
list = [1, 2, 3, 4]
Type.create(category: list.sample, user_id: user.id )
end


#relationships 
Relationship.create(follower_id: User.all.first.id, followed_id: User.all.second.id)
Relationship.create(follower_id: User.all.first.id, followed_id: User.all.third.id)
Relationship.create(follower_id: User.all.first.id, followed_id: User.all.last.id)
=end


puts 'completed'