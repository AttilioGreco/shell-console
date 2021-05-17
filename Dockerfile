FROM fedora:latest

RUN dnf update -y
RUN dnf install fish util-linux-user fd-find bat fzf which git bind-utils nc -y

# Install postgres client

RUN dnf install https://download.postgresql.org/pub/repos/yum/reporpms/F-33-x86_64/pgdg-fedora-repo-latest.noarch.rpm -y && dnf install postgresql13 -y


# Install fisher
RUN fish -c "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher "
RUN fish -c "fisher install evanlucas/fish-kubectl-completions"
RUN fish -c "fisher install brgmnn/fish-docker-compose"
RUN fish -c "fisher install PatrickF1/fzf.fish"

WORKDIR /tmp/
RUN git clone https://github.com/oh-my-fish/oh-my-fish

RUN /tmp/oh-my-fish/bin/install --offline --noninteractive
WORKDIR /home/

# install my favorite omf theme
RUN fish -c "omf install bobthefish"


CMD ["/bin/fish"]