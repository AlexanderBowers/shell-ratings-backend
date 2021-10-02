class ShellsController < ApplicationController

    def index
        shells = Shell.all
        render json: shells
    end

    def show
        shell = Shell.find_by(name: params[:name])
        render json: shell
    end

end
