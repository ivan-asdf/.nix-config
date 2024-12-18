{ pkgs ? import <nixpkgs> { }, buildPythonPackage }:
#{ pkgs ? import <nixpkgs> {}}:
#pkgs.python3Packages.buildPythonPackage rec {
buildPythonPackage rec {
  pname = "whoisdomain";
  version = "1.20240129.1";
  #format = "hatch";
  format = "wheel";
  src = pkgs.fetchPypi {
    #owner = "mboot-github";
    #repo = "https://github.com/mboot-github/WhoisDomain.git";
    #rev = "v1.20240129.1";
    #rev = "v1";
    inherit pname version format;
    sha256 = "sha256-IxyZldXWyGZr6/bE5P8/79iCEifd4ItItCrMR0SgQR4=";
    dist = "py3";
    python = "py3";
  };
}
