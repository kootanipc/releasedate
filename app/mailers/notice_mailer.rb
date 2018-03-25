class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_releasedate.subject
  #
  def sendmail_releasedate(release)
    @release = release

    mail to: "k-ootani@nttpc.co.jp",
         subject: '商品が登録されました'
  end
end
