package com.mentorfinder.flutter_hello_world

import Api
import SearchReply
import SearchRequest
import io.flutter.embedding.engine.plugins.FlutterPlugin

class MyApi : Api {
    override fun search(request: SearchRequest, callback: (Result<SearchReply>) -> Unit) {
        var query = request.query;
        println("query "+query);
        val reply = SearchReply("reply"+query);
        val result = Result.success(reply);
        callback(result);
    }
}