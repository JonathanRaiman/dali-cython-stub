default:
	python3 setup.py clean
	python3 setup.py build_ext --inplace

clean:
	python3 setup.py clean