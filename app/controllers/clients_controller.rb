class ClientsController < ApplicationController
    def by_name
        @client = Client.find_by(name: params[:name])
        if @client.nil?
            @respuesta = "Pregunta por un usuario válido. PD: Prueba con Gianca o Juan"
        else
            @respuesta = "La cantidad de consultas realizadas es: #{@client.request_count}"
        end
        
        render json: @respuesta
    end
end
