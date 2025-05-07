#!/usr/bin/perl
use strict;
use warnings;
#!/usr/bin/perl
use strict;
use warnings;
BEGIN {
  unshift @INC, "/usr/lib64/perl5/";
}
# first, create your message
use email::mime;
my $message = Email::MIME->create(
  header_str => [
    From    => 'you@example.com',
    To      => 'friend@example.com',
    Subject => 'Happy birthday!',
  ],
  attributes => {
    encoding => 'quoted-printable',
    charset  => 'ISO-8859-1',
  },
  body_str => "Happy birthday to you!\n",
);

# send the message
use Email::Sender::Simple qw(sendmail);
sendmail($message);
