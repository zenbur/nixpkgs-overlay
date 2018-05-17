self: super: with self; {
  python27 = super.python27.override pythonOverrides;
  python27Packages = super.recurseIntoAttrs (python27.pkgs);
  python36 = super.python36.override pythonOverrides;
  python36Packages = super.recurseIntoAttrs (python36.pkgs);

  pythonOverrides = {
    packageOverrides = python-self: python-super: {
      flask-ruben-helloworld = pythonPackages.buildPythonPackage rec {
        name = "flask-ruben-hello-world-${version}";
        version = "0.1.0";

        src = fetchgit {
          url = "https://github.com/zenbur/flask-hello-world";
          rev = "1e3fedd49ef0b05fc9cec8eb82fded5a142ae236";
          sha256 = "0fk8n0hrs80f8kb6wmp94y8yiwalf3mvbwi1gcx0a7pk0hj09wkx";
        };
        propagatedBuildInputs = with pythonPackages; [
          flask
        ];
      };
    };
  };
}
