desc 'Create user into database'
task :create_user, %i[name email password] => :environment do |_t, args|
  user = User.new(
    name: args[:name],
    email: args[:email],
    password: Digest::MD5.hexdigest(args[:password])
  )
  begin
    user.save
    puts 'User created successfully.'
  rescue StandardError => e
    puts "Error: #{e}"
  end
end
