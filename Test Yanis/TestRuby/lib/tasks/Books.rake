require 'faker'

namespace :db do

  desc "Fill database with sample data"

  task :populate => :environment do

    Rake::Task['db:reset'].invoke

    # Fill up the database
    1000.times do |n|

      name  = Faker::Book.title
      description = Faker::Lorem.paragraph
      datePublication = Faker::Date.between(from: 10.year.ago, to: 5.year.ago)
      auteur = Faker::Book.author
      prix = Faker::Number.number(digits: 2)

      Book.create!(:nom => name,
                   :description => description,
                   :datePublication => datePublication,
                   :auteur => auteur,
                   :prix => prix)
    end

  end

end