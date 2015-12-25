class @User
  constructor: (name, email, password) ->
    @name = name.trim()
    @email = email.trim()
    @password = password.trim()
    @error_message = ""
  validName: ->
    if @name == ''
      @error_message = "User name is empty"
      return false
    else if @name.length < 3
      @error_message = "User name too sort"
      return false
    else if @name.length > 16
      @error_message = "User name too long"
      return false
    else
      unless /^[a-zA-Z0-9_-]{3,16}$/.test(@name)
        @error_message = "Invalid User Name"
        return false
    @error_message = ""
    true
  validEmail: ->
    if @email == ''
      @error_message = "Email is empty"
      return false
    else if @email.length > 50
      @error_message = "Email is too long"
      return false
    else
      unless /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i.test(@email)
        @error_message = "Invalid Email"
        return false
    @error_message = ""
    true
  validPassword: ->
    if @password == ''
      @error_message = "Password is empty"
      return false
    else if @password.length < 6
      @error_message = "Password too sort"
      return false
    else if @password.length > 16
      @error_message = "Password too long"
      return false
    else
      unless /^([a-zA-Z0-9@*#]{6,15})$/.test(@password)
        @error_message = "Invalid Password"
        return false
    @error_message = ""
    true

$.fn.validateName = ->
  @each ->
    $(this).blur ->
      user = new User(@value, "", "", "")
      if !user.validName()
        $(this).next('.error').text(user.error_message)
        $(this).addClass('error_form')
      else
        $(this).next('.error').text('')
        $(this).removeClass('error_form')

$.fn.validateEmail = ->
  @each ->
    $(this).blur ->
      user = new User("", @value, "")
      if !user.validEmail()
        $(this).next('.error').text(user.error_message)
        $(this).addClass('error_form')
      else
        $(this).next('.error').text('')
        $(this).removeClass('error_form')

$.fn.validatePassword = ->
  @each ->
    $(this).blur ->
      user = new User("", "", @value)
      if !user.validPassword()
        $(this).next('.error').text(user.error_message)
        $(this).addClass('error_form')
      else
        $(this).next('.error').text('')
        $(this).removeClass('error_form')

$.fn.validateConfirmPassword = (password)->
  @each ->
    $(this).blur ->
      user = new User("", "", @value)
      if !user.validPassword()
        $(this).next('.error').text("Invalid Length Password")
        $(this).addClass('error_form')
      else
        if @value != password
          $(this).next('.error').text("Password not match")
          $(this).addClass('error_form')
        else
          $(this).next('.error').text("")
          $(this).removeClass('error_form')

jQuery ->
  $('#user_name').validateName()
  $('#user_email').validateEmail()
  $('#user_password').validatePassword()
  $('#user_password_confirmation').validateConfirmPassword($('#user_password'))