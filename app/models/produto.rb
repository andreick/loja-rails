class Produto < ApplicationRecord
  validates :nome, presence: true
  validates :preco, numericality: { greater_than: 0 }
  validates :quantidade,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 0
            }
end
