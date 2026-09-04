INSERT INTO Roles (RoleName, Description) VALUES 
('Organiser', 'Can create and manage events'),
('Participant', 'Can enrol in events and view results');

INSERT INTO Users (RoleID, Email, PasswordHash, FullName) VALUES
(1, 'john@raceday.com', 'hashed_password_123', 'John Smith'),
(1, 'sarah@raceday.com', 'hashed_password_456', 'Sarah Johnson'),
(2, 'mike@email.com', 'hashed_password_789', 'Mike Thompson'),
(2, 'emma@email.com', 'hashed_password_101', 'Emma Davis');

INSERT INTO OrganiserProfiles (UserID, CompanyName, Website, ContactPhone) VALUES
(1, 'Fast Track Events', 'www.fasttrackevents.com', '555-0101'),
(2, 'Coastal Run Ltd', 'www.coastalrun.com', '555-0102');

INSERT INTO ParticipantProfiles (UserID, DateOfBirth, Gender, EmergencyContact, MedicalNotes) VALUES
(3, '1990-05-15', 'Male', 'Jane - 555-0103', 'No allergies'),
(4, '1985-12-22', 'Female', 'Robert - 555-0104', 'Mild asthma');

INSERT INTO Events (OrganiserID, Name, Description, Location, StartDate, EndDate, Status) VALUES
(1, 'City Marathon 2026', 'Annual city marathon', 'Downtown City Centre', '2026-11-15 07:00', '2026-11-15 18:00', 'open'),
(1, 'Summer Fun Run', 'Family friendly 5km', 'Central Park', '2026-12-01 08:00', '2026-12-01 12:00', 'draft'),
(2, 'Coastal Trail Run', 'Scenic trail run', 'Coastal Reserve', '2026-12-05 08:00', '2026-12-05 16:00', 'open');

INSERT INTO Categories (EventID, Name, Description, Distance, MinAge, MaxAge, MaxCapacity) VALUES
(1, 'Full Marathon', '42.2km full marathon', 42.20, 18, 65, 200),
(1, 'Half Marathon', '21.1km half marathon', 21.10, 16, 70, 300),
(1, '5km Fun Run', '5km charity run', 5.00, 8, 99, 150),
(2, '5km Walk', '5km leisure walk', 5.00, 5, 99, 100),
(2, '10km Run', '10km competitive run', 10.00, 12, 70, 80),
(3, '15km Trail', '15km challenging trail', 15.00, 18, 60, 100),
(3, '25km Endurance', '25km endurance trail', 25.00, 21, 55, 75);

INSERT INTO EventEnrolments (CategoryID, ParticipantID, Status, BibNumber) VALUES
(2, 3, 'approved', 'B001'),
(1, 4, 'pending', 'B002'),
(4, 3, 'approved', 'B003'),
(5, 4, 'pending', 'B004');

INSERT INTO Results (EnrolmentID, FinishTime, Position, Status) VALUES
(1, '01:45:30', 25, 'completed'),
(3, '00:28:45', 12, 'completed');