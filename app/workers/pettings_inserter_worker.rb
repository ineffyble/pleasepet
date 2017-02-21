class PettingsInserterWorker
  include Sidekiq::Worker

  def perform(petted_at, petted_id, petter_id)
    petting = {
      petted_at: petted_at,
      petted_id: petted_id
    }
    if petter_id
      petting[:petter_id] = petter_id
    end
    petting_object = Petting.new(petting)
    petting_object.save!
  end
end
