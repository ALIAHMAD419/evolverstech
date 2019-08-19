module ControllerMacros

  def login_clerk
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:clerk]
      clerk = Clerk.find_or_initialize_by(email: 'abc20@clerk.com')
      clerk.password = '111111'
      clerk.name ='ali mughal'
      clerk.age = '25'
      clerk.time = Time.now + 2
      clerk.save
      sign_in clerk
    end
  end

  def login_doctor
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:doctor]
      doctor = doctor.find_or_initialize_by(email:'abc20@doctor.com')
      doctor.password = '111111'
      doctor.save
      sign_in doctor
      doctor
    end
  end
  
  def login_patient
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:patient]
      patient = patient.find_or_initialize_by(email: 'abc20@patient.com')
      patient.password = '111111'
      patient.save
      sign_in patient
      patient
    end
  end
end
