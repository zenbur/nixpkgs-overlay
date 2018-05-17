self: super: with self; {
  python27 = super.python27.override pythonOverrides;
  python27Packages = super.recurseIntoAttrs (python27.pkgs);
  python36 = super.python36.override pythonOverrides;
  python36Packages = super.recurseIntoAttrs (python36.pkgs);

  pythonOverrides = {
    packageOverrides = python-self: python-super: {
      flask-ruben-helloworld = pythonPackages.buildPythonPackage rec {
        name = "flask-ruben-helloworld-${version}";
        version = "0.1.0";

        src = fetchgit {
          url = "https://github.com/zenbur/flask-hello-world";
          rev = "2d0a6d470707558795686ece4da53bc3648ebdf0";
          sha256 = "01vfckg2km3aqfs431963x1v316mw4hv4dnghf1lpwa9blfy5x7z";
        };
        propagatedBuildInputs = with pythonPackages; [
          flask
        ];
      };
    };
  };
}
