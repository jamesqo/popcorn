# Popcorn

Fake popularity of your NuGet package.

## Installation

Just clone the repo as usual and add it to your PATH.

### Windows

```cmd
git clone git@github.com:jamesqo/popcorn.git
cd popcorn
@powershell "$path = [Environment]::GetEnvironmentVariable('PATH', 'User'); [Environment]::SetEnvironmentVariable('PATH', ""$path;$pwd"", 'User')"
```

### Mac/Linux

```bash
git clone git@github.com:jamesqo/popcorn.git
cd popcorn
pwd -P | xargs -i echo 'export PATH="$PATH:{}"' | tee -a ~/.profile
```

## Usage

To send an HTTP request to your package once:

```console
popcorn
```

To specify the output file:

```console
popcorn -o output.nupkg
```

If you want to do it multiple times, pass in `--times`:

```console
popcorn --times 5
```

### popcornd

Don't like doing all of this manually? **popcornd** is a daemon that runs in the background and does all of this for you.

Start a server like this:

```console
popcornd
```

To specify the frequency of downloads:

```console
popcornd --freq 60 # one HTTP request every minute
```
