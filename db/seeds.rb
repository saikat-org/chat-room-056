johnny = User.create email: "johnny@account.com", first_name: 'johnny', last_name: 'depp', encrypted_password: '123'
saikat = User.create email: "saikat@account.com", first_name: 'saikat', last_name: 'sarkar', encrypted_password: '123'
sumit  = User.create email: "sumit@account.com", first_name: 'sumit', last_name: 'sarkar', encrypted_password: '123'

Message.create title: "This is a message from John",   user: johnny
Message.create title: "This is a message from Saikat", user: saikat
Message.create title: "This is a message from Sumit",  user: sumit

