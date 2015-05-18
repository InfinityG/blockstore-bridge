# blockstore-bridge
A RESTful wrapper for namesystem/blockstore. Allows blockstore operations via HTTP endpoints.

# Prerequisites
- Ruby
- Bundler
- Blockstore (installed and running)

## Installation
- Clone the repo
- Run `bundler install` to install gem dependencies
- Once dependencies installed, run `rackup` to start the rack web server (will start on localhost:9000 by default)

## Authentication
- Uses basic auth 
    - username: ''
    - password: (see */api/constants/configuration_constants.rb* for api_auth_token)

## Bitcoin secret
 - As this bridge is intended for use by an organization, the private Bitcoin key is held in 
 */api/constants/configuration_constants.rb* ("bitcoin_secret"). This means that JSON payloads don't 
 need to contain the key

## Endpoints (see */api/routes/names.rb*)
- Preorder
    - Endpoint: /preorder
    - Method: POST
    - Headers: Authorization
    - Payload e.g.: {"name":"swiftonsecurity"}
    
- Register
    - Endpoint: /register
    - Method: POST
    - Headers: Authorization
    - Payload e.g.: {"name":"swiftonsecurity"}

- Update
    - Endpoint: /update
    - Method: POST
    - Headers: Authorization
    - Payload e.g.: {"name":"swiftonsecurity", "data":"<data>"}

- Transfer
    - Endpoint: /transfer
    - Method: POST
    - Headers: Authorization
    - Payload e.g.: {"name":"swiftonsecurity", "address":"<new owner>"}

- Lookup
    - Endpoint: /lookup
    - Method: GET
    - eg: /lookup/swiftonsecurity
