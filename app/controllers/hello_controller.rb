class HelloController < ApplicationController
  def index
	@message = 'Hello!'
	@extra = 'I am the hello controller! '
	@count = 2
  end

 # protect_from_forgery with: :exception
def hello
	render html: "hello, world!"
end

end
