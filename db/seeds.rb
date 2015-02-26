company = Company.create!
application = company.owned_applications.create!

company.administrators.create!
application.invited_users.create!