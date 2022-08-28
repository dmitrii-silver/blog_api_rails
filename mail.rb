require 'mailjet'
Mailjet.configure do |config|
config.api_key = '71c947df6bea94546bddae05ec636cc4'
config.secret_key = '6ff69f3b50b3262e4cfed6e4185d78a3'
config.api_version = "v3.1"
end
variable = Mailjet::Send.create(messages: [{
  'From'=> {
    'Email'=> 'dmitrii.serebriakov@hotmail.com',
    'Name'=> 'Dmitrii'
  },
  'To'=> [
    {
      'Email'=> 'dmitrii.serebriakov@hotmail.com',
      'Name'=> 'Dmitrii'
    }
  ],
  'Subject'=> 'Greetings from Mailjet.',
  'TextPart'=> 'My first Mailjet email',
  'HTMLPart'=> '<h3>Dear passenger 1, welcome to <a href=\'https://www.mailjet.com/\'>Mailjet</a>!</h3><br />May the delivery force be with you!',
  'CustomID' => 'AppGettingStartedTest'
}]
)
p variable.attributes['Messages']
