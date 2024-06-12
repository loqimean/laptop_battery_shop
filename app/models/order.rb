class Order < ApplicationRecord
  scope :ordered, -> { order(created_at: :asc) }

  has_many :product_orders, dependent: :destroy
  has_many :products, through: :product_orders

  belongs_to :customer, class_name: 'User', foreign_key: :customer_id, required: false

  belongs_to :promocode, required: false

  validates :first_name, :last_name, :address, :phone, presence: true

  def product_sum(product)
    product_orders.joins(:product)
                  .where(order_id: id, products: { id: product.id })
                  .sum('product_orders.amount * products.price')
  end

  def product_amount(product)
    product_orders.find_by(product:).amount
  end

  def total_sum
    product_orders.joins(:product)
                  .where(order_id: id)
                  .sum('product_orders.amount * products.price')
  end

  def customer_full_name
    "#{first_name} #{last_name}"
  end

  def discount
    promocode.discount_is_fixed ? "₴ #{promocode.discount}" : "#{promocode.discount}%"
  end

  def final_sum
    if promocode.discount_is_fixed
      sum = total_sum - promocode.discount.to_d
    else
      sum = total_sum * ((100 - promocode.discount.to_f) / 100)
    end

    [sum, 0.01].max
  end
end
