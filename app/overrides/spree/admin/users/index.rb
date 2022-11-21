Deface::Override.new(
    virtual_path: 'spree/admin/users/index',
    name: 'Enable admin to add mobile number for a user',
    replace_contents: 'div[data-hook="admin_users_index_search"]',
    text: <<-HTML
    <%= search_form_for [:admin, @search], url: spree.admin_users_url do |f| %>
      <div class="form-group">
        <%= f.label :b1_code_cont, Spree.t(:b1_code) %>
        <%= f.text_field :b1_code_cont, class: "form-control js-quick-search-target js-filterable" %>
      </div>
      <div class="form-group">
        <%= f.label :email_cont, Spree.t(:email) %>
        <%= f.email_field :email_cont, class: "form-control js-quick-search-target js-filterable" %>
      </div>
      <div class="row">
        <div class="col-12 col-lg-6">
          <div class="form-group">
            <%= f.label :bill_address_firstname_cont, Spree.t(:first_name) %>
            <%= f.text_field :bill_address_firstname_cont, class: 'form-control js-filterable' %>
          </div>
        </div>
        <div class="col-12 col-lg-6">
          <div class="form-group">
            <%= f.label :bill_address_lastname_cont, Spree.t(:last_name) %>
            <%= f.text_field :bill_address_lastname_cont, class: 'form-control js-filterable' %>
          </div>
        </div>
      </div>
      <% if Spree::Config[:company] %>
        <div class="form-group">
          <%= f.label :bill_address_company_cont, Spree.t(:company) %>
          <%= f.text_field :bill_address_company_cont, class: 'form-control js-filterable' %>
        </div>
      <% end %>
      <div data-hook="admin_users_index_search_buttons" class="form-actions">
        <%= button Spree.t(:search), 'search.svg' %>
      </div>
    <% end %>
    HTML
)