['user', 'admin', 'root', 'dev'].each do |role|
  Role.find_or_create_by({name: role})
end

#   {email: "admin@mail.ru", password: "admin@mail.ru"},

Login.create!([
  {email: "bezimanka@mail.ru", password: "1244" },
  {email: "pionerskaya@mail.ru", password: "4481"},
  {email: "teplaya@mail.ru", password: "4567"},
  {email: "bira@mail.ru", password: "4343"},
  {email: "andr@mail.ru", password: "4545"}
])

lroot=Login.new
lroot.email="admin@mail.ru"
lroot.password="admin@mail.ru"
lroot.password_confirmation="admin@mail.ru"
lroot.add_role :root
lroot.save!

CatDohod.create!([
  {name: "Доход"},
  {name: "Прочее"}
])
CatRashod.create!([
  {name: "Расход"},
  {name: "Прочее"}
])

Rab.create!([
  {first_name: "Анна", last_name: "Терзакова", tel: "89456132"},
  {first_name: "Лена", last_name: "Пушкина", tel: "4569873214"}
])

Schet.create!([
  {name: "Пионерская", login_id: nil, panel: true, balance: nil, cash: "0"},
  {name: "Безымянка", login_id: nil, panel: true, balance: nil, cash: "0"},
  {name: "Теплая", login_id: nil, panel: true, balance: nil, cash: "0"},
  {name: "Администратор", login_id: nil, panel: true, balance: nil, cash: "0"},
  {name: "ИзьятиеС", login_id: nil, panel: false, balance: nil, cash: "0"},
  {name: "ИзьятиеМ", login_id: nil, panel: false, balance: nil, cash: "0"}
])
