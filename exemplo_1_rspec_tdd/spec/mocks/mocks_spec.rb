require "student"
require "course"

describe "Mocks" do
  it "bar" do
    # fase setup
    student = Student.new

    #fase  verify
    expect(student).to receive(:bar)

    #fase exercise
    student.bar
  end
end
