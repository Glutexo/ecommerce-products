# Simulation of eCommerce store

Read Issue #1 to get started.

## Usage

Use the `Product` class to represent your products. Each product can
have its price. The product can be formatted along with its price.

A sample script is included. It can be run by `rake sample` task.

### Example

```ruby
require_relative('lib/product')

product = Product.new 'MacBook Pro', 49999.9
puts product # MacBook Pro (49999.90)
```
