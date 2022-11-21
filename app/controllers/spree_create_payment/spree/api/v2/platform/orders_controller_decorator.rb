module SpreeCreatePayment::Spree::Api::V2::Platform::OrdersControllerDecorator  
	  def create_payment
            order_id = params[:id]
            puts " HEREEEEEEEEEE123123123123E*************"
            order = Spree::Order.find(order_id)
            puts " HEREEEEEEEEEEE*************"
            puts order
            payment_method_id = params[:order][:payment_method_id]
            amount = params[:order][:amount]
            following_code = params[:order][:following_code]
            payment_method = payment_method(payment_method_id)
            puts "HALA INJAAAAAAAAAAAAA"
            order.payments.create!({
                source: Spree::Check.last,
                amount: amount, payment_method: payment_method, following_code: following_code
                })
            while !order.complete?
            order.next!
            end
             
            payment = order.payments.last
            puts "AFTER THIS*************" 
            render :json => payment, status: 201        
           
	  end

          def payment_method(payment_method_id)
             puts "********&&&&&&&&&&"  
             Spree::PaymentMethod.find(payment_method_id)

          end	
end		


Spree::Api::V2::Platform::OrdersController.prepend SpreeCreatePayment::Spree::Api::V2::Platform::OrdersControllerDecorator
