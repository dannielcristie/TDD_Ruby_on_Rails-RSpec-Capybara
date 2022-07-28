describe "matcher output" do
  it { expect { puts "Danniel" }.to output.to_stdout }
  it { expect { puts "Danniel" }.to output("Danniel\n").to_stdout }
  it { expect { puts "Danniel" }.to output(/Danniel/).to_stdout }

  it { expect { warn "Danniel" }.to output.to_stderr }
  it { expect { warn "Danniel" }.to output("Danniel\n").to_stderr }
  it { expect { warn "Danniel" }.to output(/Danniel/).to_stderr }
end
