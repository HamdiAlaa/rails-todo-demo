class JobsController < ActionController::API

def index
    
    # render :json => {:jobs => Job.all.map(&:to_json) }
    render :json => {:jobs => Job.all}
end

#update element

def update
    job = Job.find(params[:id])
    if job.update_attributes(job_params)
        render :json => {:job =>job}
    else
        render json: {status: 'ERROR', message: 'article can not be updated', 
        data:job.errors},status: :unprocessable_entity
    end
end

 # ADD NEW ONE ####################################################
 def create
    job =Job.new(job_params)
    if job.save
        #render json: {:job=>job}
    else
        render json: {status: 'ERROR', message: 'article can not be saved', 
        data:job.errors},status: :unprocessable_entity
    end
end

    # DELETE ####################################################

def destroy
    job = Job.find(params[:id])
    job.destroy
    render json: {status: 'SUCCESS', message: 'Deleted article', data:job},status: :ok
end

private
    def job_params
    params.require(:job).permit(:jobname, :status)
    end
end