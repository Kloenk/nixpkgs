{ lib, buildPythonApplication, fetchPypi, matplotlib, numpy, pymavlink, pyserial
, setuptools, wxPython_4_0 }:

buildPythonApplication rec {
  pname = "MAVProxy";
  version = "1.8.19";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1rbq2nm01212rp5xbl8p8kjl2mpgfppkwjsq3lnfw1v6g0m4359h";
  };

  propagatedBuildInputs = [
    matplotlib
    numpy
    pymavlink
    pyserial
    setuptools
    wxPython_4_0
  ];

  # No tests
  doCheck = false;

  meta = with lib; {
    description = "MAVLink proxy and command line ground station";
    homepage = "https://github.com/ArduPilot/MAVProxy";
    license = licenses.gpl3;
    maintainers = with maintainers; [ lopsided98 ];
  };
}
