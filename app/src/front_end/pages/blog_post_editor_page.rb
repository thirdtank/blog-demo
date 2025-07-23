class BlogPostEditorPage < AppPage
  def initialize(form: nil)
    @form = form || NewBlogPostForm.new
  end

  def page_template
    h1 { "Write a new post" }
    brut_form do
      FormTag(for: @form) do
        label do
          Inputs::InputTag(form: @form,input_name: :title, autofocus: true)
          div { t([:form, :title]) }
          ConstraintViolations(form: @form, input_name: :title) 
        end
        label do
          Inputs::TextareaTag(form: @form,input_name: :content, rows: 10)
          div { t([:form, :content] ) }
          ConstraintViolations(form: @form, input_name: :content)
        end

        button { t([:form,:post]) }
      end
    end
  end
end
