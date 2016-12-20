Product.destroy_all

20.times do
  p = Product.new
  p.name = Faker::Commerce.product_name
  p.price = Random.rand(0..10000)

  Random.rand(0..10).times do
    opt = Option.new(name: Faker::Lorem.word)
    p.options << opt
  end

  Random.rand(0..3).times do
    pv = PriceVariant.new(name: Faker::Commerce.product_name, adjustment: Random.rand(-5..100))
    p.price_variants << pv
  end

  p.save!
end
