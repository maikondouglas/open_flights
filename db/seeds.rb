# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

airlines = Airline.create([
                            {
                              name: 'United Airlines',
                              image_url: 'https://open-flights.s3.amazonaws.com/United-Airlines.png'
                            },
                            {
                              name: 'Southewst',
                              image_url: 'https://open-flights.s3.amazonaws.com/Southwest-Airlines.png'
                            },
                            {
                              name: 'Delta',
                              image_url: 'https://open-flights.s3.amazonaws.com/Delta.png'
                            },
                            {
                              name: 'Alaska Airlines',
                              image_url: 'https://open-flights.s3.amazonaws.com/Alaska-Airlines.png'
                            },
                            {
                              name: 'JetBlue',
                              image_url: 'https://open-flights.s3.amazonaws.com/JetBlue.png'
                            },
                            {
                              name: 'American Airlines',
                              image_url: 'https://open-flights.s3.amazonaws.com/American-Airlines.png'
                            }
                          ])

Review.create([
                {
                  title: 'Great airline',
                  description: 'I had a great time with this airline',
                  score: 5,
                  airline: airlines.first
                },
                {
                  title: 'Bad airline',
                  description: 'I had a bad time with this airline',
                  score: 1,
                  airline: airlines.first
                }
              ])
