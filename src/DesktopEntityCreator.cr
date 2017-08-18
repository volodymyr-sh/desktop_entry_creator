require "./DesktopEntityCreator/*"

module DesktopEntityCreator
  def self.run
    Cli.check_arguments

    executable_name = Cli.first_argument
    filename = CliFieldsReader.read_filename
    values = CliFieldsReader.read_values

    exit if filename.nil?

    writing_response = write_file(
      filename,
      generate_file_content(values, executable_name)
    )
    log(writing_response)
  end

  def self.generate_file_content(values, executable_name)
    desktop_file = DesktopFile.new(values)
    desktop_file.add_field(DesktopFile::Fields::EXEC, executable_name)
    desktop_file.to_s
  end

  def self.write_file(filename, content)
     FileWriter
       .new
       .write_desktop_file(
          filename,
          content
        )
  end

  def self.log(writing_response)
    puts "File writen in #{writing_response.filepath}"
  end
end

DesktopEntityCreator.run
