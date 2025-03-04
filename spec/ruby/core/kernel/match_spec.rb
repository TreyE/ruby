require_relative '../../spec_helper'

ruby_version_is ''...'3.2' do
  describe "Kernel#=~" do
    it "returns nil matching any object" do
      o = Object.new

      suppress_warning do
        (o =~ /Object/).should   be_nil
        (o =~ 'Object').should   be_nil
        (o =~ Object).should     be_nil
        (o =~ Object.new).should be_nil
        (o =~ nil).should        be_nil
        (o =~ true).should       be_nil
      end
    end

    it "is deprecated" do
      -> do
        Object.new =~ /regexp/
      end.should complain(/deprecated Object#=~ is called on Object/, verbose: true)
    end
  end
end
