class BinaryCmake < Formula
  desc "Cross-platform make: install latest binary release package"
  homepage "http://www.cmake.org/"
  url "http://www.cmake.org/files/v3.3/cmake-3.3.1-Linux-x86_64.tar.gz"
  sha256 "9dce2e6d6ae5bdee45db46ef5148541fe986fba3ae55f689bdc99d26d3696689"
  version "3.3.1"

  conflicts_with "system-cmake"
  
  def install
    bin.install "bin/cmake", "bin/ccmake", "bin/ctest"
    share.install "share/cmake-3.3", "share/aclocal", "share/applications", "share/mime"
  #  system "mkdir #{bin}"
  #  system "ln -s ```which ctest``` #{bin}/ctest"
  #  system "ln -s ```which cmake``` #{bin}/cmake"
  #  system "ln -s ```which ccmake``` #{bin}/ccmake"
    system "#{bin}/cmake", "--version"
  end

  test do
    (testpath/"CMakeLists.txt").write("find_package(Ruby)")
    system "#{bin}/cmake", "."
    system "#{bin}/cmake", "--version"
  end
end
