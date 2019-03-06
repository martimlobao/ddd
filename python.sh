#!/usr/bin/env bash
###############################################################################
# INSTALL PYTHON, PYENV, CONDA, AND JUPYTER
###############################################################################
# Make sure homebrew is installed and the following command has been run:
# sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
brew install python
brew install black
# brew link black
brew install pyenv
brew install pyenv-virtualenv

###############################################################################
# To automatically launch local virtual environments, add the following commands to ~/.bash_profile:
# $ eval "$(pyenv init -)"
# $ eval "$(pyenv virtualenv-init -)"
#
# To create a virtual environment:
# pyenv virtualenv 3.7.2 myenv
#
# To set a local environment, use the following command in the project folder:
# $ pyenv local myproject
###############################################################################

# Tell pyenv to search in system commands if it can't find a command in the local environment (see https://github.com/pyenv/pyenv/issues/772)
# Required to get jupyter running anywhere if it has also been installed on some virtualenv
brew install pyenv-which-ext

# Install Jupyter globally
brew install jupyter
brew install ipython
# Tell jupyter to respect the virtualenv it is launched in
ipython profile create
curl -L http://hbn.link/hb-ipython-startup-script > ~/.ipython/profile_default/startup/00-venv-sitepackages.py
# If installing jupyter locally, check pip show tornado compatibility with jupyter
# (tornado 6.0.1 breaks jupyter, 5.1.1 works, see https://github.com/jupyter/notebook/issues/4439)

# Install python 3.7.2 and set it as the default python environment
pyenv install 3.7.2
pyenv global 3.7.2

# Configure miniconda within pyenv
pyenv install miniconda3-latest

###############################################################################
# To create conda environments that can be activated directly through pyenv:
# (without specifying a version like 'conda=4.3.30' pyenv won't recognize the environment)
# $ pyenv activate miniconda3-latest
# $ conda create -n myenv conda=4.3.30
# $ pyenv deactivate
# $ pyenv activate miniconda3-latest/envs/myenv
###############################################################################

###############################################################################
# To create kernels for Jupyter:
# (https://stackoverflow.com/questions/39604271/conda-environments-not-showing-up-in-jupyter-notebook)
# $ conda create -n pytwo python=2.7
# $ conda activate pytwo
# $ conda install ipykernel
# $ python -m ipykernel install --user --name pytwo --display-name "Python (pytwo)"
###############################################################################
