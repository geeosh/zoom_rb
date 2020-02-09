# frozen_string_literal: true

module Zoom
  module Actions
    module Recording
      # Get all recordings for a user's account
      def user_recording_list(*args)
        options = Zoom::Params.new(Utils.extract_options!(args))
        options.require(%i[user_id])
        Utils.parse_response self.class.get("/users/#{options[:user_id]}/recordings", query: options)
      end

      # Get all recordings for a meeting
      def meeting_recording_list(*args)
        options = Zoom::Params.new(Utils.extract_options!(args))
        options.require(%i[meeting_id])
        Utils.parse_response self.class.get("/meetings/#{options[:meeting_id]}/recordings", query: options)
      end

      # Delete all recordings for a meeting
      def meeting_recordings_delete(*args)
        options = Zoom::Params.new(Utils.extract_options!(args))
        options.require(%i[meeting_id])
        Utils.parse_response self.class.delete("/meetings/#{options[:meeting_id]}/recordings", query: options)
      end

      # Delete a single recording for a meeting
      def meeting_recording_delete(*args)
        options = Zoom::Params.new(Utils.extract_options!(args))
        options.require(%i[meeting_id recording_id])
        Utils.parse_response self.class.delete("/meetings/#{options[:meeting_id]}/recordings/#{options[:recording_id]}", query: options)
      end
    end
  end
end
