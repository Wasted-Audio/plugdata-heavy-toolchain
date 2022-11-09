python3 -m ensurepip
python3 -m pip install hvcc
python3 -m pip install pyinstaller

if [ "$(uname)" == "Darwin" ]; then
python3 pyinstaller -F --noconfirm --windowed --target-architecture universal2 --paths $(python3 -m site --user-site) ./hvcc/hvcc/__init__.py --add-data="./hvcc/*:./hvcc"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
python3 pyinstaller -F --noconfirm --windowed --paths $(python3 -m site --user-site) ./hvcc/hvcc/__init__.py --add-data="./hvcc/*:./hvcc"
elif  [[ $(uname -s) == CYGWIN* ]]; then 
python3 pyinstaller -F --noconfirm --windowed --paths $(python3 -m site --user-site) ./hvcc/hvcc/__init__.py --add-data="./hvcc/*;./hvcc"
fi

if  [[ $(uname -s) == CYGWIN* ]]; then 
mv ./dist/__init__.exe ./Heavy.exe
else
mv ./dist/__init__ ./Heavy
fi
rm -rf ./dist
rm -rf ./build
rm -rf ./__init__.spec
chmod +x ./Heavy