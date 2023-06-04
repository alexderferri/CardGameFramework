function EventSubscribe(_event, _func) {
    with (oGameManager) {
        subscribe(other.id, _event, _func);
        return true;
    }
    return false;
}

function EventUnsubscribe(_event) {
    with (oGameManager) {
        unsubscribe(other.id, _event);
        return true;
    }
    return false;
}

function EventUnSubscribeAll() {
    with (oGameManager) {
        unsubscribe_all(other.id);
        return true;
    }
    return false;
}

function EventFire(_event, _data) {
    with (oGameManager) {
        publish(_event, _data);
        return true;
    }
    return false;
}