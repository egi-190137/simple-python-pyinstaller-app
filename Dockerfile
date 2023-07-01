FROM python:3.9 
# Or any preferred Python version.
ADD sources/* .
CMD [“python”, “./add2vals.py”] 
# Or enter the name of your unique directory and parameter set.