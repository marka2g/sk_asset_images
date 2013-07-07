Celeb.create(name: 'Kevin Spacy')
Celeb.create(name: 'Keanu Reeves')

Title.create(name: 'Breaking Bad')
Title.create(name: 'Emmanuelle')
Title.create(name: 'Game of Thrones')

Image.create(name: 'GoT Honnies at Comcon')
Image.create(name: 'Breaking Bad Double')

ImageType.create(name: 'biopic', crop_x: 144, crop_y: 200)
ImageType.create(name: 'headshot', crop_x: 75, crop_y: 85)
ImageType.create(name: 'boxcover', crop_x: 144, crop_y: 200)
ImageType.create(name: 'promo', crop_x: 300, crop_y: 200)

i1 = Image.find 1
i2 = Image.find 2
it1 = ImageType.find 1
it2 = ImageType.find 2
i1.asset_types = [it1]
i2.asset_types = [it2]