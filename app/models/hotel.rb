require 'elasticsearch/model'

class Hotel < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many   :comments
  
  validates :title, :room_description, :price_for_room, :state, :city, :street, :hotels_country, :user_id, presence: true
  validates :room_description, length: { minimum: 50 }

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :room_description, analyzer: 'english'
    end
  end

  def self.search(query)
    __elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: query,
            fields: ['room_description']
          }
        },
        highlight: {
          pre_tags: ['<em>'],
          post_tags: ['</em>'],
          fields: {
            room_description: { number_of_fragments: 0 }
          }
        }
      }
    )
  end

end

# # Delete the previous Hotels index in Elasticsearch
# Hotel.__elasticsearch__.client.indices.delete index: Hotel.index_name rescue nil
#
# # Create the new index with the new mapping
# Hotel.__elasticsearch__.client.indices.create \
#   index: Hotel.index_name,
#   body: { settings: Hotel.settings.to_hash, mappings: Hotel.mappings.to_hash }
#
# # Index all Hotel records from the DB to Elasticsearch
# Hotel.import


# elasticsearch --config=/usr/local/opt/elasticsearch/config/elasticsearch.yml