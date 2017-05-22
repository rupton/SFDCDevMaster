trigger EmailToCase on Case (after insert) {
    System.debug('New Email to Case');
}