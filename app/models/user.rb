class User < ApplicationRecord
  # def self.to_csv(collection)
  #   CSV.generate(col_sep: ',') do|csv|
  #     csv << column_names
  #     collection.find_each do |record|
  #       csv << record.attributes.values
  #     end
  #   end
  # end



  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable

  class User < ActiveRecord::Base
    after_create :assign_default_role

    def assign_default_role
      self.add_role(:newuser) if self.roles.blank?
    end
  end
end
