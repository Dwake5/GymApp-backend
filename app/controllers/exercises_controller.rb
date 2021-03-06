class ExercisesController < ApplicationController

    # Creates a exercise in the backend
    def create
        exercise = Exercise.new(reps: params[:reps], weight: params[:weight])
        if exercise.save
            render json: exercise
        else
            render json: {error: 'Exercise did not save.' }, status: 400
        end
    end

end