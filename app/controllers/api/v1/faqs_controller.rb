class Api::V1::FaqsController < Api::V1::BaseController
    def index
      @faqs = Faq.all
      render json: @faqs
    end

    def create
      @faq = Faq.new(faq_params)
      if @faq.save
        render json: @faq, status: :created
      else
        render_error
      end
    end
    
    def destroy
    @faq= Faq.find(params[:id])
    @faq.destroy
    render json: { msg: 'Deleted' }
    end
  end