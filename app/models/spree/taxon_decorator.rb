Spree::Taxon.class_eval do
  # Load user defined paperclip settings
  if Spree::Config[:use_s3]
    s3_creds = { :access_key_id => Spree::Config[:s3_access_key], :secret_access_key => Spree::Config[:s3_secret], :bucket => Spree::Config[:s3_bucket] }
    Spree::Taxon.attachment_definitions[:icon][:storage] = :s3
    Spree::Taxon.attachment_definitions[:icon][:s3_credentials] = s3_creds
    Spree::Taxon.attachment_definitions[:icon][:s3_headers] = ActiveSupport::JSON.decode(Spree::Config[:s3_headers])
    Spree::Taxon.attachment_definitions[:icon][:bucket] = Spree::Config[:s3_bucket]
    Spree::Taxon.attachment_definitions[:icon][:path] = "/:class/:id/:style/:basename.:extension"
  end
end