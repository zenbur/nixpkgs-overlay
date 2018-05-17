self: super: with self; {
  pythonOverrides = {
    packageOverrides = python-self: python-super: {
      flask-helloworld = pythonPackages.buildPythonPackage rec {
        name = "flask-hello-world-${version}";
        version = "0.1.0";

        src = fetchgit {
          url = "https://github.com/knedlsepp/flask-hello-world.git";
          rev = "dff5896234ce2bd7afa66134206f3403f2d94e38";
          sha256 = "0g350ikvnz1kzyb31z6363nvjgyfj5f75a2c1p008s18sv0blqr3";
        };
        propagatedBuildInputs = with pythonPackages; [
          flask
        ];
      };
    };
  };
}
