
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rscrapss

<!-- badges: start -->

<!-- badges: end -->

The main purpose of rscrapps is to allow a user to easily search the
Google Play Store for apps and scrape information from those apps’
pages.

## Installation

<!-- You can install the released version of rscrapps from [CRAN](https://CRAN.R-project.org) with: -->

<!-- ``` r -->

<!-- install.packages("rscrapps") -->

<!-- ``` -->

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("stephaniereinders/rscrapps")
```

## Example

Suppose you want to gather information on steganography apps listed on
the Google Play Store. You can run the function getDataForApps with
inputs search\_term = “steganography” and num\_apps = 5. The function
will first search the Google Play Store for apps using steganography as
the search term. Then the function will scrape the Google Play Store
pages of the first 5 apps listed in the search results. If you want to
scrape the app pages of all of the apps in the search results, you can
run the function with num\_apps = “all” but be forwarned that the
function can take a while to run depending on the number of apps in the
search results.

``` r
library(rscrapps)

data <- getDataForApps(search_term = "steganography", num_apps =  5)

data
#>                                   name     developer      category audience
#> 1                 Steganography Master    Dino Trnka Entertainment Everyone
#> 2                              Stegais Roman Cinkais         Tools Everyone
#> 3 Hidden: Steganography & Cryptography      Jamezuki         Tools Everyone
#> 4                        Steganography Aksel Tórgarð         Tools Everyone
#> 5                        Steganography       Leonid_         Tools Everyone
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            description
#> 1                                                                                                                                                                                                                                                                         Have you ever wanted to hide a secret message inside a photo? With Steganography Master, you can encode a message in a picture and then save it or send it to a friend. The message can only be decoded using the same app, but if you want to ensure that only the intended receiver can read the message, you can also provide a password.
#> 2                                              Application for hidden communication using steganography.User is able to:- hide the message in a selected image from photo library or in a taken photo from camera- send image which contains hidden message to another person through email or just save it to photo library- reveal the hidden message from the imageEvery feedback and ideas are welcome.Only with more users could be the communication better.Please read the important information about usage inside application.For more information visit our web page or contact us directly through support.
#> 3                                                                                                                                         Hide messages using steganography and cryptography.Send secret messages to your friends.Hide important data.LSB (Least Significant Bit) algorithm.XOR Cipher algorithm.Encrypt and decrypt your messages with a password to keep them safe.Add more security by hiding them within the pixels of an image of your choice.Share the image by email or any other medium that does not modify it.It can hide messages of up to 50,000 characters.Supports JPEG and PNG formats.
#> 4 Features:* Encode images with a secret message* Decode secret messages out of encoded images* Take pictures with camera, or pick them using a gallery app* Transmit imagesThis app was developed as a first semester project of the Software Development bachelor, at the Copenhagen School of Design and Technology.It originally implemented a RESTful steganography web service. This functionality has since been moved to the app itself.Due to the nature of steganography, images transmitted with messaging apps that compress attachments, e.g. Facebook\\'s Messenger, won\\'t contain the hidden message.
#> 5                                                                                                                                                                                                                                                                                                                                                                                                                             Данная программа позволяет скрыть  текст в изображение, а также изображение в другое изображение.  Любые ваши замечания и предложения пишите мне на почту или оставляйте в комментариях.
#>   rating num_rating           updated size installs current_version
#> 1    3.9        120     June 29, 2014 2.1M  10,000+             1.3
#> 2    4.4         59 November 12, 2017 1.3M   5,000+           1.3.0
#> 3    NaN          0   October 9, 2019 1.3M     500+             1.8
#> 4    3.8         20   October 3, 2016 1.3M   5,000+           1.0.1
#> 5    4.6         14     April 4, 2020 1.7M     100+             1.3
#>   requires_Android content_rating in_app_products    offered_by
#> 1     2.3.3 and up       Everyone              NA    Dino Trnka
#> 2       2.3 and up       Everyone              NA Roman Cinkais
#> 3       5.0 and up       Everyone              NA      Jamezuki
#> 4       4.1 and up       Everyone              NA Aksel Tórgarð
#> 5       6.0 and up       Everyone              NA       Leonid_
#>                                                                developer_contact
#> 1                                                               dinaga@gmail.com
#> 2                                 Visit websitestegais@stegais.comPrivacy Policy
#> 3 jamezuki@gmail.comPrivacy PolicyPino Suarez #39\n72014\nPuebla, Puebla\nMexico
#> 4                                            Visit websiteaksel@akseltorgard.com
#> 5                                                        GetGoodGame00@gmail.com
```

If you want to scrape the Google Play Store app page of a specific app,
you can use the function getDataForSingleApp. The input is the url to
the app’s page on the Google Play
Store.

``` r
data <- getDataForSingleApp("https://play.google.com/store/apps/details?id=com.hulu.plus")

data
#>                                              name developer      category
#> 1 Hulu: Stream TV shows & watch the latest movies      Hulu Entertainment
#>   audience
#> 1     Teen
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         description
#> 1 Watch movies, new shows, Hulu Originals, sports, live news, and more with Hulu.Stream TV shows your way. From anime to sports, watch shows, get live news and much more on your favorite devices. Stream live TV, browse episodes and watch shows with a plan that works for you—Hulu, Hulu (No Ads), or Hulu + Live TV*. Watch movies, stream TV shows, and enjoy your own personalized streaming library.*Regional restrictions, blackouts, and additional terms apply.Plus, Hulu is now the new home of FX Networks, with 40+ acclaimed shows as well as new FX originals.Watch shows, stream movies, browse episodes, and more. Here’s what you have access to on all Hulu plans:• A personalized TV experience and streaming library—get recommendations when you watch TV shows or movies• Personalized profiles—create up to 6 profiles so everyone can keep track when they browse episodes, shows, and movies• My Stuff—add shows and movies for quick access to your favorites• Watch movies or stream TV shows at home or on the go• Premium networks—discover and watch shows from HBO®, SHOWTIME®, CINEMAX®, and STARZ® for an additional monthly fee• No hidden fees when you want to watch shows—There are no equipment rentals fees, or installation appointments• Watch acclaimed FX Originals on Hulu, the new home of FX NetworksHuluOur ad-supported plan lets you browse episodes, shows, and more in the largest streaming TV library. Stream over 80,000+ episodes of the shows you love, from award-winning Originals like The Handmaid’s Tale and The Act to other popular shows like This is Us and The Good Doctor. Hulu (No Ads)Discover the plan that gives you everything you get with the Hulu plan in an ad-free* experience. Plus, you can download from thousands of titles to watch offline.***There are a few shows in our streaming library that are not included in Hulu (No Ads) due to streaming rights. Episodes of those shows will stream uninterrupted — there will just be a quick ad before and after each video. **Selected content available for download.Hulu + Live TVWatch on-demand and live TV from 60+ channels, including live news, sports, and more. Plus, get unlimited access to the entire Hulu streaming library through our ad-supported plan. No cable required.Whether you want to discover shows, watch live news, get sports updates or binge-watch your favorite anime show, with Hulu you choose the plan that works for you.Download the Hulu app now to stream movies, anime shows and much more! Terms of Use: http://www.hulu.com/termsPrivacy Policy: http://www.hulu.com/privacyYour California Privacy Rights: https://www.hulu.com/ca-privacy-rightsDo Not Sell My Personal Information: https://www.hulu.com/do-not-sell-my-infoThis app features third party software, enabling third parties to calculate measurement statistics (e.g., Nielsen’s TV Ratings).We may work with mobile advertising companies to help deliver online and in-app advertisements tailored to your interests based on your activities on our website and apps and on other, unaffiliated websites and apps. To learn more, visit www.aboutads.info. To opt-out of online interest-based advertising, visit www.aboutads.info/choices. To opt-out of cross-app advertising, download the App Choices app at www.aboutads.info/appchoices. Hulu is committed to complying with the DAA’s Self-Regulatory Principles for Online Behavioral Advertising and the DAA’s Application of Self-Regulatory Principles for the Mobile Environment.
#>   rating num_rating       updated size    installs current_version
#> 1    4.1     415560 June 24, 2020 8.9M 50,000,000+    4.2.0.408850
#>   requires_Android content_rating in_app_products offered_by
#> 1       5.0 and up           Teen     Shares Info       Hulu
#>                             developer_contact
#> 1 Visit websitesupport@hulu.comPrivacy Policy
```
