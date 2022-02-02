namespace SwayNotificatonCenter {
    public class NotiPlayer : Object {

        private Canberra.Context context;

        public NotiPlayer () {
            Canberra.Context.create (out context);
        }

        public void play_sound (NotifyParams param) {
            if (param.suppress_sound) {
                return;
            }

            if (param.sound_file != null) {
                int code = context.play (0, Canberra.PROP_MEDIA_FILENAME, param.sound_file);
                if (code == Canberra.SUCCESS) {
                    return;
                }
                stderr.printf (Canberra.strerror (code) + "\n");
            }
            if (param.sound_name != null) {
                int code = context.play (0, Canberra.PROP_EVENT_ID, param.sound_name);
                if (code == Canberra.SUCCESS) {
                    return;
                }
                stderr.printf (Canberra.strerror (code) + "\n");
            }

            // Fallback to default sound if none was explicitly defined
            int code = context.play (0, Canberra.PROP_EVENT_ID, "message-new-instant");
            if (code == Canberra.SUCCESS) {
                return;
            }
            stderr.printf (Canberra.strerror (code) + "\n");
        }
    }
}
