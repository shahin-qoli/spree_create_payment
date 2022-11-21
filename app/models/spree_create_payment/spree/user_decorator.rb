module SpreeCreatePayment::Spree::UserDecorator
  def self.prepended(base)
    base.whitelisted_ransackable_attributes = %w[b1_code]   
  end

end	

Spree.user_class.prepend SpreeCreatePayment::Spree::UserDecorator