# Kumogata2::Plugin::YAML

## Installation

Add this line to your application's Gemfile:

```ruby
gem "kumogata2-plugin-yaml", git: "https://github.com/y13i/kumogata2-plugin-yaml.git"
```

## Usage

See [winebarrel/kumogata2](https://github.com/winebarrel/kumogata2).

## Template Example

```yaml
---
AWSTemplateFormatVersion: '2010-09-09'
Description: |
  Kumogata Sample Template
  You can use Here document!
Parameters:
  InstanceType:
    Default: t2.micro
    Description: Instance Type
    Type: String
Resources:
  myEC2Instance:
    Type: AWS::EC2::Instance
    Properties:
      ImageId: ami-XXXXXXXX
      InstanceType:
        Ref: InstanceType
      KeyName: your_key_name
      UserData:
        Fn::Base64: |
          #!/bin/bash
          yum install -y httpd
          service httpd start
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/y13i/kumogata2-plugin-yaml. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
