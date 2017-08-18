module CliFieldsReader
  def self.read_filename
    filename = Cli.ask("Provide filename: ")
  end

  def self.read_values
    Cli.ask(
      ->(key : String) { "Provide a key for #{key}: " },
      DesktopFile.fields.except(DesktopFile::Fields::EXEC)
    )
  end
end
