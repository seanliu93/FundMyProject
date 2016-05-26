# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  count = 0

# create admin account
User.create(email: "admin@admin.com", password: "blahblah", admin?: true)

#create fake data
10.times do 
  User.create(email: "seanliu#{count}@gmail.com", password: "blahblah")
  count += 1
end



Project.create(
  title: "Robot Cereal",  
  description: "This is a description that talks about Robot Cereal!",
  user_id: 1,
  fund_goal: 20000,
  end_date: '2016/06/25'
)
Project.create(
  title: "Macbook SUPER",  
  description: "This is a description that talks about MACBOOK SUPER",
  user_id: 2,
  fund_goal: 20000,
  end_date: '2016/06/20'
)
Project.create(
  title: "Blahbitty Blah",  
  description: "This is a description that talks about Blahbitty Blah!",
  user_id: 3,
  fund_goal: 20000,
  end_date: '2016/07/20'
)
Project.create(
  title: "Dragonball Z Balls!!",  
  description: "This is a description that talks about Dragonball Z Balls!",
  user_id: 4,
  fund_goal: 20000,
  end_date: '2016/05/20'
)
Project.create(
  title: "Watch Maker Shaker",  
  description: "This is a description that talks about Watches",
  user_id: 5,
  fund_goal: 20000,
  end_date: '2016/08/20'
)
Project.create(
  title: "Lotto O Motto",  
  description: "This is a description that talks about Lotto O Motto",
  user_id: 3,
  fund_goal: 20000,
  end_date: '2016/09/20'
)
Project.create(
  title: "Project 52: The Journey Begins",  
  description: "This is a description that talks about Project 52",
  user_id: 4,
  fund_goal: 20000,
  end_date: '2016/06/04'
)
Project.create(
  title: "Sheepies!",  
  description: "This is a description that talks about Sheepies!",
  user_id: 9,
  fund_goal: 20000,
  end_date: '2016/06/03'
)
Project.create(
  title: "Coin Flipper",  
  description: "This is a description that talks about Coin Flipper",
  user_id: 8,
  fund_goal: 2000,
  end_date: '2016/06/14'
)