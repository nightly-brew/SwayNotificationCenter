namespace SwayNotificatonCenter {
    public class Constants {
        public string tmp_get_css = """
.notification {
  border-radius: 10px;
  margin: 6px 12px;
  box-shadow: 0px 2px 4px 2px rgba(0, 0, 0, 0.5);
  padding: 0;
}

.notification-content {
  background: transparent;
  padding: 6px;
  border-radius: 10px;
}

.close-button {
  background: black;
  color: white;
  box-shadow: 0px 2px 4px 2px rgba(0, 0, 0, 0.3);
  margin: 0 4px;
  padding: 0px;
  border-radius: 100%;
}

.close-button:hover {
  background: rgb(40, 40, 40);
  transition: all 0.15s ease-in-out;
  opacity: 0.9;
}

.notification-default-action,
.notification-action {
  background: rgb(58, 58, 58);
}

.notification-default-action:hover,
.notification-action:hover {
  background: rgb(68, 68, 68);
}

.notification-default-action {
  border-radius: 10px;
}

.notification-default-action:not(:only-child) {
  border-bottom-left-radius: 0px;
  border-bottom-right-radius: 0px;
}

.notification-action {
  border-radius: 0px;
  border-top: none;
}

.notification-action:first-child {
    border-bottom-left-radius: 10px;
}
.notification-action:last-child {
    border-bottom-right-radius: 10px;
}

.image {}

.summary {
  color: white;
}

.time {
  color: white;
}

.body {
  background: transparent;
  color: white;
}

.control-center {
  background: rgba(0, 0, 0, 0.7);
}

.floating-notifications {
  background: transparent;
}
            """;
    }
}
