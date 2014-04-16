class Parse < ActiveRecord::Base

  #empty table and reseed
  def self.remove_users
    sql = "TRUNCATE parses RESTART IDENTITY"
    result = ActiveRecord::Base.connection.execute(sql)
  end

  # TODO... revist the actual parsing.. use renewable_funding example
  def self.do_file_parse()
    f = File.open("tmp_data_dump/PAYLEASE_VALIDATION0122140253.txt", "r")
    a = f.readlines
    a.each do |b|
      c = b.split(/\n/).each do |x|
        y = x.split
        if User.where(user_id: y[1].scan(/\d+/).first).exists?
          puts "found match" + y[1].scan(/\d+/).first
          user = User.find_by user_id: y[1].scan(/\d+/).first
          user.first_name = y[3].downcase.tr! '"',''
          user.last_name = y[4].downcase.tr! '"',''
          user.email = "test@test.com"
          user.address = y[5] + " " + y[6]
          user.save
        else
          puts "do insert"
          puts y[1].scan(/\d+/).first
          userRecord = User.new do |u|
            u.email = 'test' + y[1].scan(/\d+/).first + '@test.com'
            u.first_name = y[3].downcase.tr! '"',''
            u.last_name = y[4].downcase.tr! '"',''
            u.password = 'testtest123'
            u.address = y[5] + " " + y[6]
            u.user_id = y[1].scan(/\d+/).first
            u.sign_in_count = 0
            u.encrypted_password = 'testtest123'
          end
          userRecord.save
          puts userRecord.errors.inspect
        end
      end
    end
  end
end
