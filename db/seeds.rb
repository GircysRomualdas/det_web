def generate_code(number)
    charset = Array('A'..'Z') + Array('a'..'z')
    Array.new(number) { charset.sample }.join
end

response = HTTParty.get('https://dev.detaliutiekimas.lt/ords/dev/web/getAllBrands', :verify => false)

response["brands"].each do |brand| 
    created = Brand.where(id: brand["brand_id"]).first_or_initialize

    created.update!(
        brand_id: brand["id"],
        name: brand["name"],
        group_id: brand["group"]
    )
end

userTest1 = User.where(email: "test1@gmail.com").first_or_initialize
userTest1.update!(
    password: "password",
    password_confirmation: "password",
    company_id: 281
)
orderPrep1 = OrderPrep.where(user: userTest1).first_or_initialize
orderPrep1.update!(
    brand: Brand.first
)

userTest2 = User.where(email: "test2@gmail.com").first_or_initialize
userTest2.update!(
    password: "password",
    password_confirmation: "password",
    company_id: 281
)
orderPrep2 = OrderPrep.where(user: userTest2).first_or_initialize
orderPrep2.update!(
    brand: Brand.first
)

response = HTTParty.get('https://dev.detaliutiekimas.lt/ords/dev/web/getAllCompanies', :verify => false)

response["companies"].each do |company| 
    if company["company_email"] != nil 
        created = User.where(email: company["company_email"]).first
        if created != nil 
            created.update!(
                company_id:             company["company_id"],
                company_name:           company["company_name"],
                surcharge_id:           company["surcharge_id"],
                surcharge_name:         company["surcharge_name"],
                is_foreign_customer:    company["is_foreign_customer"]
            )
            orderPrep = OrderPrep.where(user: created).first_or_initialize
            orderPrep.update!(
                brand: Brand.first
            )
        else  
            # password = generate_code(40)
            password = "password"   # test development
            user = User.create(
                email:                  company["company_email"],
                password:               password,
                password_confirmation:  password,
                company_id:             company["company_id"],
                company_name:           company["company_name"],
                surcharge_id:           company["surcharge_id"],
                surcharge_name:         company["surcharge_name"],
                is_foreign_customer:    company["is_foreign_customer"]
            )
            orderPrep = OrderPrep.where(user: user).first_or_initialize
            orderPrep.update!(
                brand: Brand.first
            )
        end
    end
end


response = HTTParty.get('https://dev.detaliutiekimas.lt/ords/dev/web/getAllOrders', :verify => false)

response["orders"].each do |order| 
    created = Order.where(id: order["ID"]).first_or_initialize
    created.update!(
        sid: order["SID"],
        client_id: order["CLIENT_ID"],
        client: order["CLIENT"],
        vehicle_brand: order["VEHICLE_BRAND"],
        vehicle_model: order["VEHICLE_MODEL"],
        vin: order["VIN"],
        status: order["STATUS"],
        creation_date: order["CREATION_DATE"],
        color: order["COLOR"],
        icon: order["ICON"],
        supplierlist: order["SUPPLIERLIST"],
        codelist: order["CODELIST"],
        dtcreation_date: order["DTCREATION_DATE"],
        sum_price_wo_tax_all: order["NSUM_PRICE_WO_TAX_ALL"],
        count_ordered_parts: order["NCOUNT_ORDERED_PARTS"],
        count_canceled_parts: order["NCOUNT_CANCELED_PARTS"],
        count_changed_price_parts: order["NCOUNT_CHANGED_PRICE_PARTS"]
    )
end

response = HTTParty.get('https://dev.detaliutiekimas.lt/ords/dev/web/getAllDetails', :verify => false)

response["details"].each do |detail| 
    created = Detail.where(id: detail["ID"]).first_or_initialize
    order = Order.find(detail["NORDER_ID"])

    created.update!(
        order_id: order.id,
        part_name: detail["PART_NAME"],
        part_code: detail["PART_CODE"],
        comment: detail["SCOMMENT"],
        kiekis: detail["KIEKIS"],
        qnt: detail["NQNT"],
        our_price: detail["NOUR_PRICE"],        
        supplier_id: detail["SUPPLIER_ID"],
        supplier: detail["SUPPLIER"],
        price_wo_tax_all: detail["PRICE_WO_TAX_ALL"],
        price_with_tax: detail["PRICE_WITH_TAX"],
        status: detail["SSTATUS"],
        status_id: detail["NSTATUS_ID"],
        inovice_count: detail["NINOVICE_COUNT"],
        woinovice_count: detail["NWOINOVICE_COUNT"],
        icon: detail["ICON"],
        qnt_confirmed: detail["NQNT_CONFIRMED"],
        onepart_price_with_tax: detail["NONEPART_PRICE_WITH_TAX"],
        qnt_packed: detail["NQNT_PACKED"]
    )
end
