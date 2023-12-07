# HTML Mail Sender
Easy script to send html emails

## first
go to credentials.rb and insert your smtp credentials

## mail-template-example.html
If you don't have your own template, you can start with this one.

When you modify it, remember this:

You might want to remove this line entirely or change it in `mail-template-example.html`

	<title>Betreff</title>

Also to have your custom email template, scroll to the bottom in the file and adjust everything you need including facebook and instagram links.


## example call
	./send_mail.rb target@example.com "my subject" mail-template-example.html
