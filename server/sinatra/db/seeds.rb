require './app'
require './models/topic.rb'

Topic.destroy_all   

topics = [
    {topic: 'Flags'},
    {topic: 'Physical Geography'},
    {topic: 'Human Geography'},
    {topic: 'Continents and Oceans'},
    {topic: 'Demography'},
    {topic: 'Capitals'}
]

topics.each do |u|
    Topic.create(u)
end