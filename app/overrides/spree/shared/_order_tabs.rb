Deface::Override.new(
  virtual_path: 'spree/admin/shared/_order_tabs',
  name: 'Add FollowUp to order',
  insert_after: 'li[data-hook="admin_order_tabs_state_changes"]',
  text: <<-HTML

    <li class="nav-item" data-hook='admin_order_tabs_followups'>
      <%= link_to_with_icon 'credit-card.svg',
        Spree.t(:followups),
        admin_followup_index_path(@order),
        class: "%s nav-link" % "'active' if current == :followups" %>
    </li>

   HTML
)