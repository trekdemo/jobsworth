# encoding: UTF-8
class EmailAddress < ActiveRecord::Base
  belongs_to :user
  has_many :email_deliveries
  has_many :work_logs
  has_and_belongs_to_many :abstract_tasks, :join_table=>'email_address_tasks', :association_foreign_key=>'task_id'
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  
  def username_or_email
    user ? user.name : self.email 
  end
end

# == Schema Information
#
# Table name: email_addresses
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  email      :string(255)
#  default    :boolean(1)
#  created_at :datetime
#  updated_at :datetime
#

