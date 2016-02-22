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

```bash
popcorn Your.Package
```

To specify the output file:

```bash
popcorn -o output.nupkg
```

If you want to do it multiple times, pass in `--times`:

```bash
popcorn --times 5 # sends 5 HTTP requests
```

### popcornd

Don't like doing all of this manually? **popcornd** is a daemon that runs in the background and does all of this for you.

Start a server like this:

```bash
popcornd LibFoobar
```

To specify the frequency of downloads:

```bash
popcornd --freq 60 # one HTTP request every minute
```

To tell the daemon when to stop:

```bash
popcornd --stop-after 3600 # close the process after an hour
```

To run the daemon synchronously:

```bash
popcornd --sync
```

To forward arguments to the **popcorn** script:

```bash
popcornd --forward '-o foobar.nupkg --times 6'
```
