class ApplicationMailer < ActionMailer::Base
  default from: "rachidi29@gmail.com"

  def product_added(product)
    @product = product
    mail(to: 'daniel@spoonfull.io', subject: 'Sample Email')
  end
end
