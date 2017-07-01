FROM python:3

RUN apt-get update \
  && apt-get install -y \
    vim \
    sudo \
  && rm -rf /var/lib/apt/lists/* 

RUN pip install pytest flake8

# create user account
ENV USER terry
RUN useradd -m $USER \
  && echo "$USER ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USER

# change to USER
USER $USER
WORKDIR /home/$USER

# vim
COPY vimrc .vimrc
RUN git clone https://github.com/VundleVim/Vundle.vim.git .vim/bundle/Vundle.vim \
  && git clone git://github.com/altercation/vim-colors-solarized.git .vim/bundle/vim-colors-solarized \ 
  && mkdir .vim/colors \
  && cp .vim/bundle/vim-colors-solarized/colors/solarized.vim .vim/colors/ \
  && vim +PluginInstall +qall

ENTRYPOINT /bin/bash
