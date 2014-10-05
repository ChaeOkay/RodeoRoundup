#Rodeo Roundup

Study in collecting serialized resources and error messages in a non-restful way to minimize the number of client api calls.

Usecase: As a client rendering dashboard information, I can request multiple resources and parse the information in the same manner as a single resource show call.

Sample request:
```
http://someurlthatdoesnotexistyet.com/dashboard?resources[]=members&resources[]=organizations
```
Sample response:
```
{
  "members":[
    {
      "id":1,
      "username":"member1",
      "first_name":"Beatrix",
      "last_name":"Kiddo",
      "full_name":"Beatrix Kiddo"
    },
    {
      "id":2,
      "username":"member2",
      "first_name":"Felix",
      "last_name":"TheHousecat",
      "full_name":"Felix Thehousecat"
    }
  ],
  "organizations":[
    {
      "id":1,
      "name":"ATL",
      "address_1":"1 Peachtree",
      "address_2":null,
      "city":"Atlanta",
      "state":"GA",
      "zip":"30309",
      "phone":"000-000-00000"
    },
    {
      "id":2,
      "name":"NYC",
      "address_1":"100 Broadway",
      "address_2":null,
      "city":"New York",
      "state":"NY",
      "zip":"10007",
      "phone":"111-111-1111"
    },
    {
      "id":3,
      "name":"MI",
      "address_1":"1010 Saginaw",
      "address_2":null,
      "city":"Lansing",
      "state":"MI",
      "zip":"48917",
      "phone":"222-222-2222"
    }
  ]
}
```
