// Room class
class Room {
  String roomNumber;
  String roomType;
  double price;
  bool isBooked;

  Room(this.roomNumber, this.roomType, this.price, this.isBooked);

  void bookRoom() {
    if (!isBooked) {
      isBooked = true;
      print('Room $roomNumber has been booked.');
    } else {
      print('Room $roomNumber is already booked.');
    }
  }

  void cancelBooking() {
    if (isBooked) {
      isBooked = false;
      print('Booking for room $roomNumber has been cancelled.');
    } else {
      print('Room $roomNumber is not booked.');
    }
  }
}

// Guest class
class Guest {
  String name;
  String guestId;
  List<Room> bookedRooms;

  Guest(this.name, this.guestId) : bookedRooms = [];

  void bookRoom(Room room) {
    if (!room.isBooked) {
      room.bookRoom();
      bookedRooms.add(room);
      print('Room ${room.roomNumber} has been booked by $name.');
    } else {
      print('Room ${room.roomNumber} is already booked.');
    }
  }

  void cancelRoom(Room room) {
    if (bookedRooms.contains(room)) {
      room.cancelBooking();
      bookedRooms.remove(room);
      print('Room ${room.roomNumber} booking has been cancelled by $name.');
    } else {
      print('$name has not booked room ${room.roomNumber}.');
    }
  }
}

// Hotel class
class Hotel {
  List<Room> rooms;
  List<Guest> guests;

  Hotel() : rooms = [], guests = [];

  void addRoom(Room room) {
    rooms.add(room);
    print('Room ${room.roomNumber} added to the hotel.');
  }

  void removeRoom(Room room) {
    if (rooms.contains(room)) {
      rooms.remove(room);
      print('Room ${room.roomNumber} removed from the hotel.');
    } else {
      print('Room ${room.roomNumber} not found in the hotel.');
    }
  }

  void registerGuest(Guest guest) {
    guests.add(guest);
    print('Guest ${guest.name} registered with ID ${guest.guestId}.');
  }

  void bookRoom(String guestId, String roomNumber) {
    Guest? guest = getGuest(guestId);
    Room? room = getRoom(roomNumber);
    if (guest != null && room != null) {
      guest.bookRoom(room);
    } else {
      print('Invalid guest ID or room number.');
    }
  }

  void cancelRoom(String guestId, String roomNumber) {
    Guest? guest = getGuest(guestId);
    Room? room = getRoom(roomNumber);
    if (guest != null && room != null) {
      guest.cancelRoom(room);
    } else {
      print('Invalid guest ID or room number.');
    }
  }

  Room? getRoom(String roomNumber) {
    for (var room in rooms) {
      if (room.roomNumber == roomNumber) {
        return room;
      }
    }
    return null;
  }

  Guest? getGuest(String guestId) {
    for (var guest in guests) {
      if (guest.guestId == guestId) {
        return guest;
      }
    }
    return null;
  }
}

void main() {
  // Test the implementation
  Room room1 = Room('101', 'Single', 100.0, false);
  Room room2 = Room('102', 'Double', 150.0, false);
  Guest guest1 = Guest('Alice', 'G001');
  Guest guest2 = Guest('Bob', 'G002');
  Hotel hotel = Hotel();

  // Add rooms to hotel
  hotel.addRoom(room1);
  hotel.addRoom(room2);

  // Register guests
  hotel.registerGuest(guest1);
  hotel.registerGuest(guest2);

  // Book rooms
  hotel.bookRoom('G001', '101');
  hotel.bookRoom('G002', '102');

  // Cancel booking
  hotel.cancelRoom('G001', '101');
}