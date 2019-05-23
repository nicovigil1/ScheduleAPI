# README

## Endpoints 


### Schedules
```
post /api/v1/schedules?name=EXAMPLE
```
returns a list of all current schedules

<br>

```
get /api/v1/schedules
```
returns a list of all schedules currently available

<br>

```
delete /api/v1/schedules/:name
```
returns a list of all current schedules post deletion

### Appointments 

```
post '/api/v1/appointments/:schedule_name?start=1&end=2'
```
creates a new appointment for a given schedule 

<br>

```
get '/api/v1/appointments'
```
returns a list of each appointment from all schedules

<br>

```
delete '/api/v1/appointments/:schedule_name?start=3'
```
deletes an appointment for a given schedule
