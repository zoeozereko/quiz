class Request < ActiveRecord::Base

  validates :name, :email, presence: true

  default_scope { order('done DESC') }

  def self.search(search)
    where('name ILIKE ? OR email ILIKE ? OR message ILIKE ?', "%#{search}%", 
      "%#{search}%", "%#{search}%")
  end

end
