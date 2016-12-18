100.times do
  p = Product.new
  p.name = Faker::Product.name
  p.price = Random.rand(0..10000)

  
end
