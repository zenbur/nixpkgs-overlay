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
          rev = "eb08f4e0b927e5e6065991726039f23a01e9d89f";
          sha256 = "0d33mf9k8ihkk5glymwx9n5bicpkvh96xw646qviqjspzngh71hb";
        };
        propagatedBuildInputs = with pythonPackages; [
          flask
        ];
      };
    };
  };
}
