#!/usr/bin/env ruby

require_relative '../lib/product'

products = []
products << ECommerce::Product.new('MacBook Pro', 55990.00)
products << ECommerce::Product.new('iMac', 39990.00)
products << ECommerce::Product.new('Mac Pro', 95990.00)

puts 'Máme na skladě:'
products.each do |product|
  puts "• #{product}"
end
