# URLsh

Just a wrapper around a github gist from: https://gist.github.com/cdown/1163649
  
Is great for when you're playing around with `curl`, and don't want to load up cyberchef every time. 
  
Plus, a good way for me to learn how to use bash's `getopts`
  

### Usage
  
```sh
Usage: urlsh -e [message] -d [encoded chars]

[Options]
 -h:            To show this message.
 -e             URL Encode special characters.
 -d             URL Decode encoded characters.
 -a             URL Encode all characters. 

 If no command-line arguments set:
 -> Allow manual input for encoding
```
  
### Installation

```sh
git clone https://github.com/Fr3dd1e/URLsh.git
cd URLsh
sudo ln -sf $(pwd)/urlsh.sh /usr/bin/urlsh
```

