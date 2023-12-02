# frozen_string_literal: true

# Orders
# Resources related to the orders in the API.
# http://docs.veeqo.apiary.io/#reference/orders/order-collection

module Veeqo
  class Order < Resource
    include Veeqo::ResourceActions.new(uri: 'orders/%d', disable: %i[destroy destroy_all])

    property :id
    property :allocated_completely
    property :allocations
    property :buyer_user_id
    property :cancel_reason
    property :cancelled_at
    property :cancelled_by
    property :channel
    property :created_at
    property :created_by
    property :customer
    property :customer_note
    property :customer_viewable_notes
    property :deliver_to
    property :delivery_cost
    property :delivery_method
    property :due_date
    property :employee_notes
    property :fulfilled_by_amazon
    property :international
    property :line_items
    property :notes
    property :number
    property :packed_completely
    property :payment
    property :picked_completely
    property :receipt_printed
    property :refund_amount
    property :returns
    property :send_notification_email
    property :send_refund_email
    property :shipped_at
    property :status
    property :subtotal_price
    property :tags
    property :till_id
    property :total_discounts
    property :total_price
    property :total_tax
    property :updated_at
    property :updated_by

    def self.bulk_tagging(resource_ids, tag_ids, params = {})
      raise ArgumentError if resource_ids.empty? || tag_ids.empty?

      post 'https://app.veeqo.com/bulk_tagging', { order_ids: [*resource_ids], tag_ids: [*tag_ids] }.merge(params)
    end
  end
end
