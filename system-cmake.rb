class SystemCmake < Formula
  desc "Cross-platform make: use cmake already installed on the system"
  homepage "http://www.cmake.org/"
  url "http://httpstat.us/200", :using => :nounzip
  sha256 "f9bafc82ba5f8fb02b25020d66f396860604f496ca919480147fa525cb505d88"
  version "0.3"

  conflicts_with "binary-cmake"  
  
  def install
    system "mkdir #{bin}"
    system "ln -s ```which ctest``` #{bin}/ctest"
    system "ln -s ```which cmake``` #{bin}/cmake"
    system "ln -s ```which ccmake``` #{bin}/ccmake"
    system "#{bin}/cmake", "--version"
  end

  test do
    (testpath/"CMakeLists.txt").write("find_package(Ruby)")
    system "#{bin}/cmake", "."
  end
end
