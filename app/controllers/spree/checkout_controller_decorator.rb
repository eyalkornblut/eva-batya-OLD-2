Spree::CheckoutController.class_eval do

  private

  def before_address
    if @order.bill_address == nil
      @order.bill_address ||= Spree::Address.default
      @order.ship_address ||= Spree::Address.default
    end
    @order.bill_address.address1 = "."
    @order.bill_address.address2 = "."
    @order.bill_address.country_id = Spree::Config[:default_country_id]
    @order.bill_address.state_name = "Israel"
    @order.bill_address.zipcode = "0"
  end

end