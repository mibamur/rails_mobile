['user', 'admin', 'root', 'dev'].each do |role|
  Role.find_or_create_by({name: role})
end
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

Role::HABTM_Logins.create!([
  {login_id: 1, role_id: 5},
  {login_id: 2, role_id: 5},
  {login_id: 3, role_id: 5},
  {login_id: 4, role_id: 5},
  {login_id: 5, role_id: 5},
  {login_id: 6, role_id: 3},
  {login_id: 4, role_id: 3},
  {login_id: 5, role_id: 2}
])
Login::HABTM_Roles.create!([
  {login_id: 1, role_id: 5},
  {login_id: 2, role_id: 5},
  {login_id: 3, role_id: 5},
  {login_id: 4, role_id: 5},
  {login_id: 5, role_id: 5},
  {login_id: 6, role_id: 3},
  {login_id: 4, role_id: 3},
  {login_id: 5, role_id: 2}
])
CatDohod.create!([
  {name: "Silver-pay", odin: true},
  {name: "Прочее", odin: nil}
])
CatRashod.create!([
  {name: "Расход", odin: true},
  {name: "Прочее", odin: nil},
  {name: "Аванс, З/П, Охрана", odin: nil},
  {name: "Аренда, Комунальные", odin: nil},
  {name: "Билеты", odin: nil},
  {name: "ГСМ", odin: nil},
  {name: "Кредиты", odin: nil},
  {name: "Связь", odin: nil},
  {name: "Хоз.нужды", odin: nil}
])

Rab.create!([
  {first_name: "Лена", last_name: "Пушкина", tel: "4569873214", login_id: nil},
  {first_name: "Эля", last_name: "Ауцина", tel: "89145611123", login_id: nil}
])
Schet.create!([
  {name: "Пионерская", login_id: 2, panel: true, balance: false, cash: "0.0"},
  {name: "Безымянка", login_id: 1, panel: true, balance: false, cash: "0.0"},
  {name: "Теплое", login_id: 3, panel: true, balance: false, cash: "0.0"},
  {name: "Администратор", login_id: nil, panel: true, balance: false, cash: "0.0"},
  {name: "ИзьятиеС", login_id: nil, panel: false, balance: nil, cash: "0.0"},
  {name: "ИзьятиеМ", login_id: nil, panel: false, balance: nil, cash: "0.0"}
])
