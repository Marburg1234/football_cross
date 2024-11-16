# ユーザーを登録1
unless User.find_by(nickname: '11')
  User.create!(nickname: '11') do |user|
      user.email = '1@yahoo.co.jp'
      user.password = '111111'
  end
end

# ユーザーを登録2
unless User.find_by(nickname: '22')
  User.create!(nickname: '22') do |user|
      user.email = '2@yahoo.co.jp'
      user.password = '222222'
  end
end

# ユーザーを登録3
unless User.find_by(nickname: '33')
  User.create!(nickname: '33') do |user|
      user.email = '3@yahoo.co.jp'
      user.password = '333333'
  end
end



