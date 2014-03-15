# T411

A Ruby wrapper for the t411.me API.

## Installation

Add this line to your application's Gemfile:

    gem 't411'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install t411

## Usage

### Authenticate

    T411.authenticate(username,password)

### User

####details
Get user details based on the id

     T411::Users.details(447571)
     {"username":"Rainstorm","gender":"Male","age":"999","avatar":"\/images\/avatar\/71\/447571_Rainstorm.gif?99287","downloaded":"23508433352","uploaded":"3253599763263"}

### Torrents

#### Categories
Get all categories

     T411::Torrents.categories
     {"210":{"id":"210","pid":"0","name":"Film\/Vid\u00e9o","cats":{"402":{"id":"402","pid":"210","name":"Vid\u00e9o-clips"},"433":{"id":"433","pid":"210","name":"S\u00e9rie TV"},"455":{"id":"455","pid":"21`

#### Terms
Get all terms

     T411::Torrents.terms
     {"234":{"11":{"type":"Application - Genre","mode":"single","terms":{"152":"Contr\u00f4le parental","184":"Science","1062":"Permis","163":"G\u00e9n\u00e9alogie","131":"Anonymat","174":"Nettoyage et Opti

#### Search
Search a torrent based on name, limit is optional. Default = 100

     T411::Torrents.search('debian',25)
     {"query":"debian","offset":0,"limit":"25","total":"13","torrents":[{"id":"4856719","name":"Debian 7.0 - \"Wheezy\" - amd64-netinst LITE","category":"234","rewritename":"debian-7-0-wheezy-amd64-netinst-

     T411::Torrents.search_with_category_id('debian',234)
     {"query":"debian","offset":0,"limit":"50","total":"9","torrents":[{"id":"4856719","name":"Debian 7.0 - \"Wheezy\" - amd64-netinst LITE","category":"234","rewritename":"debian-7-0-wheezy-amd64-netinst-l

#### Details
Details of a torrent

     T411::Torrents.details(4856719)
     {"id":"4856719","name":"Debian 7.0 - \"Wheezy\" - amd64-netinst LITE","category":"234","categoryname":"Linux","categoryimage":"t411-micro.png","rewritename":"debian-7-0-wheezy-amd64-netinst-lite","owne

#### Download
Download the torrent file. Path is optional, default = current working directory

     T411::Torrents.download(4856719, "/path/to/directory")

#### Top lists

     T411::Torrents.top100

     T411::Torrents.today

     T411::Torrents.month

### Bookmarks

#### Save
Save a bookmark

     T411::Bookmarks.save('4856719')
     {"id":"11803087"}


#### List
List all bookmarks

     T411::Bookmarks.list
    [{"id":"4856719","name":"Debian 7.0 - \"Wheezy\" - amd64-netinst LITE","category":"234","rewritename":"debian-7-0-wheezy-amd64-netinst-lite","seeders":"11","leechers":"1","comments":"5","isVerified":"1

#### Delete
Delete 1 or more bookmarks

     T411::Bookmarks.delete('4856719,4536589')

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
