class ExamsController < ApplicationController
  load_and_authorize_resource

  def show
    redirect_to [:edit, @exam] unless @exam.started?
  end

  def edit
    redirect_to @exam if @exam.started?
    @exam.start
  end

  def update
    if @exam.finished?
      redirect_to @exam
    elsif @exam.update_attributes(exam_params)
      @exam.finish
      redirect_to @exam, success: t("messages.exams.finished")
    else
      render :edit
    end
  end

  private
  def exam_params
    params.require(:exam).permit results_attributes: [:id, :answer_id]
  end
end