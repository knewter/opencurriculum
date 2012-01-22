# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'nokogiri'

sample_curriculum = <<-EOF
- Ultimate Goals
    - Communication Skill
        - Grammar
            - Subject
            - Verb
            - Direct Object
            - Indirect Object
            - Predicate Nominative
            - Predicate Adjective
            - Interjection
            - Conjunction
            - Complex Sentences
            - Compound Sentences
            - Compound / Complex Sentences
            - Types of Sentences
            - Diagramming
            - Nouns
                - classes of nouns
            - Verbs
                - active
                - linking / helping
            - Verbals
                - Gerunds
                - Participles
                - Infinitives
            - Prepositional Phrases
            - Phrases  and clauses
                - used as parts of speech
        - Punctuation
        - Voice / Tone
        - Audience
    - Analysis
        - Persuasion
        - Compare / Contrast
        - Poetry Exposition
        - Synthesis
        - Topical / Issue-based
        - Summary
        - Logical Coherence
        - Response-Essay (connecting work consumed to world experienced)
    - Cultural Learning
        - Major American Authors / Trends / Works
        - Major British Authors / Trends / Works
        - Major World Authors / Trends / Works
    - Technological Learning
        - Creation of an online portfolio 
        - email / attachment / file system management
    - Major Projects
        - Defense Paper:  Why I am Suited for Adult Life
        - Research Paper:  Original topic, student-chosen (primary / secondary sourcing)
        - Analytical Paper:  Picking apart a concept / topic with original thought (only primary sourcing)
EOF

def create_children(children, parent)
  puts parent.name
  children.select{|c| c.name == 'li'}.each do |child|
    text = child.children.detect{|c| c.class == Nokogiri::XML::Text }
    next unless text
    curr = Curriculum.create(name: text.text, parent_id: parent.id)
    ul = child.children.detect{|c| c.name == 'ul' }
    next unless ul
    lis = ul.children.select{|c| c.name == 'li' }
    next unless lis.any?
    create_children(lis, curr)
  end
end

c = Curriculum.create(name: 'Web School')

r = ::Redcarpet::Markdown.new(::Redcarpet::Render::XHTML)
x = Nokogiri.XML(r.render(sample_curriculum))
top = x.root.children.detect{|c| c.name == 'li'}

create_children([top], c)
