# Simulation of eCommerce store

Read Issue #1 to get started.

## Description

This component offers classes to represent a `Product` and a `Cart`.

`Product` holds its `name` and `price`.

`Product` has a price that can be with or without VAT:
* `#price.without_vat` is the base price of the product.
* `#price.vat` is  computed from a fixed rate of 21 %.
* `#price.with_vat` is a sum of `#price.without_vat` and `#price.vat`.  

`Cart` holds a list of `Product`s and can performs some simple
operations upon them:
* `#min` and `#max` methods find the cheapest `Product` or the most
expensive respectively; if there are more `Product`s of the same extreme price
in the Cart, an arbitrary `Product` is selected.
* `#sum` method computes the sum of the prices of the `Product`s. This again can
  be `#with_vat` or `#without_vat`

## Usage

Use the `Product` class to represent your products, use the `Cart` class to
represent a shopping cart. Instances of both classes can be printed out.
`Product` prints its name and price, `Cart` prints the sum of its products. All
prices are printed in a format "#{price.without_vat} #{price.vat}".

A helper method `Price.format` is provided to format single BigDecimal prices in
a human-readable way.

### Example

```ruby
require_relative('lib/cart')

products = [Product.new('MacBook Pro', '55990.99'),
            Product.new('iMac', '39990.00')]
cart     = Cart.new products

puts cart # 95980.99 20156.0079

min = cart.min
puts min # iMac 39990.0 8397.9

puts Price.format min.price.with_vat # 48387.9
```
