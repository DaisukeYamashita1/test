class ContentsController < LoginController

  def top
    @contents = Content.where(category_id:1)
  end

  def test
  end

  def show
    category_name = Content.find_by(id:params[:id]).category.name
    path_name = Content.find_by(id:params[:id]).path
    @aws_contents = Content.where(category_id:1)
    render template: "contents/#{category_name}/#{path_name}"    
  end

  def awswords
  end

end
