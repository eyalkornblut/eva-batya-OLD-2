module SpreeCustomExtension
  class Engine < Rails::Engine
    def self.activate
      Spree::Order.class_eval do
 
        StateMachine::Machine.ignore_method_conflicts = true 
        Spree::Order.state_machines.clear 

        # customize the checkout state machine
        Order.state_machines[:state] = StateMachine::Machine.new(Order, :initial => 'cart') do
          after_transition :to => 'complete', :do => :complete_order
          before_transition :to => 'complete', :do => :process_payment
          event :next do
            transition :from => 'cart', :to => 'payment'
            transition :from => 'payment', :to => 'complete'
          end
     
          event :cancel do
            transition :to => 'canceled', :if => :allow_cancel?
          end
          event :return do
            transition :to => 'returned', :from => 'awaiting_return'
          end
          event :resume do
            transition :to => 'resumed', :from => 'canceled', :if => :allow_resume?
          end
          event :authorize_return do
            transition :to => 'awaiting_return'
          end

          before_transition :to => 'complete' do |order|
            begin
              order.process_payments!
            rescue Core::GatewayError
              !!Spree::Config[:allow_checkout_on_gateway_error]
            end
          end

          before_transition :to => ['delivery'] do |order|
            order.shipments.each { |s| s.destroy unless s.shipping_method.available_to_order?(order) }
          end

          after_transition :to => 'complete', :do => :finalize!
          after_transition :to => 'delivery', :do => :create_tax_charge!
          after_transition :to => 'payment',  :do => :create_shipment!
          after_transition :to => 'resumed',  :do => :after_resume
          after_transition :to => 'canceled', :do => :after_cancel 
        end
 
      end
    end
  end
end



# Spree::Order.class_eval do 

#   StateMachine::Machine.ignore_method_conflicts = true 

#   Spree::Order.state_machines.clear 

#   # order state machine (see http://github.com/pluginaweek/state_machine/tree/master 
#   # for details) 
#   state_machine :initial => 'cart', :use_transactions => false do 

#     event :next do 
#       transition :from => 'cart',     :to => 'payment', :if => :payment_required? 
#       transition :from => 'cart',     :to => 'complete' 
#       transition :from => 'confirm',  :to => 'complete' 

#       # note: some payment methods will not support a confirm step 
#       transition :from => 'payment',  :to => 'confirm', 
#                                       :if => Proc.new { |order| order.payment_method && order.payment_method.payment_profiles_supported? } 

#       transition :from => 'payment', :to => 'complete' 
#     end 

#     event :cancel do 
#       transition :to => 'canceled', :if => :allow_cancel? 
#     end 
#     event :return do 
#       transition :to => 'returned', :from => 'awaiting_return' 
#     end 
#     event :resume do 
#       transition :to => 'resumed', :from => 'canceled', :if => :allow_resume? 
#     end 
#     event :authorize_return do 
#       transition :to => 'awaiting_return' 
#     end 

#     before_transition :to => 'complete' do |order| 
#       begin 
#         order.process_payments! 
#       rescue Core::GatewayError 
#         if Spree::Config[:allow_checkout_on_gateway_error] 
#           true 
#         else 
#           false 
#         end 
#       end 
#     end 

#     before_transition :to => ['delivery'] do |order| 
#       order.shipments.each { |s| s.destroy unless s.shipping_method.available_to_order?(order) } 
#     end 

#     after_transition :to => 'complete', :do => :finalize! 
#     after_transition :to => 'delivery', :do => :create_tax_charge! 
#     after_transition :to => 'payment',  :do => :create_shipment! 
#     after_transition :to => 'resumed',  :do => :after_resume 
#     after_transition :to => 'canceled', :do => :after_cancel 

#   end 

# end 
