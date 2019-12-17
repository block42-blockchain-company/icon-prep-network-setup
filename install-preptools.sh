sudo apt-get install -y libssl-dev build-essential automake pkg-config libtool libffi-dev libgmp-dev libyaml-cpp-dev
sudo apt-get install -y python3.7-dev libsecp256k1-dev python3-pip
sudo apt-get install -y python3-venv
git clone https://github.com/icon-project/preptools.git
cd preptools
python3 -m venv venv
source venv/bin/activate
./build.sh
pip install dist/preptools-1.0.2-py3-none-any.whl
pip install preptools
