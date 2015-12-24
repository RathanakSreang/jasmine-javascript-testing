class @User
  constructor: (name, email, password) ->
    @name = name.trim()
    @email = email.trim()
    @password = password.trim()
  validName: ->
    /^[a-z0-9_-]{3,16}$/.test(@name)
  validEmail: ->
    /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i.test(@email)
  validPassword: ->
    #/^([a-zA-Z0-9@*#]{6,15})$/.test(@password)
    true
  validUser: ->
    @validName() && @validEmail() && @validPassword()


