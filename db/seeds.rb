# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
include RandomData
 
 # Create Posts
 50.times do
 # #1
   Post.create!(
 # #2
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all
 
 # Create Comments
 # #3
 100.times do
   Comment.create!(
 # #4
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end
 
 20.times do
   Question.create!(
     title: Randomdata.random_sentence,
     body:  Randomdata.random_paragraph,
     resolved: false
   )
 end
=begin 
 Post.create!(
     title: "My Unique Title",
     body:  "My Unique Body"
     )

 Comment.create!(
     post: posts.sample,
     body:  "My Unique Body Comments"
     )
 
 Question.create!(
     question: "My Question",
     body: "My Unique Question Comments"
  )
=end

 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 puts "#{Question.count} questions created"

 