sudo apt-get install -y build-essential cmake python-dev clang-3.5 libclang-3.5-dev
cd ycmd
./build.py --clang-completer --system-libclang
