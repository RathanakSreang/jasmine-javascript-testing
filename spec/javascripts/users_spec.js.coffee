describe "User class", ->
  user = null
  beforeEach ->
    user = new User(" RathanakJame ", " rathanak@email.com ", " 1234567890 ")
  it "should trim out spacing for name,email and password", ->
    expect(user.name).toBe("RathanakJame")
    expect(user.email).toBe("rathanak@email.com")
    expect(user.password).toBe("1234567890")
    expect(user.error_message).toBe("")

  describe "Name", ->
    it "should not empty", ->
      user.name = ""
      expect(user.validName()).not.toBe true
      expect(user.error_message).toEqual("User name is empty")

    it "should be able to use number", ->
      user.name = "name1234"
      expect(user.validName()).toBeTruthy()
      expect(user.error_message).toEqual("")

    it "should not has space or other symbol", ->
      user.name = "name space"
      expect(user.validName()).not.toBeTruthy()
      user.name = "name@space"
      expect(user.validName()).not.toBeTruthy()
      user.name = "name%^space"
      expect(user.validName()).not.toBeTruthy()
      expect(user.error_message).toEqual("Invalid User Name")

    it "should has min length 3", ->
      user.name = "as"
      expect(user.validName()).not.toBeTruthy()
      expect(user.error_message).toEqual("User name too sort")

    it "should has max length 16", ->
      user.name = "thelongestnameever"
      expect(user.validName()).not.toBeTruthy()
      expect(user.error_message).toEqual("User name too long")

  describe "Email", ->
    it "should not empty", ->
      user.email = ""
      expect(user.validEmail()).not.toBeTruthy()
      expect(user.error_message).toContain("Email is empty")

    it "should has correct email format", ->
      user.email = "email@email.com"
      expect(user.validEmail()).toBeTruthy()
      expect(user.error_message).toContain("")

    it "should accept Upcase letter", ->
      user.name = "EMAIL@email.com"
      expect(user.validEmail()).toBeTruthy()
      expect(user.error_message).toContain("")

    it "should not has other symbol", ->
      user.email = "e#ma&il@email.com"
      expect(user.validEmail()).toBeFalsy()
      expect(user.error_message).toContain("Invalid ")

    it "should has max length 50", ->
       user.email = "longestemaileverinthewhichmakeinvalidemail@email.com"
       expect(user.validEmail()).not.toBeTruthy()
       expect(user.error_message).toContain("too long")

  describe "Password", ->
    it "should not empty", ->
      user.password = ""
      expect(user.validPassword()).not.toBeTruthy()
      expect(user.error_message).toBe("Password is empty")

    it "should has min length 6", ->
      user.password = "12345"
      expect(user.validPassword()).not.toBeTruthy()
      expect(user.error_message).toBe("Password too sort")

    it "should has max length 15", ->
       user.password = "password1234578901234567"
       expect(user.validPassword()).not.toBeTruthy()
       expect(user.error_message).toBe("Password too long")

    it "should has correct length", ->
       user.password = "p@ssw0rd"
       expect(user.validPassword()).toBeTruthy()
       expect(user.error_message).toBe("")

describe "Login Form", ->
  beforeEach ->
    loadFixtures "login"

  describe "Email", ->
    it "invalid when user email empty", ->
      email_field = $('#session_email')
      email_field.validateEmail()
      email_field.val('')
      email_field.blur()
      expect(email_field.next('.error')).toHaveText("Email is empty")
      email_field.val('email@email.com')
      email_field.blur()
      expect(email_field.next('.error')).toHaveText("")

    it "invalid when user email is incorrect format", ->
      email_field = $('#session_email')
      email_field.validateEmail()
      email_field.val('email@email')
      email_field.blur()
      expect(email_field.next('.error')).toHaveText("Invalid Email")

    it "invalid when user email is too long", ->
      email_field = $('#session_email')
      email_field.validateEmail()
      email_field.val('longestemaileverinthewhichmakeinvalidemail@email.com')
      email_field.blur()
      expect(email_field.next('.error')).toHaveText("Email is too long")

    it "valid when user email is correct format", ->
      email_field = $('#session_email')
      email_field.validateEmail()
      email_field.val('email@email.com')
      email_field.blur()
      expect(email_field.next('.error')).toHaveText("")

describe "SignUp Form", ->
  beforeEach ->
    loadFixtures "signup"
  describe "Name", ->
    it "invalid when user name empty", ->
      name_field = $('#user_name')
      name_field.validateName()
      name_field.val('')
      name_field.blur()
      expect(name_field.next('.error')).toHaveText("User name is empty")

    it "invalid when user name is incorect format", ->
      name_field = $('#user_name')
      name_field.validateName()
      name_field.val('name of user')
      name_field.blur()
      expect(name_field.next('.error')).toHaveText("Invalid User Name")

    it "invalid when user name is too sort", ->
      name_field = $('#user_name')
      name_field.validateName()
      name_field.val('na')
      name_field.blur()
      expect(name_field.next('.error')).toHaveText("User name too sort")

    it "invalid when user name is too long", ->
      name_field = $('#user_name')
      name_field.validateName()
      name_field.val('thelongestnameinthehistory')
      name_field.blur()
      expect(name_field.next('.error')).toHaveText("User name too long")
    it "valid when user name is in correct format", ->
      name_field = $('#user_name')
      name_field.validateName()
      name_field.val('rathanakjame')
      name_field.blur()
      expect(name_field.next('.error')).toHaveText("")

  describe "Email", ->
    it "invalid when user email empty", ->
      email_field = $('#user_email')
      email_field.validateEmail()
      email_field.val('')
      email_field.blur()
      expect(email_field.next('.error')).toHaveText("Email is empty")

    it "invalid when user email is incorrect format", ->
      email_field = $('#user_email')
      email_field.validateEmail()
      email_field.val('email@email')
      email_field.blur()
      expect(email_field.next('.error')).toHaveText("Invalid Email")

    it "invalid when user email is too long", ->
      email_field = $('#user_email')
      email_field.validateEmail()
      email_field.val('longestemaileverinthewhichmakeinvalidemail@email.com')
      email_field.blur()
      expect(email_field.next('.error')).toHaveText("Email is too long")

    it "valid when user email is correct format", ->
      email_field = $('#user_email')
      email_field.validateEmail()
      email_field.val('email@email.com')
      email_field.blur()
      expect(email_field.next('.error')).toHaveText("")

  describe "Password", ->
    it "invalid when user password empty", ->
      password_field = $('#user_password')
      password_field.validatePassword()
      password_field.val('')
      password_field.blur()
      expect(password_field.next('.error')).toHaveText("Password is empty")

    it "invalid when user password is sort than 6", ->
      password_field = $('#user_password')
      password_field.validatePassword()
      password_field.val('pass')
      password_field.blur()
      expect(password_field.next('.error')).toHaveText("Password too sort")

    it "invalid when user name is too long", ->
      password_field = $('#user_password')
      password_field.validatePassword()
      password_field.val('thelongestpasswordinthehistory')
      password_field.blur()
      expect(password_field.next('.error')).toHaveText("Password too long")