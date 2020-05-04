# PyAutoGUI with Selenium

A little demo showing how to make [PyAutoGUI](https://pyautogui.readthedocs.io) and [Selenium WebDriver](https://www.selenium.dev) work together.

## Usage

### Docker

**Note**: tested on a Linux machine only.

#### Requirements

* Docker Engine
* Docker Compose

#### Installation

```shell
docker-compose build
```

On Linux, enable your host's OS user to create connections to the host’s X11 server:

```shell
xhost +local:$(whoami)
```

Bring the containers up:

```shell
docker-compose up -d
```

#### Test

```shell
docker exec selenium-chrome ilovemepaws
```

Check the [`artifacts`](./artifacts) folder for screenshots.

Bring containers down:

```shell
docker-compose down
```

### Pure Python

#### Requirements

OS packages (Linux):

* `python3-xlib`
* `python3-tk`
* `python3-dev`
* `pip3`
* `xvfb`
* `xserver-xephyr`

Pip packages:

* `virtualenv`

#### Installation

```shell
virtualenv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

#### Test

Bring the test website up:

```shell
cd tests
python3 -m http.server
```

Inside [`ilovemepaws`](./ilovemepaws), replace `http://i-love-me-paws:8000` with `http://localhost:8000`.

Execute script:

```shell
./ilovemepaws
```

Check the [`artifacts`](./artifacts) folder for screenshots.

## Links

* https://github.com/asweigart/pyautogui/issues/133#issuecomment-309824271
* https://stackoverflow.com/a/36372919
* http://fredtantini.free.fr/blog/index.php?article58/automatiser-des-actions-avec-selenium-pyautogui-et-xvfb
