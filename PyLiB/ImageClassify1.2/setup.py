from distutils.core import setup
import py2exe
import sys
options = {"py2exe":{"bundle_files":1}}

setup(options=options,
      zipfile = None,
      console=[{"script":'C:\\Users\\Administrator\\Desktop\\ImageClassify\\imageClassification.py'}])