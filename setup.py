"""Setup module."""

from setuptools import find_packages, setup

with open("requirements.txt") as f:
    install_requires = f.read().splitlines()

setup(
    name="PDF Summarizer Application",
    version="0.0.1",
    packages=find_packages(),
    install_requires=install_requires,
)
