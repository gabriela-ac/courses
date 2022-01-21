module ControllerHelpers
  def sign_in(member)
    if member.nil?
      allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => :member})
      allow(controller).to receive(:current_member).and_return(nil)
    else
      allow(request.env['warden']).to receive(:authenticate!).and_return(member)
      allow(controller).to receive(:current_member).and_return(member)
    end
  end
end
