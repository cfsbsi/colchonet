require 'rails_helper'

RSpec.describe Room, type: :model do
  it 'persist new room' do
    title = 'First room'
    location = 'Sorocaba-SP'
    description = 'Quarto com uma cama, comoda e ventilador de teto.'
    room = Room.create(title: title, location: location, description: description)

    expect(room).to be_persisted
    expect(room.title).to eq title
    expect(room.location).to eq location
    expect(room.description).to eq description
  end
end
