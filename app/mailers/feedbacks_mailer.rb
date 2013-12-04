# -*- encoding : utf-8 -*-
class FeedbacksMailer < ActionMailer::Base
  default from: 'info@sweetmix.su',
          to: SiteSetting.value_of('manager_email')

  def call_me(name, tel)
    @call_asker = { name: name, tel: tel }
    mail subject: 'Просьба позвонить от посетителя SweetMix'
  end

  def feedback(formus)
    @formus = formus
    mail subject: 'Комментарий со страницы контактов SweetMix'
  end
end