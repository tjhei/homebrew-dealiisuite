class Cmake < Formula
  desc "Cross-platform make"
  homepage "http://www.cmake.org/"
  url "http://httpstat.us/200", :using => :nounzip
  #sha256 "03b1b1f6caac25d66d4b4424ddc793e72f83d8c85ae95688c10e208a4b7f306e"
  version "0.3"

  def install
    system "mkdir #{bin}"
    system "ln -s ```which ctest``` #{bin}/ctest"
    system "ln -s ```which cmake``` #{bin}/cmake"
    system "ln -s ```which ccmake``` #{bin}/ccmake"
  end

  test do
    (testpath/"CMakeLists.txt").write("find_package(Ruby)")
    system "#{bin}/cmake", "."
  end
end
