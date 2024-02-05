# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require 'faker'

# Create projects
projects = []
puts 'Creating projects!'
3.times do
    projects << Project.create(
        name: Faker::Company.name,
        description: Faker::Lorem.sentence,
    )
end

# Create tasks and sub-tasks for each project
puts 'Creating tasks and subtasks'
projects.each do |project|
    5.times do
        task = project.tasks.create(
            name: Faker::Lorem.word,
            description: Faker::Lorem.sentence,
        )
  
        8.times do
            task.subtasks.create(
                name: Faker::Lorem.word,
                description: Faker::Lorem.sentence,
                due_date: Faker::Date.forward(days: 10)
            )
        end
    end
end
