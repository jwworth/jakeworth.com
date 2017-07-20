# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'jake@jakeworth.com'
  layout 'mailer'
end
