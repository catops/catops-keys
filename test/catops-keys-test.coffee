chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'catops-keys', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()
      brain:
        userForId: sinon.spy()

    require('../src/catops-keys')(@robot)

  it 'registers a respond listener', ->
    expect(@robot.respond).to.have.been.calledWith(/my public (ssh )?key is (.*)/i)

  it 'registers a respond listener', ->
    expect(@robot.respond).to.have.been.calledWith(/(what is |show )?my public (ssh )?key$/i)

  it 'registers a respond listener', ->
    expect(@robot.respond).to.have.been.calledWith(/(delete|remove|forget) my public (ssh )?key$/i)
