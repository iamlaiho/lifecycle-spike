class SubmissionsController < ApplicationController

  def create
    # {
    #   "id": "1",
    #   "input_fields_attributes": [
    #     {
    #       "id": "2",
    #       "value": "This is an input"
    #     }
    #   ]
    # }
    permitted_params = params.require(:submission).permit(
      :id,
      :input_fields_attributes => [
        :id,
        :value
      ]
    )

    submission = Submission.find(permitted_params[:id])
    submission.assign_attributes(permitted_params)
    submission.save!
  end
end
