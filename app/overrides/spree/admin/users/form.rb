Deface::Override.new(
    virtual_path: 'spree/admin/users/_form',
    name: 'Enable admin to add mobile number for a user',
    insert_before: 'div[data-hook="admin_user_form_roles"]',
    text: <<-HTML
      <%= f.field_container :mobile_number do %>
      <%= f.label :mobile_number, Spree.t(:mobile_number) %>
      <%= f.text_field :mobile_number, class: 'form-control' %>
      <%= f.error_message_on :mobile_number %>
    <% end %>
    HTML
)
