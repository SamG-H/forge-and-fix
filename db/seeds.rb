# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!([{ username: 'jancsi', password: 'jancsi' },
                      { username: 'sam', password: 'sam'},
                      { username: 'maitland', password: 'maitland'},
                      { username: 'bean', password: 'bean' }])
projects = Project.create!([{ title: 'Bujo On The Go', category: 'Android', description: 'A bullet journal app for Android', user: users.first},
                            { title: 'Sharks', category: 'Web', description: 'A website where you can learn about Sharks!', user: users.second},
                            { title: 'Gardentopia', category: 'iOS', description: 'Create your own perfect garden on your iphone', user: users.third},
                            { title: 'I See A Tree', category: 'iOS', description: 'Identify trees using your icamera', user: users.fourth},
                            { title: 'Androidmacs', category: 'Android', description: 'Emacs for Android', user: users.first},
                            { title: 'Fancy Tea', category: 'iOS', description: 'Schedule tea parties with your fanciest friends', user: users.second},
                            { title: 'Zlack', category: 'CLI', description: 'Slack from the command line', user: users.third},
                            { title: 'Adopt-A-Pet', category: 'Android', description: 'Access shelters and adopt pets on their phone.', user: users.fourth},
                            { title: 'Real-Recipes', category: 'Web', description: 'Your own personel recipe database', user: users.fourth},
                            { title: 'Fruit Info', category: 'CLI', description: 'Look at fruit info from the command line', user: users.second},
                            { title: 'Jar Notes', category: 'Web', description: 'Stores notes by in different jars(categories)', user: users.third}])
projects.each do |p|
  Issue.create!([{ title: 'Create Icon', description: 'Make it memorable', project: p},
                 { title: 'Fix sign in page', description: 'Password field not hidden', project: p},
                 { title: 'Add google sign up', description: 'Everybody has a google account', project: p}])
end
counter = 0
Issue.all.each do |i|
  if counter == 4
    counter = 0
  else
    tasks = Task.create!([{ user: users[counter], issue: i, status: 'in-progress'}])
    counter += 1
  end
end
                         
