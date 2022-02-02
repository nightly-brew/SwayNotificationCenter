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

            if (param.sound_file != null && play_sound_file (param.sound_file)) return;
            if (param.sound_name != null && play_named_sound (param.sound_name)) return;

            // Fallback to default sound if none was explicitly defined
            play_named_sound ("message-new-instant");
        }

        private bool play_sound_file (string sound_file) {
            int code = context.play (0, Canberra.PROP_MEDIA_FILENAME, sound_file);
            if (code == Canberra.SUCCESS) {
                return true;
            }
            stderr.printf ("Could not play sound file '%s'\n", sound_file);
            stderr.printf ("libcanberra error %i: %s\n", code, Canberra.strerror (code));
            return false;
        }

        private bool play_named_sound (string sound_name) {
            int code = context.play (0, Canberra.PROP_EVENT_ID, sound_name);
            if (code == Canberra.SUCCESS) {
                return true;
            }
            stderr.printf ("Could not play named sound '%s'\n", sound_name);
            stderr.printf ("libcanberra error %i: %s\n", code, Canberra.strerror (code));
            return false;
        }
    }
}
