# RaceDay API Endpoint Plan

| HTTP Method | Route | Description | Role Required | Request Body | Expected Response |
|-------------|-------|-------------|---------------|--------------|-------------------|
| POST | /api/auth/register | Register a new user | None | { "email", "password", "fullName", "role" } | 201 Created - user details |
| POST | /api/auth/login | Login user | None | { "email", "password" } | 200 OK - { token, userId, role } |
| GET | /api/users/profile | Get current user profile | Any (logged in) | None | 200 OK - user profile |
| PUT | /api/users/profile | Update user profile | Any (logged in) | { "fullName", "email", "password" } | 200 OK - updated profile |
| GET | /api/events | Get all events | Any | None | 200 OK - list of events |
| GET | /api/events/{id} | Get event details | Any | None | 200 OK - event with categories |
| POST | /api/events | Create new event | Organiser | { "name", "description", "location", "startDate", "endDate" } | 201 Created - event details |
| PUT | /api/events/{id} | Update event | Organiser | { "name", "description", "location", "startDate", "endDate", "status" } | 200 OK - updated event |
| DELETE | /api/events/{id} | Delete event | Organiser | None | 204 No Content |
| POST | /api/events/{eventId}/categories | Add category to event | Organiser | { "name", "description", "distance", "minAge", "maxAge", "maxCapacity" } | 201 Created - category details |
| PUT | /api/categories/{id} | Update category | Organiser | { "name", "description", "distance", "minAge", "maxAge", "maxCapacity" } | 200 OK - updated category |
| DELETE | /api/categories/{id} | Delete category | Organiser | None | 204 No Content |
| POST | /api/events/{eventId}/enrol | Enrol in event | Participant | { "categoryId" } | 201 Created - enrolment details |
| GET | /api/enrolments | Get my enrolments | Participant | None | 200 OK - list of enrolments |
| GET | /api/events/{eventId}/enrolments | Get event enrolments | Organiser | None | 200 OK - list of enrolments |
| PUT | /api/enrolments/{id}/status | Update enrolment status | Organiser | { "status" } | 200 OK - updated enrolment |
| POST | /api/results | Submit result | Organiser | { "enrolmentId", "finishTime", "position", "status" } | 201 Created - result details |
| PUT | /api/results/{id} | Update result | Organiser | { "finishTime", "position", "status", "notes" } | 200 OK - updated result |
| GET | /api/events/{eventId}/results | Get event results | Any | None | 200 OK - list of results |