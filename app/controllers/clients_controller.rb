class ApplicationController < ActionController::API
    include ActionController::MimeResponds
end
  

class ClientsController < ApplicationController
    def by_name
        #@client = Client.find_by(name: params[:name]) #Forma 1
        @client = Log.find_by(name: params[:name]) #Forma 2
        if @client.nil?
            @respuesta = "Pregunta por un usuario válido. PD: Prueba con Gianca o Juan"
        else
            #@respuesta = "La cantidad de consultas realizadas es: #{@client.request_count}" #Forma 1
            @requests = Log.where("name = ?", @client.name)
            @respuesta = "La cantidad de consultas realizadas es: #{@requests.count - 1}\nDetalle (ignorar registro de ingreso):\n#{@requests.pluck(:request, :created_at)}"
        end
        
        respond_to do |format|
            format.js
        end

        render json: @respuesta
    end
end
