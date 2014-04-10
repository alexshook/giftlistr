Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
# http://giftlistr.s3.amazonaws.com/users/avatars/000/000/001/original/IMG_1463.jpg?1397080310
