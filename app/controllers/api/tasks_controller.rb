# frozen_string_literal: true

module Api
  class TasksController < ApplicationController
    # APIs to manage tasks and their statuses
    before_action :set_task, only: %i[update destroy assign progress]

    def index
      @tasks = Task.all
      render json: @tasks
    end

    def create
      @task = Task.new(task_params)
      if @task.save
        render json: @task, status: :created
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end

    def update
      if @task.update(task_params)
        render json: @task
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @task.destroy
    end

    def assign
      user = User.find(params[:user_id])
      @task.user = user
      if @task.save
        render json: @task
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end

    def progress
      @task.progress = params[:progress]
      if @task.save
        render json: @task
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end

    def overdue
      @tasks = Task.where('due_date < ?', Date.today)
      render json: @tasks
    end

    def by_status
      @tasks = Task.where(status: params[:status])
      render json: @tasks
    end

    def completed
      start_date = params[:startDate].to_date
      end_date = params[:endDate].to_date
      @tasks = Task.where(completed_date: start_date..end_date)
      render json: @tasks
    end

    def statistics
      total_tasks = Task.count
      completed_tasks = Task.where.not(completed_date: nil).count
      percentage_completed = (completed_tasks.to_f / total_tasks) * 100
      render json: { total_tasks:, completed_tasks:,
                     percentage_completed: }
    end

    private

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :description, :due_date)
    end
  end
end
