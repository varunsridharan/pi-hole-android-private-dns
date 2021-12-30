# Pi-Hole Android Private DNS Installer

<img src="https://raw.githubusercontent.com/varunsridharan/pi-hole-android-private-dns/master/assets/banner.jpg"> <br/>

I came across Pi-hole about a year ago, and have been using it on and off since then for small projects.

A few months ago I decided to use it for private DNS, but the compatibility with Android Private DNS was not widely available or effective. I spent many hours searching over the internet, piecing together code from various sources and testing it.

I am finally happy to say that I am able to create a working piece of code for Android Private DNS!

As a member of the open source community, I would like to give back, and am posting the code here for use by fellow members. I am sure there are at least a few members out there who may have need for this code.

## Requirements
1. Ubuntu / Debain Based (Any Version)
2. Pi-Hole Installed With Web Server
3. Forward The Following Ports in TCP (`80,443,853`) to your Pihole instance.

***Note*** I dont use Raspberry Pi to run Pi-Hole so i was not able to test. but the same steps are required for it.

## Installation
This is a simple script which requires 2 arguments
1. Domain Name To Run Android Private DNS Service Example: dns.myhomenetwork.net 
2. Email To Share with letsencrypt to get an SSL For Android Private DNS

### For Pihole 5
```
sudo wget https://raw.githubusercontent.com/GhostlyCrowd/pi-hole-android-private-dns/main/pi-hole5.sh
sudo bash pi-hole5.sh {domain_name} {email_for_letsencrypt}
```

**Example Run** `sudo bash pi-hole5.sh mydns.example.com myemail@gmail.com`

### For Pihole 4 & Below
```
sudo wget https://raw.githubusercontent.com/GhostlyCrowd/pi-hole-android-private-dns/main/pi-hole-android-private-dns.sh
sudo bash pi-hole-android-private-dns.sh {domain_name} {email_for_letsencrypt}
```

**Example Run** `sudo bash pi-hole-android-private-dns.sh dns.myhomenetwork.net myemail@gmail.com`

---


<!-- START common-footer.mustache -->
## 📝 Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

[Checkout CHANGELOG.md](https://github.com/varunsridharan/pi-hole-android-private-dns/blob/main/CHANGELOG.md)


## 🤝 Contributing
If you would like to help, please take a look at the list of [issues](https://github.com/varunsridharan/pi-hole-android-private-dns/issues/).


## 📜  License & Conduct
- [**GNU General Public License v3.0**](https://github.com/varunsridharan/pi-hole-android-private-dns/blob/main/LICENSE) © [Varun Sridharan](website)
- [Code of Conduct](https://github.com/varunsridharan/.github/blob/main/CODE_OF_CONDUCT.md)


## 📣 Feedback
- ⭐ This repository if this project helped you! :wink:
- Create An [🔧 Issue](https://github.com/varunsridharan/pi-hole-android-private-dns/issues/) if you need help / found a bug


## 💰 Sponsor
[I][twitter] fell in love with open-source in 2013 and there has been no looking back since! You can read more about me [here][website].
If you, or your company, use any of my projects or like what I’m doing, kindly consider backing me. I'm in this for the long run.

- ☕ How about we get to know each other over coffee? Buy me a cup for just [**$9.99**][buymeacoffee]
- ☕️☕️ How about buying me just 2 cups of coffee each month? You can do that for as little as [**$9.99**][buymeacoffee]
- 🔰         We love bettering open-source projects. Support 1-hour of open-source maintenance for [**$24.99 one-time?**][paypal]
- 🚀         Love open-source tools? Me too! How about supporting one hour of open-source development for just [**$49.99 one-time ?**][paypal]

<!-- Personl Links -->
[paypal]: https://sva.onl/paypal
[buymeacoffee]: https://sva.onl/buymeacoffee
[twitter]: https://sva.onl/twitter/
[website]: https://sva.onl/website/


## Connect & Say 👋
- **Follow** me on [👨‍💻 Github][github] and stay updated on free and open-source software
- **Follow** me on [🐦 Twitter][twitter] to get updates on my latest open source projects
- **Message** me on [📠 Telegram][telegram]
- **Follow** my pet on [Instagram][sofythelabrador] for some _dog-tastic_ updates!

<!-- Personl Links -->
[sofythelabrador]: https://www.instagram.com/sofythelabrador/
[github]: https://sva.onl/github/
[twitter]: https://sva.onl/twitter/
[telegram]: https://sva.onl/telegram/


---

<p align="center">
<i>Built With ♥ By <a href="https://sva.onl/twitter"  target="_blank" rel="noopener noreferrer">Varun Sridharan</a> <a href="https://en.wikipedia.org/wiki/India">
   <img src="https://cdn.svarun.dev/flag-india.jpg" width="20px"/></a> </i> <br/><br/>
   <img src="https://cdn.svarun.dev/codeispoetry.png"/>
</p>

---


<!-- END common-footer.mustache -->
