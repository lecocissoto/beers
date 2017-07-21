<p align="center">

<img src="https://raw.githubusercontent.com/lecocissoto/beers/master/images/logo-beers.png" alt="Beers" title="Beers" width="557"/>

</p>

---

Beers is an iOS application based on the [PUNK API][punk-api] to give a list of beers and show it details.

## Requirements

- ** Swift 4 **
- XCode 9

## Third Party Libraries

- [Alamofire][link-alamofire]
- [Kingfisher][link-kingfisher]

## Instalation

Im using `git submodule` because is the git way to deal with dependencies. I believe is better than use something like cocoapods.

To install, just clone the project, init and update the submodule running:

```
    git submodule init
    git submodule update
```

or

`git submodule update  --init`

or

`git clone --recursive https://github.com/lecocissoto/beers.git`


## Next steps

- Add Unit Tests and UITests.
- Add Swift Package Manager to deal with dependencies.
- Extract the UIAlertController.
- Add pagination do list all the beers.
- Add to favorites feature.

[punk-api]: https://punkapi.com/documentation/v2
[link-alamofire]: https://github.com/Alamofire/Alamofire
[link-kingfisher]: https://github.com/onevcat/Kingfisher
