require 'faker'

# USERS CREATION

user0 = User.create(
    username: "PedroCampos",
    email: " pcampos@gmail.com",
    password: "12345678",
    full_name: "Pedro Campos"
)
user1 = User.create(
    username: "MariaSilva",
    email: "msilva@hotmail.com   ",
    password: "12345678",
    full_name: "Maria siLVa  "
)
user2 = User.create(
    username: "JoaoSantos",
    email: "jsantos@hotmail.com",
    password: "12345678",
    full_name: "Joao Santos"
)
user3 = User.create(
    username: "AnaRodrigues",
    email: "arodrigues@gmail.com",
    password: "12345678",
    full_name: "Ana Rodrigues"
)
user4 = User.create(
    username: "BenjaTapia",
    email: "benjatapia@gmail.com",
    password: "12345678",
    full_name: "Benjamin Tapia"
)

# TEAMS CREATION

team0 = Team.create(
    name: "SuperApp",
    creator: user4,
    users: [user1, user2, user4]
)

team1 = Team.create(
    name: "NotThatGreatApp",
    creator: user3,
    users: [user0, user2, user3, user4]
)

# BOARDS CREATION

board00 = Board.create(title: "backend", creator: user4, team: team0)
board01 = Board.create(title: "frontend", creator: user4, team: team0)
board10 = Board.create(title: "backend", creator: user3, team: team1)
board11 = Board.create(title: "frontend", creator: user3, team: team1)

# STATUS LISTS CREATION

status_list_list0 = [
    StatusList.create(title: "to do", board: board00),
    StatusList.create(title: "in progress", board: board00),
    StatusList.create(title: "done", board: board00),
    StatusList.create(title: "deploy", board: board00),
    StatusList.create(title: "to do", board: board01),
    StatusList.create(title: "in progress", board: board01),
    StatusList.create(title: "done", board: board01),
    StatusList.create(title: "deploy", board: board01)
]
status_list_list1 = [
    StatusList.create(title: "to do", board: board10),
    StatusList.create(title: "in progress", board: board10),
    StatusList.create(title: "done", board: board10),
    StatusList.create(title: "deploy", board: board10),
    StatusList.create(title: "to do", board: board11),
    StatusList.create(title: "in progress", board: board11),
    StatusList.create(title: "done", board: board11),
    StatusList.create(title: "deploy", board: board11)
]

# CARDS CREATION

status_list_list0.each do |status_list|
    5.times do
        Card.create(
            title: Faker::Lorem.sentence(word_count: 3),
            description: Faker::Lorem.sentence,
            priority: ["low", "medium", "high"].sample,
            creator: [user1, user2, user4].sample,
            assignee: [user1, user2, user4].sample,
            status_list: status_list
        )
    end
end
status_list_list1.each do |status_list|
    5.times do
        Card.create(
            title: Faker::Lorem.sentence(word_count: 3),
            description: Faker::Lorem.sentence,
            priority: ["low", "medium", "high"].sample,
            creator: [user0, user2, user3, user4].sample,
            assignee: [user0, user2, user3, user4].sample,
            status_list: status_list
        )
    end
end