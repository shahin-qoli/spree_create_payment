module Spree
  module Admin
    class FollowupController < Spree::Admin::BaseController   
      include Spree::Backend::Callbacks
      include Spree::Admin::OrderConcern
      before_action :load_order

      def index
      end

      def new
      end

      def create
      end

      def model_class
        Spree::Payment
      end
   
    end
  end
end      