Admin.create_with(name: 'Administrador', password: '123456')
     .find_or_create_by!(email: 'admin@admin.com')

categories = %w[Documentário Filme Livro Seriado]
categories.each do |category|
  CategoryRecommendation.find_or_create_by!(name: category)
end

professor_categories = %w[Efetivo Temporário]
professor_categories.each do |category|
  ProfessorCategory.find_or_create_by!(name: category)
end

titles = [
  { name: 'Especialista', abbrev: 'Esp.' },
  { name: 'Mestre', abbrev: 'Me.' },
  { name: 'Doutor', abbrev: 'Dr.' }
]

titles.each do |title|
  ProfessorTitle.find_or_create_by!(name: title[:name], abbrev: title[:abbrev])
end

#########
#  @type Activity
#######

tcc_activity = Activity.create_with(description: 'descricao').find_or_create_by!(
  name: I18n.t('helpers.tcc')
)

#########
#  @type StaticPage
#######

StaticPage.find_or_create_by!(
  title: I18n.t('helpers.instruction_subscription'),
  content: '## conteudo',
  permalink: 'instruction_subscription',
  fixed: true
)

StaticPage.find_or_create_by!(
  title: I18n.t('helpers.be_our_student'),
  content: '## conteudo',
  permalink: 'be_our_student',
  fixed: true
)

StaticPage.find_or_create_by!(
  title: I18n.t('helpers.course_about'),
  content: '## conteudo',
  permalink: 'course_about',
  fixed: true
)
gallery_contexts = %w[course static_page]
gallery_contexts.each do |context|
  Gallery.find_or_create_by!(context: context)
end
