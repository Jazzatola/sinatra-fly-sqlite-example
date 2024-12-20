require "dotenv/tasks"
require "sequel/core"

namespace :db do

  desc "Migrate the database"
  task :migrate, [:version] => :dotenv do |t, args|
    version = args[:version] ? Integer(args[:version]) : nil
    migrate(version)
    puts "Migration complete"
  end

  desc "Undo all migrations and migrate again"
  task :remigrate => :dotenv do
    migrate(0)
    migrate
    puts "Remigration complete"
  end

  def migrate(version = nil)
    Sequel.extension :migration
    connection = Sequel.connect(url)
    Sequel::Migrator.apply(connection, "db/migrations", version)
  end

  def url
    ENV.fetch("DATABASE_URL")
  end

end