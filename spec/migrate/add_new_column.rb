#
#  Copyright (c) 2011, SoundCloud Ltd., Rany Keddo, Tobias Bielohlawek
#

class AddNewColumn < LargeHadronMigration
  def self.up
    perform(true)
  end

  def self.perform(finalize = true)
    large_hadron_migrate "addscolumn", :chunk_size => 100, :wait => 0, :finalize => finalize do |table_name|
      execute %Q{
        alter table %s add column spam tinyint(1)
      } % table_name
    end
  end
end
