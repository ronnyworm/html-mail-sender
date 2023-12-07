#!/usr/bin/env ruby
# encoding: utf-8

require 'mail'
require_relative 'credentials'

if ARGV.size == 0
  puts "Please supply these arguments in order:"
  puts "- target email address"
  puts "- subject"
  puts "- html-file to send"
  exit 1
end

target_mail = ARGV[0]
the_subject = ARGV[1]
mailfile = ARGV[2]

if !File.exist? mailfile
  puts "mailfile #{mailfile} does not exist"
  exit 1
end

cr = Credentials.new
if cr.smtp_host == 'smtp host'
  puts "modify the credentials file to your needs first"
  exit 1
end

options = { :address              => cr.smtp_host,
            :port                 => cr.smtp_port,
            :user_name            => cr.smtp_user,
            :password             => cr.smtp_pass
          }.merge(cr.auth_options)

Mail.defaults do
  delivery_method :smtp, options
end

Mail.deliver do
  to target_mail
  from "#{cr.name} <#{cr.smtp_user}>"
  subject the_subject
  html_part do
    content_type 'text/html; charset=UTF-8'
    body File.read(mailfile)
  end
end

# add this bcc instruction to under the from... if you want the sender to have the email in his inbox as well
# bcc cr.smtp_user

# to add attachments, just add this line to the Mail.deliver block
# add_file FILENAME
