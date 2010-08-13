class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.validate_email_field = true
  end
  
  has_one :portfolio
  after_save :create_portfolio_for_user
  named_scope :with_role, 
              lambda { |role| { :conditions => "roles_mask & #{2**ROLES.index(role.to_s)} > 0"} }
  
  # when adding roles, make sure to add them to the end sp as not to upset
  # the current bitwise indexing!
  ROLES = %w[admin book rent_out]
  
  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end
  
  def roles
    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
  end
  
  def is_owner?
    self.roles.include?('rent_out')
  end
  
  private
  
  def create_portfolio_for_user
    self.create_portfolio if self.is_owner? && portfolio.nil?
  end
end
