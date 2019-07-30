class Doctor
  attr_reader :doctor_name, :specialty,

  def initialize(attr)
    @user_name = attr.fetch(:doctor_name)
    @specialty = attr.fetch(:specialty)
    @id = attr.fetch(:id)
  end
  def self.all
    returned_doctors = DB.exec("SELECT * FROM doctors;")
    doctors = []
    returned_doctors.each do |doctor|
      name = doctor.fetch("name")
      id = doctor.fetch("id").to_i
      doctors.push(Doctor.new({:name => name, :id => id}))
    end
    doctors
  end
end
