class DesktopFile
  module Fields
    VERSION = "Version"
    TYPE = "Type"
    NAME = "Name"
    EXEC = "Exec"
    ICON = "Icon"
    CATEGORIES = "Categories"
    TERMINAL = "TERMINAL"
    STARTUP_NOTIFY = "StartupNotify"
    STARTUP_WM_CLASS = "StartupWmClass"

    KEYS = [
      VERSION,
      TYPE,
      NAME,
      EXEC,
      ICON,
      CATEGORIES,
      TERMINAL,
      STARTUP_NOTIFY,
      STARTUP_WM_CLASS
    ]
  end

  def self.fields
    Fields::KEYS
  end

  def initialize(@fields = {} of String => String); end

  def add_field(key, value)
    @fields[key] = value
  end

  def to_s
    content = build_header
    content += build_rows(@fields)
  end

  private def build_rows(fields)
    fields
      .map { |name, value|
        value.size > 0 ? build_row(name, value) : nil
       }
       .compact
      .join('\n')
  end

  private def build_header
    "[Desktop Entry]\n"
  end

  private def build_row(name, value)
    "#{name}=#{value}"
  end
end
