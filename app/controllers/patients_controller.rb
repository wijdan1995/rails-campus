class PatientsController < ApplicationController
    def index
        @patients = Patient.all
    end
    def show
        @patient = Patient.find(params[:id])
    end
    def destroy
        @patient = Patient.find(params[:id])
        @patient.destroy

        redirect_to patients_path
    end
    def new
        @patient = Patient.new
    end
    def create
        @patient = Patient.create(patients_params)

        redirect_to patients_path(@patient)
    end
    def edit
        @patient = Patient.find(params[:id])
    end
    def update
        @patient = Patient.find(params[:id])
        @patient.update(patients_params)

        redirect_to patients_path(@patient)
    end
    def patients_params
        params.require(:patient).permit(:first_name ,:last_name, :diagnosis,:born_on)
    end
end


#Patient.create({first_name:"Wijdan", last_name:"Kuddah", diagnosis:"Flu", born_on:Date.parse('1995-01-05')})