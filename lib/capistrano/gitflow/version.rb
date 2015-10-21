module  CapistranoGitFlow # Returns the version of the currently loaded Rails as a <tt>Gem::Version</tt>
  def self.gem_version
    Gem::Version.new CapistranoGitFlow::VERSION::STRING
  end

  module VERSION
    MAJOR = 1
    MINOR = 5
    TINY = 2
    PRE = nil

    STRING = [MAJOR, MINOR, TINY, PRE].compact.join('.')
  end
end