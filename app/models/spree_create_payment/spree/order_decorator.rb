module SpreeCreatePayment::Spree::OrderDecorator
  def self.prepended(base)
    base.has_many :followup, class_name: 'Spree::Followup'
  end

end	

Spree::Order.prepend SpreeCreatePayment::Spree::OrderDecorator