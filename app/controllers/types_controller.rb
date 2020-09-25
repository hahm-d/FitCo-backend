class TypesController < ApplicationController
    skip_before_action :authorized, only: [:index]
    before_action :find_type, only: [:destroy, :update]

    def index 
        types = Type.all
        render json: types.as_json(only: [:id, :category, :user_id])
    end

    def update
        @type.update(type_params)
        if @type.valid?
            render json: @type.to_json
        else
            render json: { error: 'failed to update type' }, status: :not_acceptable
        end
    end

    def destroy
        @type.destroy
        render json: { confirmation: 'Deleted' } 
    end

    private 

    def type_params
        params.require(:type).permit(:category, :user_id)
    end

    def find_type
        @type = Type.find(params[:id])
    end

end
