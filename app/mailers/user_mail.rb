class UserMail < ApplicationMailer

	def support_notice user, support_user, itemlist
		@itemlist = itemlist
		@user = user
		@support_user = support_user
		mail 	from: 'no-reply@ifnill.com',
				to: user.email,
				subject: 'ifnill - ifer'+user.name+'님, ifocket 후원신청 소식을 알려드립니다!'
	end

end
