class Enca < Formula
  desc "Charset analyzer and converter"
  homepage "https://cihar.com/software/enca/"
  url "https://dl.cihar.com/enca/enca-1.19.tar.gz"
  sha256 "4c305cc59f3e57f2cfc150a6ac511690f43633595760e1cb266bf23362d72f8a"
  head "https://github.com/nijel/enca.git"

  bottle do
    sha256 "65a9ac8920d85badc80ef73cf0db7dba94886cbc7db87a91f74be568d58da23b" => :el_capitan
    sha256 "20af1bcf2cac192ac229cd70737aef6ca187c6b608c285e442a0e3b82d156050" => :yosemite
    sha256 "130ada8011b7479f4fbc04779ba41ac636bbd769138a3e63ba092404ea3099a7" => :mavericks
  end

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    enca = "#{bin}/enca --language=none"
    assert_match /ASCII/, `#{enca} <<< 'Testing...'`
    assert_match /UCS-2/, `#{enca} --convert-to=UTF-16 <<< 'Testing...' | #{enca}`
  end
end
