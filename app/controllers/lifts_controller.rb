class LiftsController < ApplicationController

    # Creates a lift in the backend
    def create
        lift = Lift.new(reps: params[:reps], weight: params[:weight])
        if lift.save
            render json: lift
        else
            render json: {error: 'Lift did not save.' }, status: 400
        end
    end

end