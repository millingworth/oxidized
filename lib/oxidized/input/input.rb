module Oxidized
  class Input
    include Oxidized::Config::Vars

    RescueFail = {
      :debug => [
        Errno::ECONNREFUSED,
      ],
      :warn => [
        IOError,
        Timeout::Error,
        Errno::ECONNRESET,
        Errno::EHOSTUNREACH,
        Errno::EPIPE,
      ],
    }
    class << self
      def inherited klass
        Oxidized.mgr.loader = { :class => klass }
      end
    end
  end
end
