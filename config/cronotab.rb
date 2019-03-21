# cronotab.rb — Crono configuration file
#
# Here you can specify periodic jobs and schedule.
# You can use ActiveJob's jobs from `app/jobs/`
# You can use any class. The only requirement is that
# class should have a method `perform` without arguments.
#
# class TestJob
#   def perform
#     puts 'Test!'
#   end
# end
#
# Crono.perform(TestJob).every 2.days, at: '15:30'
#
Rails.app_class.load_tasks

class Pcbartest
	def initialize(ip_start,ip_num,name)
		@ip_start = ip_start
		@ip_num = ip_num
		@all_ip =Hash.new
		@name = name
	end
	def pc_open?(pc_ip)
		pc_in_use = Net::Ping::External.new(pc_ip)
		pc_in_use.ping
	end
	def pc_all_open
		puts "#{@name} link now\n"
		@ip_num.to_i.times do |n|
			@all_ip[@ip_start +"#{11+n}"] = pc_open?(@ip_start +"#{11+n}")
			printf "\r%s",(n*100 / @ip_num.to_i+2).to_s+'%'+'='*(n*30 / @ip_num.to_i)+'>'
		end
		pcbar_status
	end
	def pcbar_status
		return "\nThere are #{pc_open_num} pcs open of all #{@all_ip.size} pc."
	end
	def pc_open_num
		pc_all_open_num = @all_ip.select {|k,v| v ==true}
		pc_all_open_num.size
	end
end

class Guestpcping
  def perform
  	isens = Pcbartest.new("218.232.161.","68","isens") 
  	record = Decrecord.new(time: Time.now.to_s,pc_num: isens.pc_all_open)
  	record.save
  end
end

Crono.perform(Guestpcping).every 300.seconds