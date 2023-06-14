class Timer {
  int startTime;
  int interval;
  
  Timer (int timeInterval) {
    interval = timeInterval;
  }
  
  void begin() {
    startTime = millis();
  }
  
  boolean timefinish() {
    int totalTime = millis() - startTime;
    if (totalTime > interval) {
      return true;
    } else {
      return false;
    }
  }
}
