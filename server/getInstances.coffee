Q = require "q"

class InstanceData
    constructor (@AWS) ->
        if @AWS is null
            throw new Error "You must supply an AWS object."

    getInstanceData (region) ->
        ec2 = new @AWS.EC2()
        defer = q.defer()
        ec2.describeInstances (error, data) ->
            if error
               defer.reject( new Error error )
            else
                defer.resolve data.Reservations[0].Instances

        return defer.promise;

module.exports InstanceData
