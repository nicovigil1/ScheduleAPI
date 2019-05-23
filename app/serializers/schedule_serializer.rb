class ScheduleSerializer
  include FastJsonapi::ObjectSerializer
  set_id :object_id
  attributes :name, :appts
end
