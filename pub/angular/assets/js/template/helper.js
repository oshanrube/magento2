function sprintf(json) {
    if (json.message !== undefined) {
        var message = json.message;
        while (matches = message.match(/%([A-z0-9]+)/)) {
            message = message.replace(matches[0], json.parameters[matches[1]]);
        }
        return message;
    } else {
        return "We cant contact the server right now, please try again";
    }
}