echo "running install check"
rm -rf pre-commit-venv
python -m venv pre-commit-venv
pre-commit-venv/scripts/python.exe -m install --upgrade pip
pre-commit-venv/scripts/pip install .

echo "running formatting, linting, tests"
pre-commit-venv/scripts/pip install -r requirements.txt -r requirements-dev.txt
pre-commit-venv/scripts/python.exe -m black pdappend tests setup.py
pre-commit-venv/scripts/python.exe -m flake8 pdappend tests setup.py
pre-commit-venv/scripts/python.exe -m pytest

echo "removing pre-commit venv"
rm -rf pre-commit-venv

echo "updating docs"
mkdir docs
echo "docs must be updated manually (run pydoc-markdown -I skadoo --render-toc > docs/docs.md)"
#venv/scripts/python.exe -m pydoc-markdown -I skadoo --render-toc > docs/docs.md