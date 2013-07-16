# verbose setup
def grab_test_file(id)
  path = "#{Rails.root.join('public/test_images')}/#{id}/"
  file_name = Dir.entries("#{path}").last
  the_file = File.open(path + file_name)
  the_file
end

ImageType.create(name: 'biopic', crop_x: 144, crop_y: 200)
ImageType.create(name: 'headshot', crop_x: 75, crop_y: 85)
ImageType.create(name: 'boxcover', crop_x: 144, crop_y: 200)
ImageType.create(name: 'promo', crop_x: 300, crop_y: 200)
ImageType.create(name: 'thumb', crop_x: 100, crop_y: 100)
ImageType.create(name: 'original')

Celeb.create(name: 'Kevin Spacey')
Celeb.create(name: 'Keanu Reeves')
Celeb.create(name: 'Bob Marley')
Title.create(name: 'Breaking Bad')
Title.create(name: 'Emmanuelle')
Title.create(name: 'Game of Thrones')


def grab_test_file(id)
  path = "#{Rails.root.join('public/test_images')}/#{id}/"
  file_name = Dir.entries("#{path}").last
  the_file = File.open(path + file_name)
  the_file
end

c1 = Celeb.where(name: "Kevin Spacey").first
# first, add the original and thumb image_types...
its = ImageType.where(name: ['original','thumb'])
c1.image_types << [its]

new_image_c1 = Image.create!(attachable_id: c1.id, attachable_type: c1.class.name)
test_file_c1 = grab_test_file(new_image_c1.attachable_id)
new_image_c1.filename.store!(test_file_c1)
c1.images << new_image_c1
c1.save!

c2 = Celeb.where(name: "Keanu Reeves").first
# first, add the original and thumb image_types...
its = ImageType.where(name: ['original','thumb'])
c2.image_types << [its]
new_image_c2 = Image.create!(attachable_id: c2.id, attachable_type: c2.class.name)
test_file_c2 = grab_test_file(new_image_c2.attachable_id)
new_image_c2.filename.store!(test_file_c2)
c2.images << new_image_c2
c2.save!

c3 = Celeb.where(name: "Bob Marley").first
# first, add the original and thumb image_types...
its = ImageType.where(name: ['original','thumb'])
c3.image_types << [its]
new_image_c3 = Image.create!(attachable_id: c3.id, attachable_type: c3.class.name)
test_file_c3 = grab_test_file(new_image_c3.attachable_id)
new_image_c3.filename.store!(test_file_c3)
c3.images << new_image_c3
c3.save!

t1 = Title.where(name: "Breaking Bad").first
# first, add the original and thumb image_types...
its = ImageType.where(name: ['original','thumb'])
t1.image_types << [its]
new_image_t1 = Image.create!(attachable_id: t1.id, attachable_type: t1.class.name)
test_file_t1 = grab_test_file(new_image_t1.attachable_id + 3) # + 3, lame...
new_image_t1.filename.store!(test_file_t1)
t1.images << new_image_t1
t1.save!

t2 = Title.where(name: "Emmanuelle").first
# first, add the original and thumb image_types...
its = ImageType.where(name: ['original','thumb'])
t2.image_types << [its]
new_image_t2 = Image.create!(attachable_id: t2.id, attachable_type: t2.class.name)
test_file_t2 = grab_test_file(new_image_t2.attachable_id + 3)
new_image_t2.filename.store!(test_file_t2)
t2.images << new_image_t2
t2.save!

t3 = Title.where(name: "Game of Thrones").first
# first, add the original and thumb image_types...
its = ImageType.where(name: ['original','thumb'])
t3.image_types << [its]
new_image_t3 = Image.create!(attachable_id: t3.id, attachable_type: t3.class.name)
test_file_t3 = grab_test_file(new_image_t3.attachable_id + 3)
new_image_t3.filename.store!(test_file_t3)
t3.images << new_image_t3
t3.save!

i1 = Image.find 1
i2 = Image.find 2
i3 = Image.find 3
i4 = Image.find 4
i5 = Image.find 5
i6 = Image.find 6

it1 = ImageType.find 1
it2 = ImageType.find 2
it3 = ImageType.find 3
it4 = ImageType.find 4
it5 = ImageType.find 5

c1.image_types << [it1]
c2.image_types << [it2]
c3.image_types << [it3]
t1.image_types << [it4]
t2.image_types << [it1]
t3.image_types << [it2]