package project.springbootHackaton.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.springbootHackaton.data.baseClasses.Booking;
import project.springbootHackaton.data.baseClasses.Desk;
import project.springbootHackaton.data.baseClasses.User;
import project.springbootHackaton.data.repository.BookingRepository;
import project.springbootHackaton.data.repository.DeskRepository;
import project.springbootHackaton.data.repository.UserRepository;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class BookingService {

    @Autowired
    private final BookingRepository bookingRepository;


    @Autowired
    private DeskRepository deskRepo;
    @Autowired
    private UserRepository userRepository;

    @Autowired
    public BookingService(BookingRepository bookingRepository) {
        this.bookingRepository = bookingRepository;
    }

    public List<Booking> getBookingsForDesk(Long deskId) {
        return bookingRepository.findByDeskId(deskId);
    }

    public boolean isDeskBooked(Long deskId, LocalDateTime startTime, LocalDateTime endTime) {
        List<Booking> bookings = bookingRepository.findByDeskId(deskId);
        if (bookings.isEmpty())
            return false;

        // Sort bookings by start time (optional)
        //bookings.sort(Comparator.comparing(Booking::getStartTime));

        for (int i = 0; i < bookings.size() - 1; i++) {
            Booking currentBooking = bookings.get(i);
            Booking nextBooking = bookings.get(i + 1);

            LocalDateTime currentBookingEndTime = currentBooking.getEndTime();
            LocalDateTime nextBookingStartTime = nextBooking.getStartTime();

            // Check if there is a gap between current booking's end time and next booking's start time
            if (currentBookingEndTime.isBefore(nextBookingStartTime) &&
                    currentBookingEndTime.plusMinutes(1).isBefore(nextBookingStartTime)) {
                return false; // There is a gap between bookings
            }
        }

        // No gap found between any consecutive bookings
        return true;
    }

    public List<Booking> getAll(){
        return bookingRepository.findAll();
    }


    public Booking createBooking(Long desk_id, LocalDateTime startTime, LocalDateTime endTime,String purpose,Long userID,Long deskID){
        Desk desk = deskRepo.findById(deskID).get();
        User user = userRepository.findById(userID).get();
        return new Booking(startTime,endTime,purpose,user,desk);

    }

    public void bookDesk(Long desk_id, LocalDateTime startTime, LocalDateTime endTime,String purpose,Long userID,Long deskID){
        if(userRepository.findById(userID).isEmpty())
            throw new IllegalArgumentException("User doesnt exist");
        User user = userRepository.findById(userID).get();
        if(deskRepo.findById(deskID).isEmpty())
            throw new IllegalArgumentException("Desk doesnt exist");
        if (isDeskBooked(deskID, startTime, endTime))
            throw new IllegalArgumentException("Desk is booked");
        bookingRepository.save(createBooking(desk_id,startTime,endTime,purpose,userID,deskID));



}

}