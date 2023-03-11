json.array! @faqs do |faq|
    json.extract! faq, :question, :answer, :id
end
  