# elective-system-api

## API

### Get a single student

`GET /students/:id`

Response

Status: 200 OK

```
[
  {
		"id": 1,
		"name": "Math",
		"teacher_name": "teacher_1"
		},
  {
		"id": 2,
		"name": "Chinese",
		"teacher_name": "teacher_1"
	}
]
```
### List teachers

`GET /teachers`

Paramerters: 

```
page: integer
per_page: integer, default: 20

```
Response:

Status: 200 OK

```
[
	{
		"id": 1,
		"name": "teacher_1",
	    "courses": [
		    {
		      "id": 1,
		      "name": "Math"
		    },
		    {
		      "id": 2,
		      "name": "Chinese"
	      }
      ],
  }
  ...
]

```
### Delete a teacher

`DELETE /teachers/:id`

Response:

204 No Content

## How to run

```
git clone git@github.com:pobing/elective-system-api.git
bundle install
rails db:setup
rails server
```

## Test

```
rails test
rails test test/controllers/
```

## API Test
Use [curl](http://curl.haxx.se/) or postman test API

```
curl -i http://localhost:3000/
curl -i http://localhost:3000/students/1
curl -i http://localhost:3000/teachers?per_page=2
curl -i -X DELETE http://localhost:3000/teachers/1
```