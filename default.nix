self: super: with self; {
  python27 = super.python27.override pythonOverrides;
  python27Packages = super.recurseIntoAttrs (python27.pkgs);
  python36 = super.python36.override pythonOverrides;
  python36Packages = super.recurseIntoAttrs (python36.pkgs);

  pythonOverrides = {
    packageOverrides = python-self: python-super: {
      flask-helloworld = pythonPackages.buildPythonPackage rec {
        name = "flask-hello-world-${version}";
        version = "0.1.0";

        src = fetchgit {
          url = "https://github.com/zenbur/flask-hello-world";
          rev = "f0ce9cfebf495b4da1ccd9f1e3883fdf6c2efaad";
          sha256 = "1j85wldm22la0wlxvrdg4fifjg2g6gwksqnjnjf4lfmkx32m861l";
        };
        propagatedBuildInputs = with pythonPackages; [
          flask
        ];
      };
    };
  };
}
