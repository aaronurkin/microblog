users = []
PASSWORD = "123456"

10.times.each do |i|
    user_number = i + 1

    user = User.create({
        password: PASSWORD,
        password_confirmation: PASSWORD,
        nickname: "#{user_number}_nickname",
        email: "test#{user_number}@test.mail",
        full_name: "#{user_number}_first_name #{user_number}_last_name"
    })
    users.append(user)
end