class Doctor
  attr_reader :doctor_name, :specialty,

  def initialize(attr)
    @user_name = attr.fetch(:doctor_name)
    @specialty = attr.fetch(:specialty)
  end

end
