SELECT Count(*) AS expression
FROM (
  SELECT 1 AS expression
    FROM commerce_order commerce_order
         LEFT JOIN users users_commerce_order
           ON commerce_order.uid = users_commerce_order.uid
         LEFT JOIN field_data_commerce_customer_billing field_data_commerce_customer_billing
           ON commerce_order.order_id = field_data_commerce_customer_billing.entity_id
              AND ( field_data_commerce_customer_billing.entity_type = 'commerce_order'
              AND field_data_commerce_customer_billing.deleted = '0' )
         LEFT JOIN commerce_customer_profile commerce_customer_profile_field_data_commerce_customer_billing
           ON field_data_commerce_customer_billing.commerce_customer_billing_profile_id = 
              commerce_customer_profile_field_data_commerce_customer_billing.profile_id
      WHERE ((( commerce_order.status 
     	NOT IN ( 'cart', 'checkout_checkout', 'checkout_review', 
     		     'checkout_payment', 'checkout_complete' ) )))) subquery; 


