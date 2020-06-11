# SUBMITION INFORMATION

## STUDENT
 Name:          Hoang Tung Dao
 ID:            s3624473
 
 Level attempted:  80+
 
 Bitbucket: https://bitbucket.org/DaoHoangTung/rad2020_s3624473/
 Heroku:    https://hello-world-1992.herokuapp.com/
 
 ### RAD USER INFO
 ```
user = User.create!(name: "RAD",
                    email: "rad2020rmit@gmail.com",
                    password: "Rails2020",
                    password_confirmation: "Rails2020",
                    mobile: "0909430116",
                    city: "Melbourne",
                    introduction: "I am beautiful !",
                    activated: true,
                    activated_at: Time.zone.now,
                    admin: true )

 ```
 
 Last Heroku deployment log:
 
 ```
 -----> Ruby app detected
 -----> Installing bundler 1.17.3
 -----> Removing BUNDLED WITH version in the Gemfile.lock
 -----> Compiling Ruby/Rails
 -----> Using Ruby version: ruby-2.5.7
 -----> Installing dependencies using bundler 1.17.3
        Running: bundle install --without development:test --path vendor/bundle --binstubs vendor/bundle/bin -j4 --deployment
        The dependency tzinfo-data (>= 0) will be unused by any of the platforms Bundler is installing for. Bundler is installing for ruby but the dependency is only for x86-mingw32, x86-mswin32, x64-mingw32, java. To add those platforms to the bundle, run `bundle lock --add-platform x86-mingw32 x86-mswin32 x64-mingw32 java`.
        Using rake 13.0.1
        Using CFPropertyList 2.3.6
        Using concurrent-ruby 1.1.6
        Using i18n 0.9.5
        Using minitest 5.14.1
        Using thread_safe 0.3.6
        Using tzinfo 1.2.7
        Using activesupport 5.2.4.3
        Using builder 3.2.4
        Using erubi 1.9.0
        Using mini_portile2 2.4.0
        Using nokogiri 1.10.9
        Using rails-dom-testing 2.0.3
        Using crass 1.0.6
        Using loofah 2.5.0
        Using rails-html-sanitizer 1.3.0
        Using actionview 5.2.4.3
        Using rack 2.2.2
        Using rack-test 1.1.0
        Using actionpack 5.2.4.3
        Using nio4r 2.5.2
        Using websocket-extensions 0.1.4
        Using websocket-driver 0.7.1
        Using actioncable 5.2.4.3
        Using globalid 0.4.2
        Using activejob 5.2.4.3
        Using mini_mime 1.0.2
        Using mail 2.7.1
        Using actionmailer 5.2.4.3
        Using activemodel 5.2.4.3
        Using arel 9.0.0
        Using activerecord 5.2.4.3
        Using mimemagic 0.3.5
        Using marcel 0.3.3
        Using activestorage 5.2.4.3
        Using execjs 2.7.0
        Using autoprefixer-rails 9.7.6
        Using bcrypt 3.1.12
        Using msgpack 1.3.3
        Using bootsnap 1.4.6
        Using rb-fsevent 0.10.4
        Using ffi 1.12.2
        Using rb-inotify 0.10.1
        Using sass-listen 4.0.0
        Using sass 3.7.4
        Using bootstrap-sass 3.3.7
        Using will_paginate 3.1.7
        Using bootstrap-will_paginate 1.0.0
        Using bundler 1.17.3
        Using mime-types-data 3.2020.0512
        Using mime-types 3.3.1
        Using carrierwave 1.2.2
        Using coffee-script-source 1.12.2
        Using coffee-script 2.4.1
        Using method_source 1.0.0
        Using thor 1.0.1
        Using railties 5.2.4.3
        Using coffee-rails 4.2.2
        Using unf_ext 0.0.7.7
        Using unf 0.1.4
        Using domain_name 0.5.20190701
        Using dry-inflector 0.2.0
        Using excon 0.73.0
        Using faker 1.7.3
        Using fission 0.5.0
        Using formatador 0.2.5
        Using fog-core 1.45.0
        Using multi_json 1.14.1
        Using fog-json 1.2.0
        Using ipaddress 0.8.3
        Using xml-simple 1.1.5
        Using fog-aliyun 0.3.10
        Using fog-xml 0.1.3
        Using fog-atmos 0.1.0
        Using fog-aws 2.0.1
        Using fog-brightbox 0.16.1
        Using fog-cloudatcost 0.1.2
        Using fog-digitalocean 0.4.0
        Using fog-dnsimple 1.0.0
        Using fog-dynect 0.0.3
        Using fog-ecloud 0.3.0
        Using fog-google 0.1.0
        Using fog-internet-archive 0.0.1
        Using fog-joyent 0.0.1
        Using fog-local 0.6.0
        Using fog-openstack 0.3.10
        Using json 2.3.0
        Using ovirt-engine-sdk 4.4.0
        Using http-accept 1.7.0
        Using http-cookie 1.0.3
        Using netrc 0.11.0
        Using rest-client 2.1.0
        Using rbovirt 0.1.7
        Using fog-ovirt 1.2.4
        Using fog-powerdns 0.2.0
        Using fog-profitbricks 4.1.1
        Using fog-rackspace 0.1.6
        Using fog-radosgw 0.0.5
        Using fog-riakcs 0.1.0
        Using fog-sakuracloud 1.7.5
        Using fog-serverlove 0.1.2
        Using fog-softlayer 1.1.4
        Using fog-storm_on_demand 0.1.1
        Using fog-terremark 0.1.0
        Using fog-vmfusion 0.1.0
        Using fog-voxel 0.1.0
        Using optimist 3.0.1
        Using rbvmomi 2.4.1
        Using fog-vsphere 3.3.1
        Using xmlrpc 0.3.0
        Using fog-xenserver 1.0.0
        Using fog 1.42.0
        Using jbuilder 2.10.0
        Using jquery-rails 4.4.0
        Using mini_magick 4.7.0
        Using pg 1.2.3
        Using puma 3.12.5
        Using sprockets 3.7.2
        Using sprockets-rails 3.2.1
        Using rails 5.2.4.3
        Using rails-ujs 0.1.0
        Using tilt 2.0.10
        Using sass-rails 5.1.0
        Using turbolinks-source 5.2.0
        Using turbolinks 5.2.1
        Using uglifier 4.2.0
        Bundle complete! 29 Gemfile dependencies, 126 gems now installed.
        Gems in the groups development and test were not installed.
        Bundled gems are installed into `./vendor/bundle`
        Bundle completed (0.57s)
        Cleaning up the bundler cache.
        The dependency tzinfo-data (>= 0) will be unused by any of the platforms Bundler is installing for. Bundler is installing for ruby but the dependency is only for x86-mingw32, x86-mswin32, x64-mingw32, java. To add those platforms to the bundle, run `bundle lock --add-platform x86-mingw32 x86-mswin32 x64-mingw32 java`.
 -----> Installing node-v10.15.3-linux-x64
 -----> Detecting rake tasks
 -----> Preparing app for Rails asset pipeline
        Running: rake assets:precompile
        Yarn executable was not detected in the system.
        Download Yarn at https://yarnpkg.com/en/docs/install
        I, [2020-05-27T23:33:01.863253 #291]  INFO -- : Writing /tmp/build_d2aaff331c9d33f5bb0995d2f659f6fa/public/assets/application-9271e518f57aaf206ae115494808e0d99c5ea971e6b19e561646f44af64f68e3.css
        I, [2020-05-27T23:33:01.864081 #291]  INFO -- : Writing /tmp/build_d2aaff331c9d33f5bb0995d2f659f6fa/public/assets/application-9271e518f57aaf206ae115494808e0d99c5ea971e6b19e561646f44af64f68e3.css.gz
        Asset precompilation completed (9.07s)
        Cleaning assets
        Running: rake assets:clean
        I, [2020-05-27T23:33:03.885673 #302]  INFO -- : Removed application-440abd3d963d18439c4740479a8bcf1531ad8c0892e76312fb584ecc5b64abd9.css
 -----> Detecting rails configuration
 ###### WARNING:
        You set your `config.active_storage.service` to :local in production.
        If you are uploading files to this app, they will not persist after the app
        is restarted, on one-off dynos, or if the app has multiple dynos.
        Heroku applications have an ephemeral file system. To
        persist uploaded files, please use a service such as S3 and update your Rails
        configuration.
        
        For more information can be found in this article:
          https://devcenter.heroku.com/articles/active-storage-on-heroku
        
 ###### WARNING:
        We detected that some binary dependencies required to
        use all the preview features of Active Storage are not
        present on this system.
        
        For more information please see:
          https://devcenter.heroku.com/articles/active-storage-on-heroku
        
 ###### WARNING:
        There is a more recent Ruby version available for you to use:
        
        2.5.8
        
        The latest version will include security and bug fixes, we always recommend
        running the latest version of your minor release.
        
        Please upgrade your Ruby version.
        
        For all available Ruby versions see:
          https://devcenter.heroku.com/articles/ruby-support#supported-runtimes
 ###### WARNING:
        No Procfile detected, using the default web server.
        We recommend explicitly declaring how to boot your server process via a Procfile.
        https://devcenter.heroku.com/articles/ruby-default-web-server
 -----> Discovering process types
        Procfile declares types     -> (none)
        Default types for buildpack -> console, rake, web
 -----> Compressing...
        Done: 58.6M
 -----> Launching...
        Released v31
        https://hello-world-1992.herokuapp.com/ deployed to Heroku
 ```