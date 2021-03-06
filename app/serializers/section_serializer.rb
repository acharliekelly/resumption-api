# frozen_string_literal: true

class SectionSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :format
  belongs_to :user
  has_one :sectype
  has_many :section_layouts
  # has_many :layouts, through: :section_layouts
end
