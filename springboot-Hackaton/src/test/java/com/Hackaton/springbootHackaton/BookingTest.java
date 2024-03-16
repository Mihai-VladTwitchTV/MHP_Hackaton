package com.Hackaton.springbootHackaton;


import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import project.springbootHackaton.data.baseClasses.Booking;
import project.springbootHackaton.data.repository.BookingRepository;
import project.springbootHackaton.service.BookingService;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.when;

class BookingTest {

    @Mock
    private BookingRepository bookingRepository;

    @InjectMocks
    private BookingService bookingService;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.initMocks(this);
    }

    @Test
    void testIsDeskBooked_NoBookings_ReturnsFalse() {
        Long deskId = 1L;
        LocalDateTime startTime = LocalDateTime.now();
        LocalDateTime endTime = startTime.plusHours(1);

        when(bookingRepository.findByDeskId(deskId)).thenReturn(new ArrayList<>());

        boolean result = bookingService.isDeskBooked(deskId, startTime, endTime);

        assertFalse(result);
    }

    @Test
    void testIsDeskBooked_WithBookings_ReturnsTrue() {
        Long deskId = 1L;
        LocalDateTime startTime = LocalDateTime.now();
        LocalDateTime endTime = startTime.plusHours(1);

        List<Booking> bookings = new ArrayList<>();
        bookings.add(new Booking(startTime.minusHours(2), startTime.minusHours(1), "Purpose", null, null));
        bookings.add(new Booking(startTime.plusHours(2), endTime.plusHours(1), "Purpose", null, null));

        when(bookingRepository.findByDeskId(deskId)).thenReturn(bookings);

        boolean result = bookingService.isDeskBooked(deskId, startTime, endTime);

        assertFalse(result);
    }
}