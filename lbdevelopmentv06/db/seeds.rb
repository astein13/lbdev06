Community.delete_all

Community.create!(:name => 'Amherst College')
Community.create!(:name => 'University of Rochester')
Community.create!(:name => 'Macalester College')



Channel.delete_all
Channel.create!(:channel => 'Academics')
Channel.create!(:channel => 'Arts')
Channel.create!(:channel => 'Nightlife')
Channel.create!(:channel => 'Sports')
