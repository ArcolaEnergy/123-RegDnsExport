
.PHONY: venv

ifeq ("$(VIRTUAL_ENV)", "")
  ENV=. venv/bin/activate;
endif

venv: venv/bin/activate

venv/bin/activate: requirements.txt
	test -d venv || virtualenv -p python3 venv
	$(ENV) pip install --upgrade --force pip
	$(ENV) pip install --force -Ur requirements.txt
	touch venv/bin/activate

clean:
	rm -rf ./venv
