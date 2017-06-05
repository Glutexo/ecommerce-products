# Simulation of eCommerce store

Read Issue #1 to get started.

## Description

This component offers classes to represent a `Product` and a `Cart`.

`Product` holds its `name` and `price` and can also contain subproducts. It
provides `total` method that computes the full price of the product itself and
its subproducts.

`Cart` contains a list of `Product`s and provide `#min` and `#max` methods to
find the cheapest `Product` or the most expensive respectively. If there are
more `Product`s of the same extreme price in the `Cart`, an arbitrary `Product`
is selected.

Both `Product` and `Cart` provide `#sum` method that computes the sum of its
contained `Product`s.

## Usage

Use the `Product` class to represent your products, use the `Cart` class to
represent a shopping cart. Instances of both classes can be printed out.
`Product` prints its name and price; nested subproducts are indented to show a
tree structure. `Cart` prints the sum of its products.

### Example

```ruby
require_relative('lib/cart')

products = [ Product.new('iPhone 7',
                         '21190.0',
                         [ Product.new('Smart battery case', '2990.0'),
                           Product.new('Lightning to 3.5 mm headphone jack adapter', '279.9') ]),
             Product.new('Apple Watch Series 2',
                         '8290.0',
                         [ Product.new('Magnetic charging cable', '899.0'),
                           Product.new('Camelia sport band', '1490.0') ]) ]

package = Product.new('iPhone + Apple Watch', '0.0', products)
puts package
# iPhone + Apple Watch 0.0 35138.9
#   iPhone 7 21190.0 3269.9
#     Smart battery case 2990.0 0.0
#     Lightning to 3.5 mm headphone jack adapter 279.9
#   Apple Watch Series 2 8290.0 9189.0
#     Magnetic charging cable 899.0
#     Camelia sport band 1490.0

cart = Cart.new products
puts cart # 35138.9
puts cart.min # Apple Watch Series 2 8290.0 9189.0
```
