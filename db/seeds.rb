

User.create(name: "Louie")
User.create(name: "Sal")
User.create(name: "Byron")
User.create(name: "Charlotte")
User.create(name: "Dan")
User.create(name: "x1", password_digest: "x", email: "email@email.com")
User.create(name: "x2", password_digest: "xxx", email: "email1@email.com")
User.create(name: "x3", password_digest: "xxxx", email: "email2@email.com")
User.create(name: "x4", password_digest: "xxxxx", email: "email3@email.com")


Picture.create(name: "Picture1", user_id: 1)
Picture.create(name: "Picture2", user_id: 2)
Picture.create(name: "Picture3", user_id: 3)
Picture.create(name: "Picture4", user_id: 4)
Picture.create(name: "Picture5", user_id: 5)
