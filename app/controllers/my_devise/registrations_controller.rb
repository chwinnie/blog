class MyDevise::RegistrationsController < Devise::RegistrationsController

	def create
		super
		if resource.save
		end
	end