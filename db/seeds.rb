Celeb.create(name: 'Kevin Spacey')
Celeb.create(name: 'Keanu Reeves')
Celeb.create(name: 'Bob Marley')

c1 = Celeb.find 1
c2 = Celeb.find 2
c3 = Celeb.find 3
image1 = c1.images.create!(name: "Kevin Spacey Uploaded Image")
image2 = c2.images.create!(name: "Keanu Reeves Uploaded Image")
image3 = c3.images.create!(name: "Bob Marley Uploaded Image")

Title.create(name: 'Breaking Bad')
Title.create(name: 'Emmanuelle')
Title.create(name: 'Game of Thrones')

t1 = Title.find 1
t2 = Title.find 2
t3 = Title.find 3
image4 = t1.images.create!(name: "Breaking Bad Boxcover")
image5 = t2.images.create!(name: "Emmanuelle Promo")
image6 = t3.images.create!(name: "Game of Thrones Biopic")

ImageType.create(name: 'biopic', crop_x: 144, crop_y: 200)
ImageType.create(name: 'headshot', crop_x: 75, crop_y: 85)
ImageType.create(name: 'boxcover', crop_x: 144, crop_y: 200)
ImageType.create(name: 'promo', crop_x: 300, crop_y: 200)

i1 = Image.find 1
i2 = Image.find 2
i3 = Image.find 3
i4 = Image.find 4
i5 = Image.find 5
i6 = Image.find 6

it1 = ImageType.find 1
it2 = ImageType.find 2
it3 = ImageType.find 3

i1.image_types << [it1]
i2.image_types << [it2]
i3.image_types << [it3]
i4.image_types << [it4]
i5.image_types << [it1]
i6.image_types << [it2]