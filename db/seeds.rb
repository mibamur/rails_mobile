Role.create!([
  {name: "user", resource_id: nil, resource_type: nil},
  {name: "admin", resource_id: nil, resource_type: nil},
  {name: "root", resource_id: nil, resource_type: nil},
  {name: "dev", resource_id: nil, resource_type: nil},
  {name: "reg", resource_id: nil, resource_type: nil}
])
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
