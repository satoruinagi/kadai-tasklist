class TasksController < ApplicationController
    def index
        @tasks = Task.all
    end
    
    def show
        @task = Task.find(params[:id])
    end
    
    def new
        @task = Task.new
    end
    
    def create
        @task = Task.new(task_params)
        
        if @task.save
          flash[:success] = 'Task が正しく作成されました'
          redirect_to @task
        else
          flash.now[:danger] = 'Task が作成されませんでした'
          render :new
        end
    end
    
    def edit
      @task = Task.find(params[:id])
    end
    
    def updata
      @task = Task.find(params[:id])
      
      if @task.updata(task_params)
        flash[:success] = 'Task は正常に更新されました'
        redirect_to @task
      else
        flash.now[:danger] = 'Task は更新されませんでした'
        render :edit
      end
    end
    
    def destroy
      @task = Task.find(params[:id])
      @task.destroy
      
      flash[:success] = 'Task は正常に削除されました'
      redirect_to task_url
    end
    
    private
    
    def task_params
      params.require(:task).permit(:content)
    end
    
end
