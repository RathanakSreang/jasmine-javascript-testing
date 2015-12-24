describe "User", ->
  user = null
  beforeEach ->
    user = new User(" RathanakJame ", " rathanak@email.com ", " 1234567890 ")
  it "should trim out spacing for name,email and password", ->
    expect(user.name).toBe("RathanakJame")
    expect(user.email).toBe("rathanak@email.com")
    expect(user.password).toBe("1234567890")

  describe "Name", ->
    it "should not empty", ->
      user.name = ""
      expect(user.validName()).not.toBe true

    it "should be able to use number", ->
      user.name = "name1234"
      expect(user.validName()).toBeTruthy()

    it "should not has space or other symbol", ->
      user.name = "name space"
      expect(user.validName()).not.toBeTruthy()
      user.name = "name@space"
      expect(user.validName()).not.toBeTruthy()
      user.name = "name%^space"
      expect(user.validName()).not.toBeTruthy()

    it "should has min length 3", ->
      user.name = "as"
      expect(user.validName()).not.toBeTruthy()
      user.name = "goodname"
      expect(user.validName()).toBeTruthy()

    it "should has max length 16", ->
      user.name = "thelongestnameever"
      expect(user.validName()).not.toBeTruthy()
      user.name = "goodname"
      expect(user.validName()).not.toBeFalsy()

  describe "Email", ->
    it "should not empty", ->
      user.email = ""
      expect(user.validEmail()).not.toBeTruthy()
      expect(user.validUser()).toBeFalsy()

    it "should has correct email format", ->
      user.email = "email@email.com"
      expect(user.validEmail()).toBeTruthy()
    it "should accept Upcase letter", ->
      user.name = "EMAIL@email.com"
      expect(user.validEmail()).toBeTruthy()

    it "should not has other symbol", ->
      user.email = "e#ma&il@email.com"
      expect(user.validEmail()).toBeFalsy()

  #describe "Password", ->
  #  it "should not empty", ->
  #    user.password = ""
  #    expect(user.validPassword()).not.toBeTruthy()
  #    expect(user.validUser()).toBeFalsy()
  #  it "should has min length 6", ->
  #    user.password = "12345"
  #    expect(user.validName()).not.toBeTruthy()
  #    expect(user.validUser()).toBeFalsy()
  #    user.password = "1234567"
  #    expect(user.validName()).not.toBeTruthy()
  #    expect(user.validUser()).toBeFalsy()
