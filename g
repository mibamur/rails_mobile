rails g scaffold cat_rashod name --force
rails g scaffold cat_dohod name --force
rails g scaffold schet name login:belongs_to panel:boolean balance:boolean cash:decimal{8-2} --force
rails g scaffold rab first_name last_name tel login:belongs_to --force
rails g scaffold rab_images image rab:belongs_to --force
rails g scaffold rashod schet:belongs_to cat_rashod:belongs_to comment:text rab:belongs_to todate:date cash:decimal{8-2} --force
rails g scaffold dohod schet:belongs_to cat_dohod:belongs_to comment:text rab:belongs_to todate:date cash:decimal{8-2} --force
rails g scaffold perevod schet_from:integer schet_to:integer rab:belongs_to todate:date cash:decimal{18-2} comment:text --force
