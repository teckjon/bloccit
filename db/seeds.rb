# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
include RandomData

 # Create Topics
 15.times do
   Topic.create!(
     name:         RandomData.random_sentence,
     description:  RandomData.random_paragraph
   )
 end
 topics = Topic.all
 
 # Create Posts
 50.times do
 # #1
   Post.create!(
 # #2
     topic: topics.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all
 
 50.times do
 # #1
   SponsoredPost.create!(
 # #2
     topic: topics.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph,
     price: 100
   )
 end
 sponsored_posts = SponsoredPost.all
 
 # Create Comments
 # #3
 100.times do
   Comment.create!(
 # #4
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end
 
 Post.create!(
     title: "My Unique Title",
     body:  "My Unique Body"
     )

 Comment.create!(
     post: posts.sample,
     body:  "My Unique Body Comments"
     )

 puts "Seed finished"
 puts "#{Topic.count} topics created"
 puts "#{Post.count} posts created"
 puts "#{SponsoredPost.count} sponsored posts"
 puts "#{Comment.count} comments created"