Deface::Override.new(
  virtual_path: 'spree/admin/shared/_order_tabs',
  name: 'Add FollowUp to order',
  insert_bottom: 'erb[silent]:contains('content_for :page_tabs do')',
  text: <<-HTML
     <% if can?(:index, Spree::Followup) %>
    <li class="nav-item" data-hook='admin_order_tabs_followups'>
      <%= link_to_with_icon 'credit-card.svg',
        Spree.t(:followups),
        spree.admin_order_followups_url(@order),
        class: "#{'active' if current == :followups} nav-link" %>
    </li>
  <% end %>
   HTML
)
