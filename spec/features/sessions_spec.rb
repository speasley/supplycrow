require "rails_helper"

feature "Sessions", type: :feature do
  subject { LoginPage.new }
  let(:user) { create(:user, password: "password") }

  context "credentials are correct" do
    it "takes you to your dashboard" do
      subject.visit_page
      subject.login_with(user.username, "password")
      expect(current_path).to eql(dashboard_path)
    end
  end
end
