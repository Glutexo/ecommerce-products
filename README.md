# Simulation of eCommerce store

Read Issue #1 to get started.

## Description

This component offers classes to represent a `Product` and a `Cart`.

`Product` holds its `name` and `price`.

`Cart` holds a list of `Product`s and can performs some simple
operations upon them:
* `#min` and `#max` methods find the cheapest `Product` or the most
expensive respectively; if there are more `Product`s of the same extreme price in
the Cart, an arbitrary `Product` is selected.
* `#sum` method computes the sum of the prices of the `Product`s.

## Usage

Use the `Product` class to represent your products, use the `Cart` class to
represent a shopping cart. Instances of both classes can be printed out.
`Product` prints its name and price, `Cart` prints the sum of its products.

### Example

```ruby
require_relative('lib/cart')

products = [Product.new('MacBook Pro', '55990.99'),
            Product.new('iMac', '39990.00')]
cart     = Cart.new products

puts cart # 95980.99
puts cart.min # iMac 39990.0
```
