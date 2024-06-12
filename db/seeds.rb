puts "Seeding data..."

path = Rails.root.join("db", "seeds-data", "list.yml")
data = YAML.load_file(path)

5.times do
  data.each do |record|
    Product.create!(
      name: record["name"],
      description: Faker::Lorem.paragraph,
      price: Faker::Commerce.price(range: 853.0..1956.78),
      link: record["link"],
      balance: rand(0..10)
    )
    print "."
  end
end

puts "\nSeeding finished!"
