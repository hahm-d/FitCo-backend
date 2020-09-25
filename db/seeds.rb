require 'faker'

User.destroy_all
Post.destroy_all
Comment.destroy_all
Relationship.destroy_all
Type.destroy_all

#Create Instructors
    User.create(
        username: "Raymee",
        email: Faker::Internet.free_email,
        password: "12345",
        status: "online",
        description: "Yoga is the way of life. Follow me!",
        twitter: "RayRay",
        instagram: "Raymee",
        flag: true
    ) 
13.times do |i|
  sample = User.create(
            username: Faker::TvShows::RickAndMorty.character,
            email: Faker::Internet.free_email,
            password: "12345",
            status: "online",
            description: Faker::TvShows::RickAndMorty.quote,
            twitter: Faker::Games::Pokemon.name,
            instagram: Faker::Games::Overwatch.hero,
            flag: true
    ) 
    sample.image.attach(io: File.open("/Users/daniel/Flatiron/personal/FitCo/FitCo-backend/samples/profile#{i+1}.png"), filename: "profile#{i+1}.png", content_type: 'image/png')

end

#Post by coaches/instructors
4.times do
    Post.create(
        title: Faker::Coffee.blend_name,
        content: Faker::Coffee.notes,  
        views: Faker::Number.number(digits: 3),
        likes: Faker::Number.number(digits: 1),
        poster_id: User.first.id, 
    )
end

#attach images
User.first.image.attach(io: File.open('/Users/daniel/Flatiron/personal/FitCo/FitCo-backend/samples/raymeProfile.png'), filename: 'raymeProfile.png', content_type: 'image/png')
Post.first.video.attach(io: File.open('/Users/daniel/Flatiron/personal/FitCo/FitCo-backend/samples/raymeVideo.mp4'), filename: 'raymeVideo.mp4', content_type: 'video/mp4')
Post.first.image.attach(io: File.open('/Users/daniel/Flatiron/personal/FitCo/FitCo-backend/samples/rayme1.png'), filename: 'rayme1.png', content_type: 'image/png')
Post.second.image.attach(io: File.open('/Users/daniel/Flatiron/personal/FitCo/FitCo-backend/samples/rayme2.png'), filename: 'rayme2.png', content_type: 'image/png')
Post.third.image.attach(io: File.open('/Users/daniel/Flatiron/personal/FitCo/FitCo-backend/samples/rayme3.png'), filename: 'rayme3.png', content_type: 'image/png')
Post.fourth.image.attach(io: File.open('/Users/daniel/Flatiron/personal/FitCo/FitCo-backend/samples/rayme4.png'), filename: 'rayme4.png', content_type: 'image/png')


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
    list = ["Hit", "Yoga", "CrossFit", "Boxing", "Cario", "Weight"]
    Type.create(category: list.sample, user_id: user.id )
end


#relationships 
Relationship.create(follower_id: User.all.first.id, followed_id: User.all.second.id)
Relationship.create(follower_id: User.all.first.id, followed_id: User.all.third.id)
Relationship.create(follower_id: User.all.first.id, followed_id: User.all.last.id)
Relationship.create(follower_id: User.all.second.id, followed_id: User.all.last.id)
Relationship.create(follower_id: User.all.third.id, followed_id: User.all.last.id)

puts 'completed'