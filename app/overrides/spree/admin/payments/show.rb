Deface::Override.new(
  virtual_path: 'spree/admin/payments/show',
  name: 'Add peygiri code to show',
  insert_bottom: 'div[data-hook="amount"]',
  text: <<-HTML
      <%= Spree.t(:following_code) %>: <%= @payment.following_code %>
   HTML
)
