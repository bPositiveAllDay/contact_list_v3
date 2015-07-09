require 'pg'
require 'active_record'
 
ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'contacts',
  username: 'development',
  password: 'development',
  host: 'localhost',
  port: 5432,
  pool: 5,
  encoding: 'unicode',
  min_messages: 'error'
)

class Contact < ActiveRecord::Base

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, length: {minimum: 5}

 
  def to_s
    "#{id} #{firstname} #{lastname} #{email}"
  end

end

class Application 

  def display
    puts "Here is a list of available commands:
      new  - Create a new contact
      list - List all contacts
      show - Show a contact
      find - Find a contact"
  end

  def new_contact
    print "Enter first name : "
    firstname = STDIN.gets.chomp
    print "Enter last name  : "
    lastname= STDIN.gets.chomp
    print "Enter email      : "
    email = STDIN.gets.chomp
    Contact.create(firstname: firstname, lastname: lastname, email: email)
  end

  def enter_selection
    choice = STDIN.gets.chomp.to_s.split(' ')
    puts case choice[0]
         when "new" then new_contact
         when "list" then Contact.all
         when "show" then Contact.show
         when "find" then Contact.find(choice[1].to_i)
         end 
  end

end

app = Application.new

app.display
app.enter_selection

