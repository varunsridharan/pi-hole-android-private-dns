<img src="https://raw.githubusercontent.com/varunsridharan/pi-hole-android-private-dns/master/assets/banner.jpg"> <br/>

# Pi-Hole Android Private DNS Installer
I came across Pi-hole about a year ago, and have been using it on and off since then for small projects.

A few months ago I decided to use it for private DNS, but the compatibility with Android Private DNS was not widely available or effective. I spent many hours searching over the internet, piecing together code from various sources and testing it.

I am finally happy to say that I am able to create a working piece of code for Android Private DNS!

As a member of the open source community, I would like to give back, and am posting the code here for use by fellow members. I am sure there are at least a few members out there who may have need for this code.

## Installation
This is a simple script which requires 2 arguments
1. Domain Name To Run Android Private DNS Service
2. Email To Share with letsencrypt to get an SSL For Android Private DNS

```
sudo wget https://raw.githubusercontent.com/varunsridharan/pi-hole-android-private-dns/master/pi-hole-android-private-dns.sh
sudo bash pi-hole-android-private-dns.sh {domain_name} {email_for_letsencrypt}
```

**Example Run** `sudo bash pi-hole-android-private-dns.sh mydns.example.com myemail@gmail.com`

---

## Contribute
If you would like to help, please take a look at the list of
[issues][issues] or the [To Do](#-todo) checklist.

## License
This project is licensed under **General Public License v3.0 license**. See the [LICENSE](LICENSE) file for more info.

## Copyright
2017 - 2020 Varun Sridharan, [varunsridharan.in][website]

If you find it useful, let me know :wink:

You can contact me on [Twitter][twitter] or through my [email][email].

## Backed By
| [![DigitalOcean][do-image]][do-ref] | [![JetBrains][jb-image]][jb-ref] |  [![Tidio Chat][tidio-image]][tidio-ref] | [![Cloudron][cro-image]][cro-ref] |
| --- | --- | --- | --- |

[twitter]: https://twitter.com/varunsridharan2
[email]: mailto:varunsridharan23@gmail.com
[website]: https://varunsridharan.in
[issues]: issues/

[do-image]: https://vsp.ams3.cdn.digitaloceanspaces.com/cdn/DO_Logo_Horizontal_Blue-small.png
[jb-image]: https://vsp.ams3.cdn.digitaloceanspaces.com/cdn/phpstorm-small.png?v3
[cro-image]: https://vsp.ams3.cdn.digitaloceanspaces.com/cdn/cloudron.png
[tidio-image]: https://vsp.ams3.cdn.digitaloceanspaces.com/cdn/tidiochat-small.png
[do-ref]: https://s.svarun.in/Ef
[cro-ref]: https://cloudron.io/
[jb-ref]: https://www.jetbrains.com
[tidio-ref]: https://tidiochat.com