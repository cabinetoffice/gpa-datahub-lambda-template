flake:
	python -m pip install flake8
	flake8

flake3:
	python3 -m pip install flake8
	flake8

unit:
	python -m unittest discover tests/unit_tests

unit3:
	python3 -m unittest discover tests/unit_tests

check: flake unit

check3: flake3 unit3