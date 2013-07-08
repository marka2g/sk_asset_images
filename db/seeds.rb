Celeb.create(name: 'Kevin Spacey')
Celeb.create(name: 'Keanu Reeves')

Title.create(name: 'Breaking Bad')
Title.create(name: 'Emmanuelle')
Title.create(name: 'Game of Thrones')

ImageType.create(name: 'biopic', crop_x: 144, crop_y: 200)
ImageType.create(name: 'headshot', crop_x: 75, crop_y: 85)
ImageType.create(name: 'boxcover', crop_x: 144, crop_y: 200)
ImageType.create(name: 'promo', crop_x: 300, crop_y: 200)

c1 = Celeb.find 1
c2 = Celeb.find 2
image1 = c1.images.create!(name: "Kevin Spacey Biopic")
image2 = c2.images.create!(name: "Keanu Reeves Headshot")

t1 = Title.find 1
t2 = Title.find 2
t3 = Title.find 3
image3 = t1.images.create!(name: "Breaking Bad Boxcover")
image4 = t2.images.create!(name: "Emmanuelle Promo")
image5 = t3.images.create!(name: "Game of Thrones Biopic")

i1 = Image.find 1
i2 = Image.find 2

it1 = ImageType.find 1
it2 = ImageType.find 2

i1.image_types << [it1]
i2.image_types << [it2]