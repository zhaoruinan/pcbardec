# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
(1..100).each do |i|
  Decrecord.create!(title: "Lipsum Decrecord #{i}", body: %{
      Nullam hendrerit iaculis sodales. Curabitur varius nibh arcu, id molestie nibh fermentum vitae. Cras quis semper dui. Cras porttitor urna sit amet risus vehicula tempor. Maecenas quis tempor ligula. Donec et nibh eu leo volutpat placerat. Fusce vulputate elit in nisi pretium, vel fermentum mi fermentum. Mauris scelerisque, lectus non luctus ultricies, urna eros tincidunt risus, at varius sapien diam id erat.
  })
end
