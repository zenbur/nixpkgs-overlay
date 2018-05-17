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
          rev = "f8e991b9bb30c343cdc550ead1c75706531ee7b2";
          sha256 = "09fd7jgyrmmw2cdvp6dqmpjvngwndx1admf0kvfv8v4n7629qrp8";
        };
        propagatedBuildInputs = with pythonPackages; [
          flask
        ];
      };
    };
  };
}
