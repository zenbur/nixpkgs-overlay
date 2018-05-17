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
          rev = "2f11650f12dcc2893b446d7f7f60a86f239c0238";
          sha256 = "18lgw8l6g1i61fyvc9kxiwgp6x2v42ffa7bd4lznzawyg7rdlpfw";
        };
        propagatedBuildInputs = with pythonPackages; [
          flask
        ];
      };
    };
  };
}
