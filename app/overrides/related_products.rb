Deface::Override.new(:virtual_path  => "spree/products/show",
                     :name          => "related_products_deface",
                     :insert_after  => "#product-description[data-hook]",
                     :partial       => "shared/related_products",
                     :disabled      => false)
