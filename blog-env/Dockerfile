FROM node:7

ENV USER terry
RUN git config --global user.name "Terry Chen"
RUN git config --global user.email seterrychen@gmail.com

RUN apt-get update \
  && apt-get install -y sudo vim \
  && apt-get autoremove \
  && rm -rf /var/lib/apt/lists/* 

RUN useradd -m $USER \
  && echo "$USER ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USER

USER $USER
WORKDIR /home/$USER

# hexo
RUN sudo npm install hexo-cli -g

# vim
ADD vimrc .vimrc
RUN git clone https://github.com/VundleVim/Vundle.vim.git .vim/bundle/Vundle.vim \
  && git clone git://github.com/altercation/vim-colors-solarized.git .vim/bundle/vim-colors-solarized \ 
  && mkdir .vim/colors \
  && cp .vim/bundle/vim-colors-solarized/colors/solarized.vim .vim/colors/ \
  && vim +PluginInstall +qall

EXPOSE 4000
VOLUME ["/home/$USER/hexo-blog'"]

ADD entrypoint.sh entrypoint.sh
ENTRYPOINT ["/home/terry/entrypoint.sh"]
