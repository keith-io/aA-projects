# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create!(username: "Zak")
u2 = User.create!(username: "Keith")
u3 = User.create!(username: "Soonmi")
u4 = User.create!(username: "Mashu")
u5 = User.create!(username: "Tommy")

p1 = Poll.create!(title: "App Academy Survey", author_id: u3.id)
p2 = Poll.create!(title: "Wellness Survey", author_id: u1.id)

q1 = Question.create!(body: "How many hours of sleep do you get?", poll_id: p2.id)
q2 = Question.create!(body: "Can you hack this website?", poll_id: p1.id)
q3 = Question.create!(body: "What is wrong with this migration?", poll_id: p1.id)
q4 = Question.create!(body: "Which error will this code raise?", poll_id: p1.id)
q5 = Question.create!(body: "Which of the above snippets have errors?", poll_id: p1.id)
q6 = Question.create!(body: "Which of these 4 clones would you choose for a final project?", poll_id: p1.id)


a1 = AnswerChoice.create!(text: "6", question_id: q1.id)
a2 = AnswerChoice.create!(text: "7", question_id: q1.id)
a3 = AnswerChoice.create!(text: "8", question_id: q1.id)
a4 = AnswerChoice.create!(text: "10", question_id: q1.id)

a5 = AnswerChoice.create!(text: "There shouldn't be commas at the end of each line", question_id: q3.id)
a6 = AnswerChoice.create!(text: "The user is editing an old migration", question_id: q3.id)
a7 = AnswerChoice.create!(text: "The table name is singular not plural", question_id: q3.id)
a8 = AnswerChoice.create!(text: "All of the above", question_id: q3.id)
a9 = AnswerChoice.create!(text: "Nothing is wrong with this migration", question_id: q3.id)

r1 = Response.create!(answer_choice_id: a5.id, user_id: u1.id)
r1 = Response.create!(answer_choice_id: a8.id, user_id: u2.id)
r1 = Response.create!(answer_choice_id: a7.id, user_id: u4.id)
r1 = Response.create!(answer_choice_id: a8.id, user_id: u1.id)
r1 = Response.create!(answer_choice_id: a9.id, user_id: u5.id)

r2 = Response.create!(answer_choice_id: a3.id, user_id: u1.id)
r2 = Response.create!(answer_choice_id: a4.id, user_id: u2.id)
r2 = Response.create!(answer_choice_id: a3.id, user_id: u3.id)
r2 = Response.create!(answer_choice_id: a2.id, user_id: u4.id)
r2 = Response.create!(answer_choice_id: a1.id, user_id: u5.id)