class Search < ActiveRecord::Base
  belongs_to :user

  def announces
  @announces ||= find_announces
end

private

def find_announces
  announces = Announce.order(:locality)
  announces = announces.where("locality like ?", "%#{slocality}%") if slocality.present?
  # products = products.where(category_id: category_id) if category_id.present?
  # products = products.where("price >= ?", min_price) if min_price.present?
  # products = products.where("pri
  announces
end


def keyword_conditions
  ["@announces.locality LIKE ?", "%#{slocality}%"] unless slocality.blank?
end

# def minimum_price_conditions
#   ["products.price >= ?", minimum_price] unless minimum_price.blank?
# end

# def maximum_price_conditions
#   ["products.price <= ?", maximum_price] unless maximum_price.blank?
# end

# def category_conditions
#   ["products.category_id = ?", category_id] unless category_id.blank?
# end

def conditions
  [conditions_clauses.join(' AND '), *conditions_options]
end

def conditions_clauses
  conditions_parts.map { |condition| condition.first }
end

def conditions_options
  conditions_parts.map { |condition| condition[1..-1] }.flatten
end

def conditions_parts
  private_methods(false).grep(/_conditions$/).map { |m| send(m) }.compact
end


end
