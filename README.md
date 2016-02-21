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

TBC
