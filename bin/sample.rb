#!/usr/bin/env ruby

require_relative '../lib/product'

products = []
products << Product.new('MacBook Pro', '55990.00')
products << Product.new('iMac', '39990.00')
products << Product.new('Mac Pro', '95990.00')

products.map
products.each &method(:puts)
