# RaceDay API Endpoint Plan

| HTTP Method | Route | Description | Role Required | Request Body | Expected Response |
|-------------|-------|-------------|---------------|--------------|-------------------|
| POST | /api/auth/register | Register a new user | None | { "email", "password", "fullName", "role" } | 201 Created - user details, 400 Bad Request - validation errors, 409 Conflict - email already exists |
| POST | /api/auth/login | Login user | None | { "email", "password" } | 200 OK - { token, userId, role }, 401 Unauthorized - invalid credentials |
| GET | /api/users/profile | Get current user profile | Any (logged in) | None | 200 OK - user profile, 401 Unauthorized - not logged in |
| PUT | /api/users/profile | Update user profile | Any (logged in) | { "fullName", "email", "password" } | 200 OK - updated profile, 400 Bad Request - validation errors |
| GET | /api/events | Get all events | Any | None | 200 OK - list of events, 400 Bad Request - invalid filters |
| GET | /api/events/{id} | Get event details | Any | None | 200 OK - event with categories, 404 Not Found - event not found |
| POST | /api/events | Create new event | Organiser | { "name", "description", "location", "startDate", "endDate" } | 201 Created - event details, 400 Bad Request - validation errors |
| PUT | /api/events/{id} | Update event | Organiser | { "name", "description", "location", "startDate", "endDate", "status" } | 200 OK - updated event, 403 Forbidden - not the organiser, 404 Not Found - event not found |
| DELETE | /api/events/{id} | Delete event | Organiser | None | 204 No Content, 403 Forbidden - not the organiser, 404 Not Found - event not found |
| POST | /api/events/{eventId}/categories | Add category to event | Organiser | { "name", "description", "distance", "minAge", "maxAge", "maxCapacity" } | 201 Created - category details, 400 Bad Request - validation errors, 404 Not Found - event not found |
| PUT | /api/categories/{id} | Update category | Organiser | { "name", "description", "distance", "minAge", "maxAge", "maxCapacity" } | 200 OK - updated category, 403 Forbidden - not the organiser, 404 Not Found - category not found |
| DELETE | /api/categories/{id} | Delete category | Organiser | None | 204 No Content, 409 Conflict - category has enrolments, 404 Not Found - category not found |
| POST | /api/events/{eventId}/enrol | Enrol in event | Participant | { "categoryId" } | 201 Created - enrolment details, 400 Bad Request - invalid category, 409 Conflict - category full, 404 Not Found - event/category not found |
| GET | /api/enrolments | Get my enrolments | Participant | None | 200 OK - list of enrolments, 401 Unauthorized - not logged in |
| GET | /api/events/{eventId}/enrolments | Get event enrolments | Organiser | None | 200 OK - list of enrolments, 403 Forbidden - not the organiser, 404 Not Found - event not found |
| PUT | /api/enrolments/{id}/status | Update enrolment status | Organiser | { "status" } | 200 OK - updated enrolment, 403 Forbidden - not the organiser, 404 Not Found - enrolment not found |
| POST | /api/results | Submit result | Organiser | { "enrolmentId", "finishTime", "position", "status" } | 201 Created - result details, 400 Bad Request - result already exists, 404 Not Found - enrolment not found |
| PUT | /api/results/{id} | Update result | Organiser | { "finishTime", "position", "status", "notes" } | 200 OK - updated result, 403 Forbidden - not the organiser, 404 Not Found - result not found |
| GET | /api/events/{eventId}/results | Get event results | Any | None | 200 OK - list of results, 404 Not Found - event not found |