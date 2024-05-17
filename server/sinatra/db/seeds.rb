require './app'
require './models/topic'
require './models/question'
require './models/option'
require './models/qa'

Qa.destroy_all
Question.destroy_all
Option.destroy_all
Topic.destroy_all   

topics_data = [
  { topic: 'Flags' },
  { topic: 'Physical Geography' },
  { topic: 'Human Geography' },
  { topic: 'Continents and Oceans' },
  { topic: 'Demography' },
  { topic: 'Capitals' }
]

topics_data.each { |data| Topic.find_or_create_by(topic: data[:topic]) }

questions_data = [
  { question: 'What color is the French flag?', topic: 'Flags', correct_option: 'Red, White, and Blue' },
  { question: 'What is the largest ocean in the world?', topic: 'Continents and Oceans', correct_option: 'Pacific Ocean' },
  { question: 'Which country has the highest population?', topic: 'Demography', correct_option: 'China' }
]

options_data = [
  { response: 'Blue', topic: 'Flags' },
  { response: 'Green', topic: 'Flags' },
  { response: 'White', topic: 'Flags' },
  { response: 'Atlantic Ocean', topics: 'Continents and Oceans' },
]

options_data.each do |o_data| 
  topic = Topic.find_by(topic: o_data[:topic])
  next unless topic

  Option.find_or_create_by(response: o_data[:response], topics_id: topic.id)
end

questions_data.each do |q_data|
  topic = Topic.find_by(topic: q_data[:topic])
  next unless topic

  question = Question.create!(question: q_data[:question], topics_id: topic.id)

  correct_option = Option.find_or_create_by(response: q_data[:correct_option], topics_id: topic.id)
  Qa.create!(questions_id: question.id, options_id: correct_option.id)
end
