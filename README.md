# Kele

## Kele is Ruby gem API client to interact with the Bloc API

## Features
- Access mentor availability
- Retrieve roadmaps and checkpoints
- Retrieve messages, respond to existing messages, and create a new message thread
- Submit checkpoints

## Installation
Clone the repo by running:
```
$ git clone https://github.com/loganmartintran/kele.git
```

Build the gem locally by running:
```
$ gem build kele.gemspec
```

Install Httparty by running:
```
$ gem install httparty
```

## Usage
The client can be used as follows:
```
$ irb
>> require './lib/kele'
=> true
>> Kele.new("your_email_address@example.com", "your_password")
```
