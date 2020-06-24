import 'package:flutter/material.dart';
import 'package:hackerstudiopro/bug_bounty/web_main.dart';

class BountyFourteen extends StatefulWidget {
  @override
  _BountyFourteenState createState() => _BountyFourteenState();
}

class _BountyFourteenState extends State<BountyFourteen> {
  var text = '''
  What is GraphQL?

GraphQL is a data query language developed by Facebook and publicly released in 2015. It is an alternative to REST API.

Even if you don’t see any GraphQL out there, it is likely you’re already using it since it’s running on some big tech giants like Facebook, GitHub, Pinterest, Twitter, HackerOne and a lot more.

A few key points on this technology

    GraphQL provides a complete and understandable description of the data in the API and gives clients the power to ask for exactly what they need. Queries always return predictable results.

    While typical REST APIs require loading from multiple URLs, GraphQL APIs get all the data your app needs in a single request.

    GraphQL APIs are organized in terms of types and fields, not endpoints. You can access the full capabilities of all your data from a single endpoint.

    GraphQL is strongly typed to ensure that application only ask for what’s possible and provide clear and helpful errors.

    New fields and types can be added to the GraphQL API without impacting existing queries. Aging fields can be deprecated and hidden from tools.

Before we start diving into the GraphQL security landscape, here is a brief recap on how it works. The official documentation is well written and was really helpful.

A GraphQL query looks like this:

Basic GraphQL Query

query{
	user{
		id
		email
		firstName
		lastName
	}
}

While the response is JSON:

Basic GraphQL Response

{
	"data": {
		"user": {
			"id": "1",
			"email": "paolo@doyensec.com",
			"firstName": "Paolo",
			"lastName": "Stagno"
		}
	}
}


As a pentester, I would recommend to look for requests issued to “/graphql” or “/graphql.php” since those are usual GraphQL endpoint names; you should also search for “/graphiql”, ”graphql/console/”, online GraphQL IDEs to interact with the backend, and “/graphql.php?debug=1” (debugging mode with additional error reporting) since they may be left open by developers.

When testing an application, verify whether requests can be issued without the usual authorization token header:
  ''';

  var text1 = '''
  Since the GraphQL framework does not provide any means for securing your data, developers are in charge of implementing access control as stated in the documentation:

    “However, for a production codebase, delegate authorization logic to the business logic layer”.

Things may go wrong, thus it is important to verify whether a user without proper authentication and/or authorization can request the whole underlying database from the server.

When building an application with GraphQL, developers have to map data to queries in their chosen database technology. This is where security vulnerabilities can be easily introduced, leading to Broken Access Controls, Insecure Direct Object References and even SQL/NoSQL Injections.

As an example of a broken implementation, the following request/response demonstrates that we can fetch data for any users of the platform (cycling through the ID parameter), while simultaneously dumping password hashes:

Query

query{
	user(id: 165274){
		id
		email
		firstName
		lastName
		password
	}
}

Response

{
	"data": {
		"user": {
			"id": "165274",
			"email": "johndoe@mail.com",
			"firstName": "John",
			"lastName": "Doe"
			"password": "5F4DCC3B5AA765D61D8327DEB882CF99"
		}
	}
}

Another thing that you will have to check is related to information disclosure when trying to perform illegal queries:

Information Disclosure

{
	"errors": [
		{
			"message": "Invalid ID.",
			"locations": [
				{
					"line": 2,
					"column": 12
				}
				"Stack": "Error: invalid ID\n at (/var/www/examples/04-bank/graphql.php)\n"
      			]
		}
	]
}

Even though GraphQL is strongly typed, SQL/NoSQL Injections are still possible since GraphQL is just a layer between client apps and the database. The problem may reside in the layer developed to fetch variables from GraphQL queries in order to interrogate the database; variables that are not properly sanitized lead to old simple SQL Injection. In case of Mongodb, NoSQL injection may not be that simple since we cannot “juggle” types (e.g. turning a string into an array. See PHP MongoDB Injection).

GraphQL SQL Injection

mutation search(\$filters Filters!){
	authors(filter: \$filters)
	viewer{
		id
		email
		firstName
		lastName
	} 
}

{
	"filters":{
		"username":"paolo' or 1=1--"
		"minstories":0
	}
}

Beware of nested queries! They can allow a malicious client to perform a DoS (Denial of Service) attack via overly complex queries that will consume all the resources of the server:

Nested Query

query {
 stories{
  title
  body
  comments{
   comment
   author{
    comments{
     author{
      comments{
       comment
       author{
        comments{
         comment
         author{
          comments{
           comment
           author{
            name
           }
          }
         }
        }
       }
      }
     }
    }
   }
  }
 }
}

An easy remediation against DoS could be setting a timeout, a maximum depth or a query complexity threshold value.

Keep in mind that in the PHP GraphQL implementation:

    Complexity analysis is disabled by default

    Limiting Query Depth is disabled by default

    Introspection is enabled by default. It means that anybody can get a full description of your schema by sending a special query containing meta fields type and schema

Outro

GraphQL is a new interesting technology, which can be used to build secure applications. Since developers are in charge of implementing access control, applications are prone to classical web application vulnerabilites like Broken Access Controls, Insecure Direct Object References, Cross Site Scripting (XSS) and Classic Injection Bugs. As any technology, GraphQL-based applications may be prone to development implementation errors like this real-life example:

    “By using a script, an entire country’s (I tested with the US, the UK and Canada) possible number combinations can be run through these URLs, and if a number is associated with a Facebook account, it can then be associated with a name and further details (images, and so on).”

  ''';
   @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0xFFF5CEB8),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => WebMain())),
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2BEA1),
                        // color:Colors.orange,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                  ),
                ),
                Text("GraphQL",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold)),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: <Widget>[
                        Text(
                          text,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                       Container(child: Image.asset('assets/images/graph.png')),
                        RaisedButton(
                          child: Text(
                              "Follow me on Social Media if you have Questions"),
                          onPressed: () {
                            followMe();
                          },
                          color: Color(0xFFF2BEA1),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void followMe() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Color(0xFFF5CEB8),
            title: Text('Follow me'),
            content: Text("Twitter: @Millime64755564"),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.pop(context), child: Text('Exit'))
            ],
          );
        });
  }
}
