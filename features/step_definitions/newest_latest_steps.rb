Given /^a ([^ ]+) with the following attributes:$/ do |klass, attributes|
  klass = "NewestLatest::#{klass}".constantize
  @subject = klass.new do |object|
    attributes.hashes.each do |attr|
      object.send("#{attr[:key]}=".to_sym, attr[:value])
    end
  end
end

When /^I run "([^"]+)"$/ do |method|
  VCR.use_cassette "newest_latest" do
    @returned = @subject.send(method.to_sym)
  end
end

Then /^it should have the following attributes:$/ do |attributes|
  attributes.hashes.each do |attr|
    @subject.send(attr[:key].to_sym).should == attr[:value]
  end
end

Then /^it should return the following ([^ ]+)s:$/ do |klass, attributes|
	klass = "NewestLatest::#{klass}".constantize
	attributes.hashes.each_with_index do |hash, index|
		@returned[index].should be_an_instance_of klass
		hash.each do |key, value|
			@returned[index].send(key.to_sym).should == value
		end
	end
end
