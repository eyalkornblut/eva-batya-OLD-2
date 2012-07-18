module ApplicationHelper

  def divided_taxons_list(root_taxon, current_taxon, max_level = 1)
    return '' if max_level < 1 || root_taxon.children.empty?
    content_tag :ul, :class => 'taxons-list' do
      taxon_index = 0
      taxons_count = root_taxon.children.length
      root_taxon.children.map do |taxon|
        taxon_index = taxon_index + 1
        css_class = ''
        if taxon_index == taxons_count / 2
          css_class = 'first-part-end'
        end
        if taxon_index == taxons_count / 2 + 1
          css_class = 'second-part-start'
        end
        css_class += (current_taxon && current_taxon.self_and_ancestors.include?(taxon)) ? ' current' : ''
        content_tag :li, :class => css_class do
          link_to(image_tag(taxon.icon.url(:normal)), seo_url(taxon)) +
          link_to(taxon.name, seo_url(taxon)) +
          divided_taxons_list(taxon, current_taxon, max_level - 1)
        end
      end.join("\n").html_safe
    end
  end

end
