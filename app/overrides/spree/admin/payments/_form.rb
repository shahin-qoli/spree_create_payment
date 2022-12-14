Deface::Override.new(
  virtual_path: 'spree/admin/payments/_form',
  name: 'Add peygiri code',
  replace_contents: 'div[data-hook="admin_payment_form_fields"]',
  text: <<-HTML

  <div class="form-group">
    <%= f.label :amount, Spree.t(:amount) %>
    <%= f.text_field :amount, value: @order.display_outstanding_balance.money, class: 'form-control' %>
    <%= f.label :following_code, Spree.t(:following_code) %>
    <%= f.text_field :following_code, value: @payment.following_code, class: 'form-control' %>
  </div>
  <div class="form-group">
    <strong><%= Spree.t(:payment_method) %></strong>
    <% @payment_methods.each do |method| %>
      <div class="radio" data-id="<%= Spree.t(method.name, scope: :payment_methods, default: method.name).parameterize %>">
        <label data-hook="payment_method_field">
          <%= radio_button_tag 'payment[payment_method_id]', method.id, method == @payment_method, { class: "payment_methods_radios" } %>
          <%= Spree.t(method.name, scope: :payment_methods, default: method.name) %>
        </label>
      </div>
    <% end %>

    <div class="payment-method-settings">
      <% @payment_methods.each do |method| %>

        <div class="payment-methods my-3" id="payment_method_<%= method.id %>">
          <% if method.source_required? %>
            <%= render partial: "spree/admin/payments/source_forms/%s" % [method.method_type],
                       locals: {
                         payment_method: method,
                         previous_cards: method.reusable_sources(@order)
                       } %>
          <% end %>
        </div>
      <% end %>
    </div>
  </div>

   HTML
)

