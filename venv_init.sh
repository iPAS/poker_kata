#!/bin/bash

VENV_PATH=.venv
[[ -d "${VENV_PATH}" ]] && echo "Error: directory '${VENV_PATH}' has already existed!" && exit 255

PIP_REQ=venv_pip_requirements.txt
[[ ! -f "${PIP_REQ}" ]] && echo "Error: no '${PIP_REQ}'!" && exit 255

NODE_REQ=venv_node_requirements.txt
[[ ! -f "${NODE_REQ}" ]] && echo "Error: no '${NODE_REQ}'!" && exit 255

version=$(python --version 2>&1 | cut -d\  -f2 | cut -d. -f1)
if [ $((version)) -ge 3 ]; then
    PYTHON=python
else
    PYTHON=python3
fi

if [[ "$(uname)" == *"Darwin"* ]]; then
    brew install pyqt@5
    OPTIONS="--system-site-packages" 
fi

if [[ "$(uname)" == *"Linux"* ]] || [[ "$(uname)" == *"Darwin"* ]]; then
    BIN_PATH="${VENV_PATH}"/bin
    PYTHON_PATH="$(which $PYTHON)"
else
    BIN_PATH="${VENV_PATH}"/Scripts
    PYTHON_PATH="$(which $PYTHON | sed -e 's/^\///' -e 's/\//\\/g' -e 's/^./\0:/').exe"
fi


# Create VirtualEnv
echo "Get Python from ${PYTHON_PATH}"
# read -p "... for debugging, press to continue ..."
virtualenv "${VENV_PATH}" --python="${PYTHON_PATH}" ${OPTIONS}
# read -p "... for debugging, press to continue ..."


# Install additional packages
if [ -d "${VENV_PATH}" ]; then
    . "${BIN_PATH}"/activate

    if [[ "$(which python)" != *"${BIN_PATH}/python" ]]; then
        echo 'Error: cannot activate VirtualEnv'
        exit 255
    fi

    pip install pip --upgrade
    pip install -r "${PIP_REQ}"

    # [[ ! -d ./pysemisecs ]] && \
    # echo 'Please !!!: git submodule update --init --recursive' && \
    # echo 'Then, pip install -e ./pysemisecs again!' && \
    # exit 255

    nodeenv -p --requirements=${NODE_REQ} --jobs=$(nproc)
    # nodeenv --prebuilt --node-remote --node-unsafe-perm --python="${PYTHON_PATH}" "${BIN_PATH}"/node
    deactivate
    . "${BIN_PATH}"/activate
    corepack enable

else
    echo 'Error: cannot create VirtualEnv'
fi

# read -p "... for debugging, press to continue ..."
