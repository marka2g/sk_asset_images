# setup - refactor/cleanup, yuk!
# issue - filename on image is not saving, it is thru an carrierwave upload tho...
def grab_test_files(id)
	path = "#{Rails.root.join('public/test_images')}/#{id}/"
	file_name = Dir.entries("#{path}").last
	the_file = File.open(path + file_name)
	[the_file, file_name]
end

ImageType.create(name: 'biopic', crop_x: 144, crop_y: 200)
ImageType.create(name: 'headshot', crop_x: 75, crop_y: 85)
ImageType.create(name: 'boxcover', crop_x: 144, crop_y: 200)
ImageType.create(name: 'promo', crop_x: 300, crop_y: 200)
ImageType.create(name: 'thumb', crop_x: 100, crop_y: 100)

Celeb.create(name: 'Kevin Spacey')
Celeb.create(name: 'Keanu Reeves')
Celeb.create(name: 'Bob Marley')
Title.create(name: 'Breaking Bad')
Title.create(name: 'Emmanuelle')
Title.create(name: 'Game of Thrones')

c1 = Celeb.where(name: "Kevin Spacey").first
new_image_c1 = c1.images.build
test_file_c1, file_name_c1 = grab_test_files(new_image_c1.attachable_id)
# new_image_c1.filename = file_name_c1
new_image_c1.save
new_image_c1.filename.store!(test_file_c1)

c2 = Celeb.where(name: "Keanu Reeves").first
new_image_c2 = c2.images.build
test_file_c2, file_name_c2 = grab_test_files(new_image_c2.attachable_id)
# new_image_c2.filename = file_name_c2
new_image_c2.save
new_image_c2.filename.store!(test_file_c2)

c3 = Celeb.where(name: "Bob Marley").first
new_image_c3 = c3.images.build
test_file_c3, file_name_c3 = grab_test_files(new_image_c3.attachable_id)
# new_image_c3.filename = file_name_c3
new_image_c3.save
new_image_c3.filename.store!(test_file_c3)

t1 = Title.where(name: "Breaking Bad").first
new_image_t1 = t1.images.build
test_file_t1, file_name_t1 = grab_test_files(new_image_t1.attachable_id + 3)#this suuuucks!
# new_image_t1.filename = file_name_t1
new_image_t1.save
new_image_t1.filename.store!(test_file_t1)

t2 = Title.where(name: "Emmanuelle").first
new_image_t2 = t2.images.build
test_file_t2, file_name_t2 = grab_test_files(new_image_t2.attachable_id + 3)
# new_image_t2.filename = file_name_t2
new_image_t2.save
new_image_t2.filename.store!(test_file_t2)

t3 = Title.where(name: "Game of Thrones").first
new_image_t3 = t3.images.build
test_file_t3, file_name_t3 = grab_test_files(new_image_t3.attachable_id + 3)
# new_image_t3.filename = file_name_t3
new_image_t3.save
new_image_t3.filename.store!(test_file_t3)

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

i1.image_types << [it1]
i2.image_types << [it2]
i3.image_types << [it3]
i4.image_types << [it4]
i5.image_types << [it1]
i6.image_types << [it2]
