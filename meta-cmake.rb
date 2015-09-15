class MetaCmake < Formula
  desc "Cross-platform make: install cmake: use system, install from binary, or source"
  homepage "http://www.cmake.org/"
  url "http://httpstat.us/200", :using => :nounzip
  sha256 "f9bafc82ba5f8fb02b25020d66f396860604f496ca919480147fa525cb505d88"
  version "0.1"

  if Formula["system-cmake"].installed?
    depends_on "system-cmake"
  elsif Formula["binary-cmake"].installed?
    depends_on "binary-cmake"
  else
    depends_on "system-cmake" => :optional
    depends_on "cmake" => :optional
  
    if (not build.with? "cmake") and (not build.with? "system-cmake")
      depends_on "binary-cmake"
    end
  end
  
  
  def install
    system "cmake", "--version"
  end
end
