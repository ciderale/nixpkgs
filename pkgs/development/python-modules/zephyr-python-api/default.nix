{
  lib,
  buildPythonPackage,
  fetchPypi,
  requests,
  setuptools,
}:

buildPythonPackage rec {
  pname = "zephyr-python-api";
  version = "0.1.0";
  pyproject = true;

  src = fetchPypi {
    pname = "zephyr_python_api";
    inherit version;
    hash = "sha256-YupGiybfhwb+I4ofr6RNBzS6LQfx5BQD/SU5nYrnqFk=";
  };

  build-system = [ setuptools ];

  dependencies = [ requests ];

  # No tests in archive
  doCheck = false;

  pythonImportsCheck = [ "zephyr" ];

  meta = {
    homepage = "https://github.com/nassauwinter/zephyr-python-api";
    description = "Set of wrappers for Zephyr Scale (TM4J) REST API";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ rapiteanu ];
  };
}
