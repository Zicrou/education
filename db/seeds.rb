# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Profil
Profil.create!(
    name:"site_admin"
)
Profil.create!(
    name:"professeur"
)
Profil.create!(
    name:"censeur"
)
Profil.create!(
    name:"proviseur"
)
Profil.create!(
    name:"principale"
)
Profil.create!(
    name:"surveillante"
)
puts "6 Profils created"
#END Profil
User.create!(
    email:"guest@guest.com",
    password:"guestuser",
    password_confirmation: "guestuser",
    name:"Guest User"
)
puts "1 Guest user created"


User.create!(
    email:"prof@prof.com",
    password:"asdfasdf",
    password_confirmation: "asdfasdf",
    name:"Prof User",
    roles:"professeur"
)
puts "1 regular user created"



User.create!(
    email:"aziz@admin.com",
    password:"azizadmin",
    password_confirmation: "azizadmin",
    name:"Aziz Admin",
    roles:"site_admin"
)
puts "1 User Admin created"


# Zone
#Country

Country.create(
    name:"SENEGAL"
)
#END ZONE COUNTRY

#REGION
Region.create!(
    name:"SK8Z",
    country_id: Country.first.id
)

Region.create!(
    country_id: Country.first.id,
    name:"DAKAR"
)

Region.create!(
    country_id: Country.first.id,
    name:"THIES"
)

Region.create!(
    country_id: Country.first.id,
    name:"ZIGUINCHOR"
)

Region.create!(
    country_id: Country.first.id,
    name:"DIOURBEL"
)

Region.create!(
    country_id: Country.first.id,
    name:"SAINT-LOUIS"
)

Region.create!(
    country_id: Country.first.id,
    name:"TAMBACOUNDA"
)

Region.create!(
    country_id: Country.first.id,
    name:"KAOLACK"
)

Region.create!(
    country_id: Country.first.id,
    name:"LOUGA"
)

Region.create!(
    country_id: Country.first.id,
    name:"FATICK"
)

Region.create!(
    country_id: Country.first.id,
    name:"KOLDA"
)

Region.create!(
    country_id: Country.first.id,
    name:"MATAM"
)

Region.create!(
    country_id: Country.first.id,
    name:"KAFFRINE"
)

Region.create!(
    country_id: Country.first.id,
    name:"KEDOUGOU"
)

Region.create!(
    country_id: Country.first.id,
    name:"SEDHIOU"
)
puts "14 Regions created"

#END ZONE REGION

#DEPARTEMENT
Departement.create(
    name:"CL8K",
    region_id: Region.first.id
)
puts "1 Departement created"
#END ZONE DEPARTEMENT

#Etablissement
Etablissement.create!(
    name:"CLBK",
    departement_id: Departement.first.id,
    adresse: "EVERYWHERE"
)
#END ETABLISSEMENT
puts "1 Etablissement created"
#End Zone
3.times do |topic|
    Topic.create!(
        title: "Topic #{topic}"
        )
end

puts "3 topics created"

Niveau.create!(
    name: "TERMINALE"
    )

puts "1 niveau created"

Seri.create!(
    name: "L2",
    niveau_id: Niveau.first.id
    )

puts "1 seri created"

Matiere.create!(
    name: "HISTOIRE",
    seri_id: Seri.first.id,
    niveau_id: Niveau.first.id
    )

puts "1 matiere created"

Author.create!(
    user_id: User.last.id,
    etablissement_id: Etablissement.first.id,
    matiere_id: Matiere.first.id,
    telephone: 781026837
    )

puts "1 author created"

10.times do |blog|
  Blog.create(
    title: "My Blog Post #{blog}",
    body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
    topic_id: Topic.last.id,
    niveau_id: Niveau.first.id,
    seri_id: Seri.first.id,
    matiere_id: Matiere.first.id,
    author_id: Author.first.id
    )
end

puts "10 blog posts created"


5.times do |skill|
  Skill.create(
    title: "Rails #{skill}",
    percent_utilized: 75
    )
end

puts "5 skills created"

8.times do |portfolio_item|
  Portfolio.create(
    title:"Portfolio title: #{portfolio_item}",
    subtitle: "Ruby On Rails",
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    main_image: "http://placehold.it/600x400",
    thumb_image:"http://placehold.it/350x200"
    )
end

1.times do |portfolio_item|
  Portfolio.create!(
    title:"Portfolio title: #{portfolio_item}",
    subtitle: "Angular",
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    main_image: "http://placehold.it/600x400",
    thumb_image:"http://placehold.it/350x200"
    )
end

puts "9 portfolio items created"

3.times do |technology|
    Portfolio.last.technologies.create!(
        name: "Technology #{technology}"
    )
end

puts "3 technologies items created"


