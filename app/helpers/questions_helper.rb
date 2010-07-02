module QuestionsHelper
  def categories_for(question)
    return "Uncategorised" if question.categories.blank?
    cat_list =""
    question.categories.each do |category|
      cat_list =  link_to(category.name, category)
      cat_list += ", " unless category == question.categories.last
    end
    cat_list
  end
end
