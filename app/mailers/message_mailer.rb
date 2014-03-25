class MessageMailer < ActionMailer::Base
  default to: Proc.new { AdminUser.pluck(:email) }

  def contact_form(message)
    @message = message
    _from_address = "Boutique de Carnes <contacto@boutiquedecarnes.com.uy>"
    mail(from: _from_address, subject: 'Contacto desde sitio web, Boutique de Carnes')
  end

  def new_purchase_notifier(message)
    @message = message
    _from_address = "Boutique de Carnes <compras@boutiquedecarnes.com.uy>"
    mail(from: _from_address, subject: 'Nueva compra desde sitio web, Boutique de Carnes')
  end

end
