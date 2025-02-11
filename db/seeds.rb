# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


contents = Content.create([{name:'Movie'},{name:'TV Show'},{name:'Channel'},{name:'Channel Program'}])
movies = App.create([
                    {
                      original_title: 'Star Wars: Episode V - The Empire Strikes Back',
                      year: 1980,
                      duration_in_seconds: 7440,
                      content_id: Content.find_by(name:'Movie')&.id,
                      availabilities: [{
                          "app": "netflix",
                          "market": "gb"
                        },
                        {
                          "app": "prime_video",
                          "market": "es"
                        }]
                    },
                    {
                      original_title: 'The Godfather',
                      year: 1972,
                      duration_in_seconds: 10500,
                      content_id: Content.find_by(name:'Movie')&.id,
                      availabilities: [{
                                         "app": "netflix",
                                         "market": "es"
                                       },
                                       {
                                         "app": "prime_video",
                                         "market": "gb"
                                       }]
                    },
                    {
                      original_title: 'Pulp Fiction',
                      year: 1994,
                      duration_in_seconds: 9900,
                      content_id: Content.find_by(name:'Movie')&.id,
                      availabilities: [{
                                         "app": "netflix",
                                         "market": "gb"
                                       },
                                       {
                                         "app": "prime_video",
                                         "market": "es"
                                       }]
                    },
                    {
                      original_title: "Interstellar",
                      year: 2014,
                      duration_in_seconds: 10140,
                      content_id: Content.find_by(name:'Movie')&.id,
                      availabilities: [
                        {
                          "app": "netflix",
                          "market": "gb"
                        },
                        {
                          "app": "prime_video",
                          "market": "gb"
                        }
                      ]
                    }

                  ])
tv_shows = App.create([
                      {
                        original_title: 'Kimetsu No Yaiba: Demon Slayer',
                        year: 2019,
                        duration_in_seconds: nil,
                        content_id: Content.find_by(name:'TV Show')&.id,
                        availabilities: []
                      }])
season1 = Season.create(app_id: App.find_by(original_title:'Kimetsu No Yaiba: Demon Slayer').id,original_title: 'Tanjiro Kamado, Unwavering Resolve Arc', number:1, year: 2019, duration_in_seconds: nil,
                        availabilities: [
                          {
                            "app": "netflix",
                            "market": "gb"
                          },
                          {
                            "app": "prime_video",
                            "market": "gb"
                          }
                        ])
season2 = Season.create(app_id: App.find_by(original_title:'Kimetsu No Yaiba: Demon Slayer').id,original_title: 'Demon Slayer: Kimetsu no Yaiba - Mugen Train Arc/Entertainment District Arc', number:2, year: 2022, duration_in_seconds: nil,
                        availabilities: [
                          {
                            "app": "netflix",
                            "market": "gb"
                          },
                          {
                            "app": "prime_video",
                            "market": "gb"
                          }
                        ])
season3 = Season.create(app_id: App.find_by(original_title:'Kimetsu No Yaiba: Demon Slayer').id,original_title: 'Demon Slayer: Kimetsu no Yaiba - Swordsmith Village Arc', number:3, year: 2023, duration_in_seconds: nil,
                        availabilities: [
                          {
                            "app": "netflix",
                            "market": "gb"
                          },
                          {
                            "app": "prime_video",
                            "market": "gb"
                          }
                        ])
chapter1 = Chapter.create(season_id: season1&.id, original_title:	'Cruelty',number:	1, year:	2019, duration_in_seconds:	3600)
chapter2 = Chapter.create(season_id: season2&.id, original_title:	'Flame Hashira Kyojuro Rengoku',number:	1, year:	2022, duration_in_seconds:	3600)
chapter3 = Chapter.create(season_id: season3&.id, original_title:	'Someone\'s Dream ',number:	1, year:	2023, duration_in_seconds:	3600)

nickelodeon = App.create(
                           {
                             original_title: 'Nickelodeon',
                             year: nil,
                             duration_in_seconds: nil,
                             content_id: Content.find_by(name:'Channel')&.id,
                             availabilities: [
                               {
                                 "app": "Amagi",
                                 "market": "gb",
                                 "stream_info": {
                                   "url": "https://www.example.com"
                                 }
                               },
                               {
                                 "app": "Amagi",
                                 "market": "es",
                                 "stream_info": {
                                   "url": "https://www.example.com/es"
                                 }
                               },
                               {
                                 "app": "Wurl",
                                 "market": "gb",
                                 "stream_info": {
                                   "url": "https://www.example.com"
                                 }
                               }
                             ]
                           })
euronews = App.create(
  {
    original_title: 'Euronews',
    year: nil,
    duration_in_seconds: nil,
    content_id: Content.find_by(name:'Channel')&.id,
    availabilities: [
      {
        "app": "Amagi",
        "market": "gb",
        "stream_info": {
          "url": "https://www.example.com"
        }
      },
      {
        "app": "Wurl",
        "market": "gb",
        "stream_info": {
          "url": "https://www.example.com"
        }
      }
    ]
  })
channel1 = Channel.create(number: 0,app_id:nickelodeon&.id)
channel2 = Channel.create(number: 1, app_id: euronews&.id)
channelprogram1 = ChannelProgram.create(channel_id: channel1&.id, original_title:	'SpongeBob', year: nil, duration_in_seconds:nil, content_id: Content.find_by(name:'Channel Program')&.id,
schedule:[
  {
    "start_time": "2024-03-11 08:00:00",
    "end_time": "2024-03-11 09:00:00"
  },
  {
    "start_time": "2024-03-11 09:00:00",
    "end_time": "2024-03-11 10:00:00"
  }
],availabilities: [
  {
    "app": "Amagi",
    "market": "gb"
  },
  {
    "app": "Wurl",
    "market": "gb"
  }
])
channelprogram2 = ChannelProgram.create(channel_id: channel1&.id, original_title:	'Hey Arnold!', year: nil, duration_in_seconds:nil, content_id: Content.find_by(name:'Channel Program')&.id,
schedule: [
  {
    "start_time": "2024-03-11 10:00:00",
    "end_time": "2024-03-11 11:00:00"
  },
  {
    "start_time": "2024-03-11 15:00:00",
    "end_time": "2024-03-11 16:00:00"
  }
],
  availabilities: [
  {
    "app": "Amagi",
    "market": "es"
  }
])
channelprogram3 = ChannelProgram.create(channel_id: channel2&.id, original_title:	'News 24hr', year: nil, duration_in_seconds:nil, content_id: Content.find_by(name:'Channel Program')&.id,
schedule: [
  {
    "start_time": "2024-03-11 06:00:00",
    "end_time": "2024-03-12 05:59:59"
  }
],
  availabilities: [
  {
    "app": "Amagi",
    "market": "gb"
  },
  {
    "app": "Wurl",
    "market": "gb"
  }
])
