class FileWriter
  STORAGE_PATH = "~/.local/share/applications/"
  FILE_EXTENSION = "desktop"
  FILE_PERMISIONS = 0o754

  struct Response
    property filename : String, filepath : String

    def initialize(@filename, @filepath); end;
  end

  def write_desktop_file(filename, content) : Response
    filepath = build_path(filename)
    file = File.new(filepath, "w")

    file.print(content)
    file.close

    File.chmod(filepath, FILE_PERMISIONS)

    Response.new(filename, filepath)
  end

  private def build_path(filename) : String
    File.expand_path(
      "#{STORAGE_PATH}#{filename}.#{FILE_EXTENSION}"
    )
  end
end
