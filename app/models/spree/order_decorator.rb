Spree::Order.class_eval do
	checkout_flow do
		go_to_state :address
	  go_to_state :payment, :if => lambda { |order| order.payment_required? }
	  go_to_state :confirm, :if => lambda { |order| order.confirmation_required? }
	  go_to_state :complete
	end

	# If true, causes the payment step to happen during the checkout process
  def payment_required?
    return false
  end

  # If true, causes the confirmation step to happen during the checkout process
  def confirmation_required?
    return true
  end

	before_validation :clone_billing_address

  def clone_billing_address
		if bill_address	
	  	if self.ship_address.nil?
	      self.ship_address = bill_address.clone
	    else
	      self.ship_address.attributes = bill_address.attributes.except('id', 'updated_at', 'created_at')
	    end
	  end
    true
  end

end

