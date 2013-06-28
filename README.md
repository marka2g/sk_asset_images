## Mark's Magick Notes

###
RMagick script
* ImageManipulation::VersionConversion.new(:input_file => "#{Rails.root.join('public/uploads/test/')}game-of-thrones-takes-over-comic-con.jpg", :dimensions => {:x => 144, :y => 200}, :output_files => {:save_path => "#{Rails.root.join('public/uploads/test/output/')}", :save_name => "biopic_some_id"})

### Or

### Image Magic Command Examples
* :biopic, :boxcover - convert game_of_thrones.jpg -resize '144X200^' -gravity center -crop '144X200+0+0+0' game_of_thrones_biopic.jpg
* :headshot - convert game_of_thrones.jpg -resize '75X85^' -gravity center -crop '75X85+0+0+0' game_of_thrones_headshot.jpg
* :promo - convert game_of_thrones.jpg -resize '300X200^' -gravity center -crop '300X200+0+0+0' game_of_thrones_promo.jpg


## <><><><><><><><><><><>
# Asset Images Exercise

## Assignment

### Abstract

Allow for the storage of arbitrarily many source asset images for a specific set of primary data models, each with a specific set of display image versions that can be created from the supplied source images. The set of primary models and display image versions may grow over time.

### Detailed use case

Given a primary data model (e.g. Celeb or Title), a source asset image my be supplied (usually via a web upload). This image is stored without any manipulation. The user is then able to select a specific type of display image to create from the source image (e.g. headshot for a Celeb or boxcover for a Title). The user then selects a crop area for the display image version, and that version is created by the server from the source image. These image versions are stored and available for display.

### Assignment goal

Implement the portion of the system that manages the images on the server. I.e. after an image has been uploaded to the server, store it and process any versions that the user requested be made. Version management (creation, deletion, modification) must also be possible on existing source images. Versions are defined by a name and an image size. The final processed version images must be the required dimensions, and to avoid distortion, the  cropped areas must have the same aspect ratio as the final images.

#### Detailed requirements

* Two primary models (Celeb and Title) have collections of asset images.
* When supplied with a source image, the image is added to the collection and stored for later retrieval. This image is not manipulated in any way.
* Source images may be deleted from the primary models image collection.
* Each of the two primary models have a set of versions of display images that may be created from the source images.
* Each version is defined by a name and a set of dimensions.
  * The names are unique per primary model, and are used to identify and access the various versions.
  * After processing the display images must be the supplied dimensions.
* The Celeb display image versions are as follows:
  * biopic: 144x200
  * headshot: 75x85
* The Title display image versions are as follows:
  * boxcover: 144x200
  * promo: 300x200
* Any particular source image may have any, all, or none of the display image versions created from it.
* Display image versions of a specific source image may be removed, added, or changed at any time.
* The display images are created from the source images via the use of a crop string. This crop string consists of the crop dimensions and the cropping coordinates. The cropped area is then scaled down to the final image size.
* Crop strings have the format `WxH+X+Y` where:
  * `W` is the width of the crop area in pixels
  * `H` is the height of the crop area in pixels
  * `X` is the X coordinate of the upper left corner of the crop area with the origin at the upper left of the source image
  * `Y` is the Y coordinate of the upper left corner of the crop area with the origin at the upper left of the source image
* The cropped area is verified to meet the following two criteria:
  * To avoid distortion, the aspect ratio is approximately equal to the final image aspect ratio.
  * The cropped dimensions are at least as large as the final image dimensions (I.e. the image is not scaled up at all).
* The crop string is stored for future use.
* All images (source and display versions) are avilable at unique URLs which can be retrieved from the system in some manner.
* A method for adding new source images and specifying which display image versions to create along with their crop strings is available.

#### Areas that will be looked at

* General code quality
* Are the requirements met
* Are the correct images stored and created from the supplied data
* How easy is it to manage the source images
* How easy is it to manage the display image versions for a given source image.
* How easy is it to add a new image version for a particular type of asset image (I.e. add a cast pic version to the Title model)
* How easy is it to add a new primary model with its own set of display image versions
* Are there any tests and how well do they test the supplied code

#### Interface

A web interface is not required, but if one is built it will certainly be taken into consideration. However, some method of supplying images and cropping data to the system must be created. Doing it through the command line or console is acceptable, as is through tests. However it is done, instructions on how to submit arbitrary data must be supplied.

#### File uploads, management, and processing

Use [CarrierWave](https://github.com/carrierwaveuploader/carrierwave/) for managing the images. It is sufficiently powerful and flexible to meet all of the requirements. Image manipulation can be done with an ImageMagick library such as [RMagick](https://github.com/carrierwaveuploader/carrierwave/blob/master/README.md#using-rmagick) or [MiniMagick](https://github.com/carrierwaveuploader/carrierwave/blob/master/README.md#using-minimagick).

## The App

### Getting started

[https://github.com/marka2g/sk_asset_images](https://github.com/marka2g/sk_asset_images) is a fork of jpregracke stub repository with the necessary gems (including MiniMagick) and the two basic primary models, Celeb and Title. It also includes some sample data in the seed file (two celebs and two titles) and sample source images in `test/fixtures` (one for each primary resource). Use this app as a starting point.

### Testing

Use any testing framework you wish for.

### Submitting

Send me a link to your code when you're done.

### Questions

Feel free to contact me with any questions that you have.
