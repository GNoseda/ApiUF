class ApplicationController < ActionController::API
    include ActionController::MimeResponds
end


class UfsController < ApplicationController
    def by_date
        #Levantar valor de UF
        @date = params[:date]
        @valor = Uf.find_by(date: @date)
        @respuesta = ""

        #Recoger datos del cliente
        #@cliente = Client.find_by(name: request.headers['X-CLIENTE']) #Forma 1
        @cliente = Log.find_by(name: request.headers['X-CLIENTE']) #Forma 2

        if @valor.nil?
            @respuesta = "Fecha mal ingresada o fuera de rango. Prueba con una fecha desde el 2020-01-01 hasta el 2020-02-29"
        else
            if @cliente.nil?
                @respuesta = "No eres cliente aún, debes solicitar ser ingresado a la Base de datos. PD: PRUEBA CON X-CLIENTE: Gianca o Juan"
            else

                #@cliente.request_count += 1 #Forma 1
                #@cliente.save #Forma 1

                Log.create(name: @cliente.name, request: @date) #Forma 2: Para guardar todo el historial de peticiones
                @respuesta = "El valor de la UF al #{@date} es de $#{@valor.value} CLP"     
            end
        end

        respond_to do |format|
            format.js
        end

        render json: @respuesta
    end
end
