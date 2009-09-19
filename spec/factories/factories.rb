Factory.sequence :representative_name do |x|
  "representative " + rand(12345678).to_s
end

Factory.sequence :product_name do |x|
  "product " + rand(987654).to_s
end

Factory.sequence :line_name do |x|
  "line " + rand(987654).to_s
end

Factory.sequence :price_name do |x|
  "price " + rand(987654).to_s
end

Factory.sequence :customer_name do |x|
  "customer " + rand(987654).to_s
end

#----------------------------------------------
Factory.define :line, :class => Line do |u|
  u.name Factory.next(:line_name)
  u.description "Descrição ..."
  u.status true
end

#----------------------------------------------
#----------------------------------------------
Factory.define :product, :class => Product do |u|
  u.name Factory.next(:product_name)
  u.color "Black"
  u.code "A0001"
  u.bar_code "AAAAAAAAAABBBBBBBBBB1234567890"
  u.features "My features..."
  u.description "My description..."
  u.palet_m2 "1000"
  u.box_m2 "2000"
  u.weight_m2 "3000"
  u.status true
  u.line Factory(:line)
end

#----------------------------------------------
Factory.define :photo, :class => Photo do |u|
  u.title "Title 123"
  u.description "My photo description"
  u.image_file_name "imagem1.jpg"
  u.image_content_type "image/jpeg"
  u.image_file_size "52263"
  u.image_updated_at Date.current
  u.photo_type "1"
end

#----------------------------------------------
Factory.define :representative, :class => Representative do |u|
  u.name Factory.next(:representative_name)
  u.cnpj_cpf "11.234.432/0001-12"
  u.status true
end

#----------------------------------------------
Factory.define :dependent_representative, :class => DependentRepresentative do |u|
  u.name "Dependent 1"
  u.representative Factory(:representative)
end

#----------------------------------------------
Factory.define :price_list, :class => PriceList do |u|
  u.name  Factory.next(:price_name)
end

#----------------------------------------------
Factory.define :carrier, :class => Carrier do |u|
  u.name "Carrier 1"
  u.status true
end

#----------------------------------------------
Factory.define :carrier_price_list, :class => CarrierPriceList do |u|
  u.name "Carrier Price List 1"
  u.carrier Factory(:carrier)
end

#----------------------------------------------
Factory.define :customer, :class => Customer do |u|
  u.name  Factory.next(:customer_name)
  u.cnpj_cpf "11.321.333/0001-45"
  u.status true
  u.representative Factory(:representative)
end

#----------------------------------------------
Factory.define :payment_form, :class => PaymentForm do |u|
  u.name "Form of payment 1"
  u.status true
end

#----------------------------------------------
Factory.define :solicitation, :class => Solicitation do |u|
  u.representative Factory(:representative)
  u.customer Factory(:customer)
end

#----------------------------------------------
Factory.define :solicitation_item, :class => SolicitationItem do |u|
  u.solicitation Factory(:solicitation)
  u.product Factory(:product)
  u.price_list Factory(:price_list)
end

#----------------------------------------------
Factory.define :sale, :class => Sale do |u|
  u.sale_date Date.current
  u.invoice "123"
  u.solicitation Factory(:solicitation)
end

#----------------------------------------------
Factory.define :sale_item, :class => SaleItem do |u|
  u.sale Factory(:sale)
  u.solicitation_item Factory(:solicitation_item)
end

