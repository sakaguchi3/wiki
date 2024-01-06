# pyenv

## setup

[pyenv 公式](https://github.com/pyenv/pyenv)

```bash
  curl https://pyenv.run | bash

  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
  echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
  echo 'eval "$(pyenv init - zsh)"' >> ~/.zshrc
```

## command

```bash
  pyenv install python 3.13.1
  pyenv install --list
  pyenv versions
  pyenv local 3.13.1
  pyenv global 3.13.1

```

<!--
# bb

```bash
```
a
```bash
```

-->